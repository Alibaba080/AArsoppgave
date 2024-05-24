<?php
session_start();

if (isset($_SESSION['cart']) && count($_SESSION['cart']) > 0) {
    echo "<h1>Handlekurv</h1>";
    echo "<table border='1'>";
    echo "<tr><th>Produkt</th><th>Størrelse</th><th>Farge</th><th>Materiale</th><th>Antall</th><th>Handling</th></tr>";
    foreach ($_SESSION['cart'] as $item) {
        echo "<tr>";
        echo "<td>" . $item['merke'] . "</td>";
        echo "<td>" . $item['storrelse_mm'] . " mm</td>";
        echo "<td>" . $item['farge'] . "</td>";
        echo "<td>" . $item['materiale'] . "</td>";
        echo "<td>" . $item['quantity'] . "</td>";
        echo "<td><form method='post' action='oppdater_handlekurv.php'>";
        echo "<input type='hidden' name='id' value='" . $item['id'] . "'>";
        echo "<input type='submit' name='remove' value='Fjern'>";
        echo "</form></td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "<a href='sjekk_ut.php'>Sjekk Ut</a>";
} else {
    echo "Handlekurven er tom.";
}
?>
