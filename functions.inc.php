<?php

$longname['year']               = 'Año';
$longname['researcharea']       = 'research area';
$longname['entrytype']          = 'tipo';
$longname['ID']                 = 'ID';
$longname['author']             = 'autor';
$longname['keyword']            = 'tag';
$longname['address']            = 'ciudad - país';
$longname['bibliografia']       = 'bibliografía';
$longname['publisher']          = 'editorial';
$longname['searchtitle']        = 'titulo';
$longname['searchdescripcion']  = 'descripcion';
$longname['searchautor']        = 'autor';
$longname['searchTODO']         = 'todos';
$longname['searchLIBROS']       = 'libros';
$longname['searchMUSICAS']      = 'musica';
$longname['searchVIDEOS']       = 'video';
$longname['searchMISC']         = 'otros';
$longname['prestamos']          = 'Préstamos';

//$longnameEntrytype['paper'] = 'Journal article';
//$longnameEntrytype['inproceedings'] = 'Inproceedings/Talk';
//$longnameEntrytype['inbookincollection'] = 'Book chapter';
$longnameEntrytype['book'] = 'Libro';
//$longnameEntrytype['mastersthesis'] = 'MS thesis';
//$longnameEntrytype['mastersproject'] = 'MAS project';
//$longnameEntrytype['phdthesis'] = 'PhD thesis';
//$longnameEntrytype['techreport'] = 'Technical report';
//$longnameEntrytype['patent'] = 'Patent';
$longnameEntrytype['misc'] = 'Varios';
$longnameEntrytype['musica'] = 'Musica';
$longnameEntrytype['video'] = 'Video';
$longnameEntrytype['all'] = 'Todos';



function transform($xmlfile, $xslfile, $params){
    $xp = new XsltProcessor();
    
    // create a DOM document and load the XSL stylesheet
    $xsl = new DomDocument;
    $xsl->load($xslfile);

    // import the XSL styelsheet into the XSLT process
    $xp->importStylesheet($xsl);

    // create a DOM document and load the XML datat
    $xml_doc = new DomDocument;
    $xml_doc->load($xmlfile);

    $namespace = null;
    $xp->setParameter($namespace, $params);

    // transform the XML into HTML using the XSL file
    if ($html = $xp->transformToXML($xml_doc)) {
      return $html;
     } else {
      trigger_error('XSL transformation failed.', E_USER_ERROR);
     } 

}

function sano ($input){
    $output_sano = trim($input);
    $output_sano = stripslashes($output_sano);
    $output_sano = filter_var($output_sano,FILTER_SANITIZE_STRING);
    //$output_sano = htmlspecialchars($output_sano);
    if(filter_var($output_sano,FILTER_VALIDATE_REGEXP,array("options"=>array("regexp"=>'/([\w\d\s-_()@,;."!?:]+)/')))){
        return $output_sano;
    } 
}
//******************************************************************
//Funciones de seguridad... o algo asi.
//******************************************************************

//Esta funcion valida el xsl desde el hash md5 del archivo.
//Se asegura que ese valor sea igual al valor dado por php, al vuelo.
function validar_xsl($nombre) {
    $MD5s = do_hash_seguridad_vendehumo();
    //$nombre_archivo = "lib/" . $nombre;
    $nombre_archivo = $nombre;
    $md5_txt = $MD5s[$nombre];
    $md5_php = md5_file($nombre_archivo);
    if ($md5_php === $md5_txt){
        return $nombre;
    } 
}

//Esta funcion se asegura que los xsl esten intactos, para prevenir XSS.
function do_hash_seguridad_vendehumo() {
    $handle_md5txt = fopen("lib/md5s.sec", "r");
    $MD5s = array();
    if ($handle_md5txt) {
        while(!feof($handle_md5txt)){
            $line           = fgets($handle_md5txt);
            $line           = str_replace("\n", '', $line);
            $matches_rgx    = explode(' ',$line);
            //esto evita algunos errores
            if (!$matches_rgx[0] || !$matches_rgx[1]){
                continue;    
            }
            $md5_rgx        = $matches_rgx[0];
            $nn_rgx         = "lib/" . $matches_rgx[1];
            $MD5s[$nn_rgx]  = $md5_rgx;
        }
    } else {
        die("El archivo de verificacion no existe o no se puydo abrir. 
            ERROR GRAVE Y FINAL NO FELIZ.");
    } 
    fclose($handle_md5txt);
    return $MD5s;
} 

//******************************************************************
//Funciones para evaluar los préstamos de material. 
//******************************************************************
function pass_prestamo ($a){
    if ($a){
        include_once "m.inc.php";
        $PASS_PRESTAMO_CH = md5(md5($a) . $SALTI) . $PASS_BIBLIO_MASTER_append;
        if ($PASS_PRESTAMO_CH === $PASS_PRESTAMO){
            return true;    
        } else {
          return false;
        }
    } else{
        return false;
    }
}

// Funcion que crea un array desde el archivo de prestamos.
function IcanHas_booked_items_array() {
    $archivo_prestamos_enjuto = "lib/prestamos.sec";
    $handle_bookedtxt = fopen($archivo_prestamos_enjuto, "r");
    $bo = array();
    if ($handle_bookedtxt) {
        while(!feof($handle_bookedtxt)){
            $line_booked     = fgets($handle_bookedtxt);
            $line_booked     = str_replace("\n", '', $line_booked);
            if (! $line_booked){
                continue;    
            } else {
                array_push($bo,$line_booked);    
            }
        }
    } else {
        die ("No se pudo abrir el archivo de prestamos. ERROR");
    }
    fclose($handle_bookedtxt);
    return $bo;
}

function booked_items_check_status ($librito){
    $booked_stuff_mm = IcanHas_booked_items_array();
    if (in_array($librito, $booked_stuff_mm)){
        return true;
    } else {
        return false;
    }
}

//Esta funcion cambia el status de un material, de forma binaria (prestado/no prestado).
function booked_items_change_status ($it){
    $archivo_prestamos = "lib/prestamos.sec";
    $booked_stuff = IcanHas_booked_items_array();
    if (in_array($it,$booked_stuff)){
        //esta prestado    
            // sacarlo del archivo.
            $ln_borrar = $it . "\n";
            $cont = file_get_contents($archivo_prestamos);
            $cont = str_replace($ln_borrar,'',$cont);
            file_put_contents($archivo_prestamos,$cont);
    } else {
        //no esta prestado
        //  1. chequear que el id del libro tenga formato valido y
        //  2. prestar === agregar el id al archivo (sip, asi de chiotto)
            $ln_agregar = $it . "\n";
            $contt = file_get_contents($archivo_prestamos);
            $contt .= $ln_agregar;
            file_put_contents($archivo_prestamos,$contt);
    }
} 

?>
