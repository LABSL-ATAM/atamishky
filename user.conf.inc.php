<?php

include_once("functions.inc.php");

$atamishky_HOME="http://some.website.com";
$atamishky_EMBEDDING_URL=$atamishky_HOME."/";

// OPTIONAL: page title
$PAGE_TITLE="Atamishky";
// OPTIONAL: page description
$PAGE_DESCRIPTION="Búsqueda de bibliografía";
// OPTIONAL: page keywords
$PAGE_KEYWORDS="Bibliografia";
// OPTIONAL: favicon - used for the page and the RSS feed
$FAVICON=$atamishky_EMBEDDING_URL."favicon.ico";
$favicon=$FAVICON;

// Estilo MENU: "HORIZONTAL", "VERTICAL"
$MENU_STYLE = "VERTICAL";

// MANDATORY: Menu matrix - comment out the rows to exclude.
$MENU = array(
	      //"year" => yearArraySince($START_YEAR), //array('2009', '2008', '2007', '2006', '2005', '2004', '2003', '2002', '2001'),
	      //"researcharea" => array('Your research area', 'Your other research area'),
	      "keyword" => array('música','imagen'), //por ejemplo.
          //"keywords" => array(), // deberia ser "keyword" y no "keywords".
	      "entrytype" => array('book', 'misc','musica', 'video'),
	      "author" => array(),
          "bibliografia" => array()
	      );

$EXTERNAL_HEADER="includes/h.html";
$EXTERNAL_FOOTER="includes/f.html";

?>
