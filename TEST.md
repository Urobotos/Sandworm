
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
