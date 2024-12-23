<?php header("Content-Type: text/html; charset=UTF-8"); ?>
<?php
	$num1 = 0;
	$num2 = 0;

	if (isset($_GET['num1'])) {
		$num1 = $_GET['num1'];
	}

	if (isset($_GET['num2'])) {
		$num2 = $_GET['num2'];
	}

	$num3 = $num1 + $num2;
	printf("<h1 class='text-danger'>%d + %d = %d</h1>", $num1, $num2, $num3);
?>