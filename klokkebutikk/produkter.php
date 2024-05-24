<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produkter</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php
include 'db_connect.php';

$sql = "SELECT id, merke, storrelse_mm, farge, materiale, bilde, pris FROM produkt";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<div class='product-list'>";
    while($row = $result->fetch_assoc()) {
        echo "<div class='product-item'>";
        echo "<img src='images/" . $row["bilde"] . "' alt='" . $row["merke"] . "'>";
        echo "<h2>" . $row["merke"] . "</h2>";
        echo "<p>Størrelse: " . $row["storrelse_mm"] . " mm</p>";
        echo "<p>Farge: " . $row["farge"] . "</p>";
        echo "<p>Materiale: " . $row["materiale"] . "</p>";
        echo "<p>Pris: " .$row["pris"]  . " NOK</p>";
        echo "<form method='post' action='handlekurv.php'>";
        echo "<input type='hidden' name='id' value='" . $row["id"] . "'>";
        echo "<input type='submit' name='add_to_cart' value='Legg til i handlekurv'>";
        echo "</form>";
        echo "</div>";
    }
    echo "</div>";
} else {
    echo "Ingen produkter funnet.";
}

$conn->close();
?>

</body>
</html>
