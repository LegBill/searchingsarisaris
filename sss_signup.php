<?php
$server_name = "localhost";
$username = "root";
$password = "";
$database_name = "searchsarisaris";

$conn = mysqli_connect($server_name, $username, $password, $database_name);

if(!$conn)
{
	die("Connection Failed:" . mysqli_connect_error());

}


if(isset($_POST['signupsave']))
{
$full_name = $_POST['full_name'];
$email = $_POST['email'];
$phone_number = $_POST['phone_number'];
$address = $_POST['address'];
$user_name = $_POST['user_name'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];

$sql_query = "INSERT INTO buyer (B_FULLNAME, B_MPHONE_NUM, B_EMAIL_ADD, B_USERNAME, B_PASSWORD, B_ADDRESS)
)
VALUES ('$full_name','$phone_number','$email','$user_name','$password')";

if (mysqli_query($conn, $sql_query)) 
{
   echo "New Details Entry inserted successfully !";
} 
else
{
   echo "Error: " . $sql . "" . mysqli_error($conn);
}
mysqli_close($conn);
}
?>




