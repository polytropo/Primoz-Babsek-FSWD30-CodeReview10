<?php
	error_reporting( ~E_DEPRECATED & ~E_NOTICE );
	define('DB_HOST', 'localhost');
	define('DB_USER', 'root');
	define('DB_PASS', '');
	define('DB_NAME', 'cr10_primoz_babsek_biglibrary');

	$conn = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME);

	if ( !$conn ) {
		die("Connection failed : " . mysqli_error());
	}
?>