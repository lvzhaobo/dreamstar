<?php
	$fh = fopen("account.txt","a+");
	fwrite($fh,date("Y-m-d H:i:s",time()). "	IP:".$_SERVER['REMOTE_ADDR']."	URL:".$_GET['url']."	UA:".$_GET['ua']."\r\n");
	fclose($fh);