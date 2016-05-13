<?php require_once('Connections/HU_Capital.php'); ?><?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$colname_DetailRS1 = "-1";
if (isset($_GET['recordID'])) {
  $colname_DetailRS1 = $_GET['recordID'];
}
mysql_select_db($database_HU_Capital, $HU_Capital);
$query_DetailRS1 = sprintf("SELECT * FROM candidatetable WHERE idcandidate = %s", GetSQLValueString($colname_DetailRS1, "text"));
$DetailRS1 = mysql_query($query_DetailRS1, $HU_Capital) or die(mysql_error());
$row_DetailRS1 = mysql_fetch_assoc($DetailRS1);
$totalRows_DetailRS1 = mysql_num_rows($DetailRS1);
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Panel de Administración</title>

        <!-- Bootstrap -->
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="assets\bootstrap\js/bootstrap.min.js"></script>

    </head>
</head>

<body>

<table border="1" align="center" class="table">
  <tr>
    <td>idcandidate</td>
    <td><?php echo $row_DetailRS1['idcandidate']; ?></td>
  </tr>
  <tr>
    <td>nameCandidate</td>
    <td><?php echo $row_DetailRS1['nameCandidate']; ?></td>
  </tr>
  <tr>
    <td>sexCandidate</td>
    <td><?php echo $row_DetailRS1['sexCandidate']; ?></td>
  </tr>
  <tr>
    <td>datebirthCandidate</td>
    <td><?php echo $row_DetailRS1['datebirthCandidate']; ?></td>
  </tr>
  <tr>
    <td>telephoneCandidate</td>
    <td><?php echo $row_DetailRS1['telephoneCandidate']; ?></td>
  </tr>
  <tr>
    <td>addressCandidate</td>
    <td><?php echo $row_DetailRS1['addressCandidate']; ?></td>
  </tr>
  <tr>
    <td>emailCandidate</td>
    <td><?php echo $row_DetailRS1['emailCandidate']; ?></td>
  </tr>
  <tr>
    <td>countryCandidate</td>
    <td><?php echo $row_DetailRS1['countryCandidate']; ?></td>
  </tr>
  <tr>
    <td>cityCandidate</td>
    <td><?php echo $row_DetailRS1['cityCandidate']; ?></td>
  </tr>
</table>
</body>
</html><?php
mysql_free_result($DetailRS1);
?>