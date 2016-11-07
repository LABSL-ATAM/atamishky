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
			@<xsl:value-of select="entrytype" />{<xsl:value-of select="@name" />,
                        <br />
			<xsl:for-each select="child::node()">
				<xsl:choose>
					<xsl:when test="name(.)='' or name(.)='entrytype' or name(.)='researcharea' or name(.)='filelink' or name(.)='presentation' or name(.)='poster'">
						<!-- do nothing! -->
					</xsl:when>
					<xsl:when test="name(.)='authors'">
						author={<xsl:for-each select="author">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"> and </xsl:if>
						</xsl:for-each>},
                        <br />
					</xsl:when>
					<xsl:when test="name(.)='address'">
						address={<xsl:for-each select="city">
							<xsl:value-of select="."/>.
						</xsl:for-each>},
                        <br />
					</xsl:when>
					<xsl:when test="name(.)='keywords'">
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="name(.)"/>={<xsl:value-of select="."/>}<xsl:if test="position()!=last()">,</xsl:if>
                        <br />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			}

      </xsl:for-each>


</xsl:template>
</xsl:stylesheet>
