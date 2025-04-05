
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Browsser Detection</title>

<link rel="stylesheet" href="Main.css" type="text/css">

<?php 

$msie        = strpos($_SERVER["HTTP_USER_AGENT"], 'MSIE') ? true : false; 
$firefox    = strpos($_SERVER["HTTP_USER_AGENT"], 'Firefox') ? true : false;
$safari        = strpos($_SERVER["HTTP_USER_AGENT"], 'Safari') ? true : false;
$chrome        = strpos($_SERVER["HTTP_USER_AGENT"], 'Chrome') ? true : false;

if ($msie) {
echo '
<!--[if IE 7]>
<link rel="stylesheet" href="ie7.css" type="text/css">
<![endif]-->
<!--[if IE 8]>
<link rel="stylesheet" href="ie8.css" type="text/css">
<![endif]-->
';
}
if ($safari) {
echo '<link rel="stylesheet" href="safari.css" type="text/css">';
}

?>

</head>
<body>

    <br>
    <?php
    if ($firefox) { //Firefox?
    echo 'you are using Firefox!';
    }

    if ($safari || $chrome) { // Safari?
    echo 'you are using a webkit powered browser';
    }

    if (!$msie) { // Not IE?
    echo '<br>you are not using Internet Explorer<br>';
    }
    if ($msie) { // IE?
    echo '<br>you are using Internet Explorer<br>';
    }
    ?>

    <br>

</body>
</html>
