<?php
include_once ("functions.inc.php");
include_once ("user.conf.inc.php");

$xmlfile                    ='catalogo.xml';
$xslfile                    ='lib/rss.xsl';
$params['atamishkyhome']    = $atamishky_HOME;
$params['pagetitle']        = $PAGE_TITLE;
$params['title']            = $PAGE_TITLE;
$params['pagedescription']  = $PAGE_DESCRIPTION;
$params['favicon']          = $FAVICON;
echo transform($xmlfile, $xslfile, $params);
?>
