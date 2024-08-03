<?php
// Variables
$greeting = "Hello, World!";
$number = 42;
$numbers = [1, 2, 3, 4, 5];

// Function to calculate the square of a number
function square($num) {
    return $num * $num;
}

// Conditional statement
if ($number > 30) {
    $status = "The number is greater than 30.";
} else {
    $status = "The number is 30 or less.";
}

// Loop through numbers array
$sum = 0;
foreach ($numbers as $num) {
    $sum += $num;
}

// Output HTML
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Example</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .result { color: #007bff; }
    </style>
</head>
<body>
    <h1><?php echo htmlspecialchars($greeting); ?></h1>
    <p class="result">Number: <?php echo $number; ?></p>
    <p class="result">Status: <?php echo htmlspecialchars($status); ?></p>
    <p class="result">Sum of numbers: <?php echo $sum; ?></p>
    <p class="result">Square of 7: <?php echo square(7); ?></p>
</body>
</html>
