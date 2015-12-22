<?php
error_reporting ( E_ERROR );
$account = $_GET['account'];
$password = $_GET['password'];
$sign = $_GET['sign'];
$accountArr = array("123456","23456","34567");
$passwordArr = array("123","456","678");
$ret = -1;
foreach ($accountArr as $key => $value)
{
	if($value == $account)
	{
		if($passwordArr[$key] == $password)
		{
			$ret = 1;
		}
		else
		{
			$ret =-1;
		}
	}
	else
	{
		$ret =-1;
	}
}

echo $ret;
?>
