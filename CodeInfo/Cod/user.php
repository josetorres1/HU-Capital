<?php require_once('Connections/HU-Capital.php'); ?>
<?php
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

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
  $insertSQL = sprintf("INSERT INTO usertable (iduser, nameUser, passUser) VALUES (%s, %s, %s)",
                       GetSQLValueString($_POST['iduser'], "int"),
                       GetSQLValueString($_POST['nameUser'], "text"),
                       GetSQLValueString($_POST['passUser'], "text"));

  mysql_select_db($database_HU_Capital, $HU_Capital);
  $Result1 = mysql_query($insertSQL, $HU_Capital) or die(mysql_error());

  $insertGoTo = "user.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
    $insertGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $insertGoTo));
}

if ((isset($_GET['iduser'])) && ($_GET['iduser'] != "")) {
  $deleteSQL = sprintf("DELETE FROM usertable WHERE iduser=%s",
                       GetSQLValueString($_GET['iduser'], "int"));

  mysql_select_db($database_HU_Capital, $HU_Capital);
  $Result1 = mysql_query($deleteSQL, $HU_Capital) or die(mysql_error());

  $deleteGoTo = "user.php";

  header(sprintf("Location: %s", $deleteGoTo));
}

mysql_select_db($database_HU_Capital, $HU_Capital);
$query_Recordset1 = "SELECT * FROM usertable";
$Recordset1 = mysql_query($query_Recordset1, $HU_Capital) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);
$totalRows_Recordset1 = mysql_num_rows($Recordset1);
?>
<!DOCTYPE html>
<html lang="en">
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
 <title>HU-Capital</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body class="landing3">
	
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header2" class="alt2">
						<h1><a href="index.php">HU-Capital</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<li><a href="index.php">INICIO</a></li>
                                                                                        <li><a href="http://localhost/HU-Capital/login.php">INGRESAR</a></li>
											<li><a href="convenios.php">Convenios</a></li>
											<!--<li><a href="elements.html">Elements</a></li>-->
											<!--<li><a href="#">Sign Up</a></li>-->
											
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
<h3>Panel de administracion de usuarios</h3>
<table class="table">
  <tr>
    <th scope="col">ID</th>
    <th scope="col">Nombre</th>
    <th scope="col">Password</th>
    <th colspan="2" scope="col">Acciones</th>
  </tr>
  <?php do { ?>
  <tr>
    <td><?php echo $row_Recordset1['iduser']; ?></td>
    <td><?php echo $row_Recordset1['nameUser']; ?></td>
    <td><?php echo $row_Recordset1['passUser']; ?></td>
    <td><img src="images/edit-icon.png" width="32" height="32" alt="edit" /></td>
    <td><a href="user.php?iduser=<?php echo $row_Recordset1['iduser']; ?>"><img src="images/delete-icon.png" width="32" height="32" alt="delete" /></a></td>
  </tr>
  <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
  </table>
<div class="row">                  
                  <div class="col-xs-12 col-md-12 text-center">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                      Nuevo Usuario
                    </button>
                                                                                                                                         
                  </div>                   
                </div>

  <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title" id="myModalLabel">Nuevo Categoria</h2>
                          </div>
                          <div class="modal-body" >
                            <div class="row ">
                              <div class="col-md-12 col-xs-12">
                                <form method="post" name="form1" action="<?php echo $editFormAction; ?>">
                                  <table align="center">
                                    <tr valign="baseline">
                                      <td nowrap align="right">NameUser:</td>
                                      <td><input type="text" name="nameUser" value="" size="32"></td>
                                    </tr>
                                    <tr valign="baseline">
                                      <td nowrap align="right">PassUser:</td>
                                      <td><input type="password" name="passUser" value="" size="32"></td>
                                    </tr>
                                    <tr valign="baseline">
                                      <td nowrap align="right">&nbsp;</td>
                                      <td><input type="submit" value="Insertar registro"></td>
                                    </tr>
                                  </table>
                                  <input type="hidden" name="iduser" value="">
                                  <input type="hidden" name="MM_insert" value="form1">
                                </form>
                                <p>&nbsp;</p>
                            </div></div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>                            
                          </div>
                        </div>
                      </div>
                    </div>
					
					
						<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
					
					
					

</body>
</html>
<?php
mysql_free_result($Recordset1);
?>
