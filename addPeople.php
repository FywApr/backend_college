<?php

$f_name = "Hello";//$_POST['f_Name'];
$l_name = "World";//$_POST['l_name'];
$nic_name = "Hello_World123";//$_POST['nic_name'];


$db = new Mysqli("localhost","root","","chat");
$db->query("SET NAMES utf8");


$db->query('INSERT INTO `chat`.`people`(`id`,`f_name`,`l_name`,`nic_name`,`is_online`) VALUES (DEFAULT,"'.$f_name.'", "'.$l_name.'", "'.$nic_name.'", 0)');




$db->close();






?>