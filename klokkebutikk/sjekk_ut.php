<?php
session_start();
include 'db_connect.php';

// sjekker om handlekurvener tom
if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
    echo "Handlekurven er tom.";
    exit();
}

// Beregn totalbeløpet
$total_amount = 0;
foreach ($_SESSION['cart'] as $item) {
    $total_amount += $item['quantity'] * 100; // Du kan endre 100 til produktets pris fra databasen
}

// Start transaksjonen
$conn->begin_transaction();

try {
    // Sett inn ordredata i orders-tabellen
    $stmt = $conn->prepare("INSERT INTO orders (total_amount) VALUES (?)");
    $stmt->bind_param("d", $total_amount);
    $stmt->execute();
    $order_id = $stmt->insert_id;
    $stmt->close();

    // Sett inn hver vare i order_items-tabellen
    $stmt = $conn->prepare("INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)");
    foreach ($_SESSION['cart'] as $item) {
        $stmt->bind_param("iii", $order_id, $item['id'], $item['quantity']);
        $stmt->execute();
    }
    $stmt->close();

    // Fullfør transaksjonen
    $conn->commit();

    // Tøm handlekurven
    unset($_SESSION['cart']);

    echo "Takk for kjøpet! Din ordre er lagt inn.";

} catch (Exception $e) {
    // Rull tilbake transaksjonen ved feil
    $conn->rollback();
    echo "Feil under behandling av ordren: " . $e->getMessage();
}

$conn->close();
?>
<a href="produkter.php" target="_blank" rel="noopener noreferrer"></a>