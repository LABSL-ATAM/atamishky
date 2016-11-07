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
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" />

<xsl:param name="pubid">371690</xsl:param>
<xsl:param name="atamishkyhome">http</xsl:param>
<xsl:param name="atamishkyembeddingurl">http</xsl:param>

<xsl:template match="/">

      <xsl:for-each select="entries/entry[@name=$pubid]">
	<xsl:call-template name="printEntryDetails">
	  <xsl:with-param name="pubid" select="$pubid" />
	  <xsl:with-param name="atamishkyhome" select="$atamishkyhome" />
	  <xsl:with-param name="atamishkyembeddingurl" select="$atamishkyembeddingurl" />
	</xsl:call-template>

      </xsl:for-each>

</xsl:template>

<xsl:template name="printEntryDetails">
<xsl:param name="pubid" />
<xsl:param name="atamishkyhome" />
<xsl:param name="atamishkyembeddingurl" />

<hr />
<table>
   <tr><td><b>Tags</b></td>
        <td><xsl:for-each select="keywords/keyword">
        <a style="display: inline-block;" href="javascript:void(0)" onclick="showCategory('keyword','{.}')"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each></td></tr>
        <!--<tr><td><b>Research area</b></td>-->
        <!--<td><a href="javascript:void(0)" onclick="showCategory('researcharea','{researcharea}')"><xsl:value-of select="researcharea"/></a></td></tr>-->
        <!---->

   <xsl:if test="bibliografia">
    <tr><td><b>Bibliografia</b></td>
        <td><xsl:for-each select="bibliografia">
        <a href="javascript:void(0)" onclick="showCategory('bibliografia','{.}')"><xsl:value-of select="." /></a>
        </xsl:for-each></td></tr>
    </xsl:if>

    <xsl:if test="lang">
        <xsl:if test="entrytype = 'book'">
        <tr><td><b>Lenguaje</b></td>
            <td>
            <a href="javascript:void(0)" onclick="showCategory('lang','{lang}')">
            <xsl:choose>
            <xsl:when test="lang='es'">    
                espa&#241;ol
            </xsl:when>
            <xsl:when test="lang='en'">    
                ingl&#233;s
            </xsl:when>
            <xsl:when test="lang='fr'">    
                franc&#233;s
            </xsl:when>
            </xsl:choose>
            </a>
            </td></tr>
        </xsl:if>
    </xsl:if>

    <xsl:if test="pages">
    <tr><td><b>Parte</b></td>
        <td>
        <xsl:value-of select="pages" /></td></tr>
    </xsl:if>

    <xsl:if test="soporte">
    <tr><td><b>Soporte</b></td>
        <td>
        <a href="javascript:void(0)" onclick="showCategory('soporte','{soporte}')"><xsl:value-of select="soporte" /> </a>
        </td></tr>
    </xsl:if>

    <xsl:if test="descripcion">
    <tr><td><b>Descripcion</b></td>
        <td><xsl:value-of select="descripcion" /></td></tr>
    </xsl:if>
   
    <!--la referencia tendria que estar incluso si no hay link . Vigilar si el margin se corre cuando si hay. -->
    <tr><td><b>Documento</b></td><td>
    <img align="absmiddle" src="{$atamishkyhome}/img/spacer.gif" class="permalinkSprite" style="background-image:url('{$atamishkyhome}/img/sprites.gif');margin:2px 0 0 0;" title="permalink" /><a href="{$atamishkyembeddingurl}?action=showcategory&amp;by=ID&amp;pub={@name}">Link</a>
    <!--</td>-->
    <!--bibtex entry part-->
    <!--<td>-->
    <img align="absmiddle" src="{$atamishkyhome}/img/spacer.gif" class="bibtexSprite" style="background-image:url('{$atamishkyhome}/img/sprites.gif');margin:2px 0 0 0;" title="cita" />
        <a href="javascript:void(0)" onclick="getBib('{@name}')">BibTex</a>
        <!--APA xsl-->
    <img align="absmiddle" src="{$atamishkyhome}/img/spacer.gif" class="apaSprite" style="background-image:url('{$atamishkyhome}/img/sprites.gif');margin:2px 0 0 0;" title="cita_APA" />
        <a href="javascript:void(0)" onclick="getAPA('{@name}')">APA</a>
        <!--ISO xsl-->
    <img align="absmiddle" src="{$atamishkyhome}/img/spacer.gif" class="isoSprite" style="background-image:url('{$atamishkyhome}/img/sprites.gif');margin:2px 0 0 0;" title="cita_ISO" />
        <a href="javascript:void(0)" onclick="getISO('{@name}')">ISO-690</a>
    </td>
    
    <xsl:if test="link">
          <td>
    <img align="absmiddle" src="{$atamishkyhome}/img/spacer.gif" class="pdfSprite" style="background-image:url('{$atamishkyhome}/img/sprites.gif');margin:2px 0 0 0;" title="enlace" />
          <a href="{link}">Documento</a>
          </td>
    </xsl:if>
    </tr>

    <!-- Estado del material. -->
    <tr><td><b>Estado</b></td><td>Disponible</td></tr>

    <!--social craps -->
    <tr><td><b>Compartir</b></td>
    <td>

    <div class="sociable">
    <ul>
    <li class="sociablefirst"><a rel="nofollow"  target="_blank" href="mailto:?subject={title}&amp;body={$atamishkyhome}/index.php?action=showcategory%25%32%36by=ID%25%32%36pub={@name}" title="email"><img src="{$atamishkyhome}/img/services-sprite.gif" title="email" alt="" style="width: 16px; height: 16px; background: transparent url('{$atamishkyhome}/img/services-sprite.png') no-repeat; background-position:-325px -1px" class="sociable-hovers" /></a></li>
    <li><a rel="nofollow"  target="_blank" href="https://twitter.com/intent/tweet?text={title} - {$atamishkyembeddingurl}?action=showcategory%26by=ID%26pub={@name}" title="Twitter"><img src="{$atamishkyhome}/img/services-sprite.gif" title="Twitter" alt="" style="width: 16px; height: 16px; background: transparent url('{$atamishkyhome}/img/services-sprite.png') no-repeat; background-position:-343px -55px" class="sociable-hovers" /></a></li>
    <li><a rel="nofollow"  target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&amp;p[url]={$atamishkyembeddingurl}?action=showcategory%26by=ID%26pub={@name}&amp;p[title]={title}&amp;p[images][0]={$atamishkyhome}/img/type-icons/atamishky-logo_w100.png" title="Facebook"><img src="{$atamishkyhome}/img/services-sprite.gif" title="Facebook" alt="" style="width: 16px; height: 16px; background: transparent url('{$atamishkyhome}/img/services-sprite.png') no-repeat; background-position:-343px -1px" class="sociable-hovers" /></a></li>

    </ul>
    </div>
    </td>
    </tr>
<!--basta social crap-->
</table>		
</xsl:template>
<!-- /printEntryDetails -->
</xsl:stylesheet>
