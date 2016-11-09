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

<xsl:param name="pubid">prueba</xsl:param>
<xsl:param name="unapicall">false</xsl:param>

<xsl:template match="/">
      <xsl:for-each select="entries/entry[@name=$pubid]">
<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!--Autores-->
<xsl:choose>
    <xsl:when test="count(authors/author)=1">
            <xsl:value-of select="authors/author[1]"/>.&#160;
    </xsl:when>
    <xsl:when test="count(author)=2">
            <xsl:value-of select="authors/author[1]"/>&#160;y&#160;
            <xsl:value-of select="authors/author[2]"/>.&#160;
    </xsl:when>
    <xsl:otherwise>
        <xsl:for-each select="authors/author">
            <xsl:if test="position() = last()">y&#160;</xsl:if>
                <xsl:value-of select="."/>,&#160;
        </xsl:for-each>
    </xsl:otherwise>
</xsl:choose>

					
<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!--Titulo-->
<em><xsl:value-of select="title"/></em>.&#160;



<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!-- Ciudad/es-->
<xsl:choose>
    <xsl:when test="count(address/city)=1">
        <xsl:value-of select="address/city"/>:&#160;
        <!-- <xsl:if test="entrytype != 'video'">:&#160;</xsl:if> -->
    </xsl:when>
    <xsl:otherwise>
        <xsl:if test="entrytype = 'book'">
            <xsl:value-of select="address/city[1]"/>:&#160;
        </xsl:if>
        <xsl:if test="entrytype != 'book'">
            <xsl:for-each select="address/city">
                <xsl:value-of select="."/>
                <xsl:if test="position() = last()">:
                    <xsl:if test="entrytype != 'video'">:
                    </xsl:if>
                </xsl:if>
                <xsl:if test="position() != last()">&#160;-&#160;</xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:otherwise>
</xsl:choose>
<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!--Editorial-->
<xsl:if test="entrytype != 'video'">
    <xsl:if test="publisher">
        <xsl:value-of select="publisher"/>,&#160;
    </xsl:if>
</xsl:if>
<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!--Agno-->
<xsl:if test="year">
    <xsl:value-of select="year"/>.&#160;
</xsl:if>
<xsl:if test="not(year)">
    Sin fecha.&#160;
</xsl:if>
<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!--Paginas-->
<xsl:if test="pages">
        ,<xsl:value-of select="pages"/>.&#160;
</xsl:if>

<!--ccccccccccccccccccccccccccccccccccccccccccccccccccc-->
<!--Soporte-->
<xsl:if test="entrytype = 'video'">
    <xsl:if test="soporte">
        [<xsl:value-of select="soporte" />].&#160;
    </xsl:if>
</xsl:if>

      </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
