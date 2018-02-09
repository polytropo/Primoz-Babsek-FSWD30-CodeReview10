<?php
	ob_start();
	session_start();
	require_once 'dbconnect.php';
	// if session is not set this will redirect to login page
	if( !isset($_SESSION['user']) ) {
		header("Location: index.php");
		exit;
	}
	// select logged-in users detail
	$query = "SELECT * FROM user WHERE user_id=".$_SESSION['user'];
	$res = mysqli_query($conn, $query);
	$userRow = mysqli_fetch_assoc($res);

	//Query to select from media
	$getAllMedia = "SELECT * FROM media "; 
	$getAllMedia .= "LEFT JOIN author ON media.fk_author_id = author.author_id ";
	$getAllMedia .= "LEFT JOIN publisher ON media.fk_publisher_id = publisher.publisher_id ";

	$allMediaResult = mysqli_query($conn, $getAllMedia);

	//Query to select all publishers
	$getAllPublishers = "SELECT * FROM publisher ";
	
	$resultPublisher = mysqli_query($conn, $getAllPublishers);
	
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
  	<meta charset="UTF-8">
  	<title>BigLibrary</title>
	
</head>

<body>
	<div class="container row">
		<div class="px-5 py-3">	
			<h2>Hi <?php echo ucwords($userRow['first_name'] . " " . $userRow['last_name']) . ", welcome."; ?></h2>
			<p >Welcome - <?php echo $userRow['email']; ?></p>
			<a href="logout.php?logout">Sign Out</a>
		</div>
		<div class="px-5 p-3">
			<h3 class="py-2">List of all media: </h3>
			<table class="table table-sm table-hover table-striped">
				<tr>
    				<th>Image</th>
    				<th>ISBN</th>
    				<th>Type</th>
    				<th>Title</th> 
    				<th>Author</th>
    				<th>Publisher</th>
    				<th>Publish Date</th>
    				<th>Description</th>
  				</tr>

			<?php 
				while($mediaRow = mysqli_fetch_assoc($allMediaResult)) {
			?>
					<tr>
						<td><img src="<?php echo $mediaRow['image_url'] ?>" alt="media image" style="max-height:45px; max-width:45px;">
						<td><?php echo $mediaRow['isbn']; ?></td>
						<td><?php echo $mediaRow['type']; ?></td>
						<td><?php echo $mediaRow['title']; ?></td>
						<td><?php echo $mediaRow['author_name'] . " " . $mediaRow['author_surname']; ?></td>
						<td><?php echo $mediaRow['publisher'] . " " . $mediaRow['surname']; ?></td>
						<td><?php echo $mediaRow['publish_date']; ?></td>
						<td><?php echo substr($mediaRow['description'], 0 , 40) . "..."; ?></td>
					</tr>
			<?php
				}
			?>
			</table>

		</div>

		<div class="px-5 p-3">
			<h3 class="py-2">List of all publishers: </h3>
			<table class="table">
				<tr>
    				<th>Publisher id</th>
    				<th>Publisher name</th>
    				<th>Location</th>
    				<th>Size</th>
    			</tr>

			<?php
				while($publisherRow = mysqli_fetch_assoc($resultPublisher)) {
			?>
					<tr>
						<td><?php echo $publisherRow['publisher_id']; ?></td>
						<td><?php echo $publisherRow['publisher']; ?></td>
						<td><?php echo $publisherRow['address']; ?></td>
						<td><?php echo $publisherRow['size']; ?></td>
					</tr>
			<?php
				}
			?>
			</table>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    
</body>
</html>

<?php ob_end_flush(); ?>