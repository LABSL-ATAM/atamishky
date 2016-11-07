<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY squo "&#145;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="showentrydetail.xsl" />
<xsl:output omit-xml-declaration="yes" />
<xsl:param name="categoryby">entrytype</xsl:param>
<xsl:param name="categorytype">mastersthesis</xsl:param>
<xsl:param name="sorttype">year</xsl:param>
<xsl:param name="breadcrumb1">by year</xsl:param>
<xsl:param name="breadcrumb2">all</xsl:param>
<xsl:param name="atamishkyhome">http</xsl:param>
<xsl:param name="atamishkyembeddingurl">http</xsl:param>
<xsl:param name="nodetails">false</xsl:param>

<xsl:template match="/">
<br />
<!-- Esto no tendria que aparecer si es por ID, no tiene mucho sentido. -->
<xsl:if test="$breadcrumb1 != 'por ID'">
    <span class="tag8"> / <xsl:value-of select="$breadcrumb1" /> / <xsl:value-of select="$breadcrumb2" /></span>
</xsl:if>
<div class="content_pager" id="cntt">


<xsl:choose>
	<xsl:when test="$categorytype='all'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
            <!--cambiado : Mostrar 15 entradas en lugar de tooooda la lista (15 asi aparece el ++ js)-->
			<xsl:with-param name="query" select="entries/entry[position() &lt; 16]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='year'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[year=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='bibliografia'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[bibliografia=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='address'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[address/city=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='lang'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[lang=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='soporte'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[soporte=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='publisher'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[publisher=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='entrytype'">
		<xsl:choose>
			<xsl:when test="$categorytype='book'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='book']" />
					<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
					<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
				</xsl:call-template>			
			</xsl:when>
		
            <!--BUSCAR LIBROS O VIDEOS -->
			<xsl:when test="$categorytype='musica'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='musica']" />
					<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
					<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:when test="$categorytype='video'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='video']" />
					<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
					<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
				</xsl:call-template>			
			</xsl:when>
            <!--basta-->
        
            <xsl:when test="$categorytype='misc'">
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype='misc']" />
					<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
					<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
				</xsl:call-template>			
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="listPubs">
					<xsl:with-param name="sortype" select="$sorttype" />
					<xsl:with-param name="query" select="entries/entry[entrytype=$categorytype]" />
					<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
					<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:when test="$categoryby='author'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[authors/author=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='searchTODO'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
            <!--este anduvo pero case sensitive y choto-->
            <!--<xsl:with-param name="query" select="entries/entry/child::*[contains(.,$categorytype)]/.." />-->
            <xsl:with-param name="query" select="entries/entry/child::*[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),$categorytype)]/.." />
            <xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
    <!--buscar por texto en entradas de cierto tipo-->
	<xsl:when test="$categoryby='searchLIBROS'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
            <xsl:with-param name="query" select="entries/entry/child::*[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),$categorytype) and ../entrytype='book']/.." />
            <xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
    <!--buscar por texto en entradas de cierto tipo-->
	<xsl:when test="$categoryby='searchMUSICAS'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
            <xsl:with-param name="query" select="entries/entry/child::*[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),$categorytype) and ../entrytype='musica']/.." />
            <xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
    <!--buscar por texto en entradas de cierto tipo-->
	<xsl:when test="$categoryby='searchVIDEOS'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
            <xsl:with-param name="query" select="entries/entry/child::*[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),$categorytype) and ../entrytype='video']/.." />
            <xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
    <!--buscar por texto en entradas de cierto tipo-->
	<xsl:when test="$categoryby='searchMISC'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
            <xsl:with-param name="query" select="entries/entry/child::*[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),$categorytype) and ../entrytype='misc']/.." />
            <xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='searchtitle'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry/title[contains(translate(child::text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),$categorytype)]/.." />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='searchdescripcion'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry/descripcion[contains(translate(child::text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),$categorytype)]/.." />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='searchautor'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry/authors/author[contains(translate(child::text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),$categorytype)]/.." />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='keyword'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[keywords/keyword=$categorytype]" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="$categoryby='ID'">
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry[@name=$categorytype]" />
			<xsl:with-param name="categorybyID" select="$nodetails" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:when>
	<xsl:otherwise> <!-- All -->
		<xsl:call-template name="listPubs">
			<xsl:with-param name="sortype" select="$sorttype" />
			<xsl:with-param name="query" select="entries/entry" />
			<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
			<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
		</xsl:call-template>
	</xsl:otherwise>
</xsl:choose>

<!--final del content pager.-->
</div> <!-- /content -->

</xsl:template>

