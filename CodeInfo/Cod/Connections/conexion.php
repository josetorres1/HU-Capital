<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_HU_Capital = "localhost";
$database_HU_Capital = "hu-capital";
$username_HU_Capital = "root";
$password_HU_Capital = "";
$HU_Capital = mysql_connect($hostname_HU_Capital, $username_HU_Capital, $password_HU_Capital) or trigger_error(mysql_error(),E_USER_ERROR); 
?>