<?php
session_start();
include 'db_connect.php';

if (isset($_POST['add_to_cart'])) {
    $product_id = $_POST['id'];

    // Hent produktet fra databasen
    $sql = "SELECT id, merke, storrelse_mm, farge, materiale, bilde FROM produkt WHERE id = $product_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $product = $result->fetch_assoc();

        // Legg til produktet i handlekurven
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }

        // Sjekk om produktet allerede er i handlekurven
        $found = false;
        foreach ($_SESSION['cart'] as &$item) {
            if ($item['id'] == $product_id) {
                $item['quantity']++;
                $found = true;
                break;
            }
        }

        if (!$found) {
            $product['quantity'] = 1;
            $_SESSION['cart'][] = $product;
        }
    }

    header('Location: vis_handlekurv.php');
    exit();
}
?>