<xsl:template name="listPubs">
<xsl:param name="sortype" />
<xsl:param name="query" />
<xsl:param name="categorybyID">false</xsl:param> <!-- when this param is true, entry details are printed, otherwise no -->
<xsl:param name="atamishkyhome" />
<xsl:param name="atamishkyembeddingurl" />

<xsl:variable name="vMonthNames" 
    select="'|January|February|March|April|May|June|July|August|September|October|November|December'"/>

<!-- No imprimir ni el total, ni el ++ si hay un único resultado.-->
<xsl:variable name="count" select="count($query)"/>
<xsl:if test="$count &gt; 1">
    <div class="total">Total: <xsl:value-of select="$count" /> 
    <xsl:if test="$count &lt; 16">
        <a href="javascript:void(0)" onclick="dale()">++</a>
    </xsl:if>
</div>
</xsl:if>

<xsl:for-each select="$query">
<xsl:sort select="*[name()=$sortype]" order="descending"/>
<xsl:sort select="authors/author" order="ascending"/>
<!-- Paper box -->
<div class="entry1" id="ATAMISHKY_{@name}">

<xsl:choose>
    <xsl:when test="entrytype='misc' and substring-after(@name, substring-before(@name,'PATENT'))='PATENT'">
	  <div class="patent"><a class="patent" href="{$atamishkyembeddingurl}?action=showcategory&amp;by=ID&amp;pub={@name}" title="Patent"></a></div>
    </xsl:when>
	<xsl:otherwise>
		 <div class="{entrytype}"><a class="{entrytype}" href="{$atamishkyembeddingurl}?action=showcategory&amp;by=ID&amp;pub={@name}" title="{entrytype}">&nbsp;</a></div>
	</xsl:otherwise>
</xsl:choose>

<div class="bottomleft">

<!-- handle booktitle, journal ... specifially -->
<xsl:choose>
	<xsl:when test="entrytype='book' or entrytype='BOOK'">
		<xsl:call-template name="printBook" />
	</xsl:when>
    <!--MUSICAS Y VIDEOS-->
    <xsl:when test="entrytype='musica' or entrytype='MUSICA'">
		<xsl:call-template name="printMusic" />
	</xsl:when>
	<xsl:when test="entrytype='video' or entrytype='VIDEO'">
		<xsl:call-template name="printVideo" />
	</xsl:when>
    <!--BASTA-->
    <xsl:when test="entrytype='misc' or entrytype='MISC'">
		<xsl:call-template name="printMisc" />
	</xsl:when>
	
    <xsl:otherwise>
		<xsl:call-template name="printMisc" />
	</xsl:otherwise>
</xsl:choose>

</div> 
<!-- /bottomleft -->

<div class="bottomright">
<a href="javascript:void(0)" class="clicky" onclick="getEntryDetail('{@name}')"><img src="{$atamishkyhome}/img/more.jpg" class="moreButton" alt="toggle details" title="toggle details" />mas info</a>
</div>

<xsl:choose>
  <xsl:when test="$categorybyID='true'">

    <!-- entrybody and bib to appear here -->
    <div class="entrybody" id="entrydetail{@name}">

      <xsl:call-template name="printEntryDetails">
	<xsl:with-param name="pubid" select="@name" />
	<xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
	<xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
      </xsl:call-template>
    </div>
    <!--hr /-->
    <!--bibcode-->
    <div class="bibbody" id="bib{@name}" style="visbility:hidden;">&#160;</div>
    <!--/bibcode-->
    <abbr class="unapi-id" title="{@name}"></abbr>
    <!-- finally set it as toggled -->
    <script type="text/javascript">toggleEntryDetail['<xsl:value-of select="@name" />']='s';</script>
  </xsl:when>
  <xsl:otherwise>
    <!-- entrybody and bib to appear here -->
    <!--<div class="entrybody" id="entrydetail{@name}">&#160;</div>-->
    <div class="entrybody" id="entrydetail{@name}" style="visbility:hidden;">&#160;</div>
    <!--hr /-->
    <!--bibcode-->
    <!--<div class="bibbody" id="bib{@name}">&#160;</div>-->
    <div class="bibbody" id="bib{@name}" style="visbility:hidden;">&#160;</div>
    <!--/bibcode-->
    <abbr class="unapi-id" title="{@name}"></abbr>
  </xsl:otherwise>
</xsl:choose>

</div> 
<!-- /entry -->

</xsl:for-each>

</xsl:template>

<!--Agregado bibliografia-->
<xsl:template name="printBook">
	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:call-template name="printPublisher" />
    <!--<xsl:call-template name="printAddress" />-->
	<xsl:apply-templates select="address" />
    <!--<xsl:call-template name="printBiblio" />-->
	<xsl:call-template name="printYear" />
</xsl:template>

