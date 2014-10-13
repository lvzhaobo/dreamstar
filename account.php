<?php
	$fh = fopen("account.txt","a+");
	fwrite($fh,"UA:".$_GET['ua']."	"."IP:".$_GET['ip']."	"."URL:".$_GET['url']."\r\n");
	fclose($fh);