<!--agregados para videos y musicas.-->
<!--Musicas-->
<xsl:template name="printMusic">
	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:call-template name="printPublisher" />
    <!--<xsl:call-template name="printAddress" />-->
	<xsl:apply-templates select="address" />
	<xsl:call-template name="printYear" />
</xsl:template>
<!--Videos-->
<!--Nota: Incluye una etiqueta para guardar el soporte-->
<xsl:template name="printVideo">
	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
	<xsl:call-template name="printPublisher" />
    <!--<xsl:call-template name="printAddress" />-->
	<xsl:apply-templates select="address" />
	<xsl:call-template name="printYear" />
    <xsl:call-template name="printSoporte" />
</xsl:template>
<!--BASTA-->

<xsl:template name="printMisc">
	<xsl:apply-templates select="authors" />
	<xsl:call-template name="printTitle" />
    <!--<xsl:if test="howpublished">-->
    <!--<xsl:value-of select="howpublished" />,&#160;-->
    <!--</xsl:if>-->
	<xsl:call-template name="printPublisher" />
    <!--<xsl:call-template name="printAddress" />-->
	<xsl:apply-templates select="address" />
	<xsl:call-template name="printYear" />
</xsl:template>


<xsl:template match="authors">
		<!-- handle authors specially -->
		<xsl:choose>
			<xsl:when test="count(author)=1">
				<a href="javascript:void(0)" onclick="showCategory('author','{author[1]}')">
					<xsl:value-of select="author[1]"/>
				</a>.&#160;
			</xsl:when>
			<xsl:when test="count(author)=2">
				<a href="javascript:void(0)" onclick="showCategory('author','{author[1]}')">
					<xsl:value-of select="author[1]"/>
				</a>&#160;y&#160;
				<a href="javascript:void(0)" onclick="showCategory('author','{author[2]}')">
					<xsl:value-of select="author[2]"/>
				</a>.&#160;
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="author">
					<xsl:if test="position()=last()">y&#160;</xsl:if>
					<a href="javascript:void(0)" onclick="showCategory('author','{.}')">
						<xsl:value-of select="."/>
					</a>;&#160;
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
</xsl:template>


<xsl:template name="printTitle">
      		"<b><a href="javascript:void(0)" onclick="getEntryDetail('{@name}')"><xsl:value-of select="title"/></a></b>".&#160;
</xsl:template>

<xsl:template name="printPages">
	<xsl:if test="pages">
      		pp.<xsl:value-of select="pages"/>.&#160;
	</xsl:if>
</xsl:template>

<xsl:template name="printPublisher">
	<xsl:if test="publisher">
		<a href="javascript:void(0)" onclick="showCategory('publisher','{publisher}')">
        <xsl:value-of select="publisher"/>
        </a>.&#160;
	</xsl:if>
</xsl:template>

<!--Como puede haber mas de una ciudad, hay que hacer algo como esto para que funke-->
<!--<xsl:template name="printAddress">-->
<xsl:template match="address">
    <xsl:choose>
        <xsl:when test="count(city)=1">
            <a href="javascript:void(0)" onclick="showCategory('address','{city}')"><xsl:value-of select="city"/></a>,&#160;
        </xsl:when>
        <xsl:otherwise>
            <xsl:for-each select="city">
                <a href="javascript:void(0)" onclick="showCategory('address','{.}')"><xsl:value-of select="."/></a>
                <xsl:if test="position()  = last()">,&#160;</xsl:if>
                <xsl:if test="position() != last()">-</xsl:if>
            </xsl:for-each>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--<xsl:template name="printAddress">-->
<!--<xsl:if test="address">-->
<!--<a href="javascript:void(0)" onclick="showCategory('address','{address}')">-->
<!--<xsl:value-of select="address" />-->
<!--</a>.&#160;-->
<!--</xsl:if>-->
<!--</xsl:template>-->


<!--Videos :: soporte (vhs|dvd)-->
<xsl:template name="printSoporte">
		<xsl:if test="soporte">
		    [<a href="javascript:void(0)" onclick="showCategory('soporte','{soporte}')">
			<xsl:value-of select="soporte"/>
            </a>].&#160;
		</xsl:if>
</xsl:template>

<!--Bibliografia-->
<xsl:template name="printBiblio">
		<xsl:if test="bibliografia">
			<xsl:value-of select="bibliografia" />,&#160;
		</xsl:if>
</xsl:template>

<!--SIMPLIFICADO
     Agregada gilada para que devuelva algo si no hay año.
     -->
<xsl:template name="printYear">
		<xsl:if test="year">
		<a href="javascript:void(0)" onclick="showCategory('year',{year})"><xsl:value-of select="year"/></a>
		</xsl:if>
		<xsl:if test="not(year)">
        Sin fecha.
		</xsl:if>
</xsl:template>

</xsl:stylesheet>
