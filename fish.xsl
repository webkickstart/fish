<?xml version="1.0" encoding="UTF-8" ?>
<!--
Test Comments
   Author: 
   Date:  10/24/2015
   Filename:    fish.xsl
   Support Files: fish.xml fresh.xml
-->


<xsl:stylesheet version="1.0"
	 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	 xmlns:xi="http://www.w3.org/2001/XInclude"
	 xmlns:cr="http://www.example.com/crustations"
	 >
	 
	 <xsl:output method="html"
	 	 doctype-system="about:legacy-compat"
	 	 encoding="UTF-8"
	 	 indent="yes" />
	 	 
	 	 <xsl:param name="water" select="Saltwater" />
	 	 <xsl:variable name="crustations" select="document('crustations.xml')/cr:crustations/cr:crustation" />
	  	 
	 <xsl:template match="/">
	 	
	   <html>
	   	<head>
	   		<link href="style.css" rel="stylesheet" type="text/css" />
	   		<title>Fish Details</title>
	   	</head>
	   	<body>
	   	<div id="container">
	   		<img src="header.jpg" />	 
	   		<xsl:value-of select="$water" />
	   		<h1>The Fish Project</h1>
	 			<xsl:apply-templates select="allfish/fish">	
	 				<xsl:sort order="ascending" />
	 			</xsl:apply-templates>	
	 	   </div>
	   	</body>
	   </html>
	 </xsl:template>
	 
	 
	<xsl:template match="fish">
	<table>
		<tr>
		<td>
		<img src="{image}" width="300" height="300" alt="it didnt work" />
	   	</td>
	   	<td>
		<xsl:if test="fishType/@warning = 'bite'">
			<img src="bite.jpg" height="60" width="60" /><br />
		</xsl:if>
		<xsl:if test="fishType/@warning = 'poison'">
			<img src="poison.jpg" height="60" width="60" /><br />
		</xsl:if>
		
		
	   	<b>Watertype: &#160;</b>
	   	<xsl:value-of select="waterType"  /><br />	
	   	<b>Common Name: &#160;</b>
	   	<xsl:value-of select="commonName"  /><br />	
	   	<b>Tank Type: &#160;</b>
	   	<xsl:value-of select="fishType"  /><br />
	   	<b>Collection Meathod: &#160;</b>	
	   	<xsl:value-of select="collectionMethod"  /><br />	
	   	<b>Market Price:&#160;</b>$
	   	<xsl:value-of select="marketPrice"  /><br />
	   	<b>Wholesale Price:&#160;</b>$
	   	<xsl:value-of select="wholesale"  /><br />
	   	<b>Average Retail:&#160;</b>$
	   	<xsl:value-of select="retail"  /><br />	 
	   	<b>Community Rating:&#160;</b>
	   	<xsl:call-template name="freddy">
	   		<xsl:with-param name="stars" select="commonName/@rating" />
	   	</xsl:call-template>
	    
	    <!--<xsl:apply-templates select="document('crustations.xml')/cr:crustations/cr:crustation">
	    </xsl:apply-templates>-->
		</td>
		
	   	</tr>
	   	
			<!--<xsl:value-of select="$crustations/cr:image" />-->
	</table>
	</xsl:template>

	<xsl:template name="freddy">
		<xsl:param name="stars" />
		<img src="freddy.gif" width="50" height="50"/>
			<xsl:if test="$stars > 1">
			<xsl:call-template name="freddy">
				<xsl:with-param name="stars" select="$stars - 1" />
			</xsl:call-template>
			</xsl:if>
	</xsl:template>
	
	<xsl:template match="cr:crustation">
		test
		<xsl:value-of select="$crustations/cr:image['hermitcrab.jpg']" />
	</xsl:template>
	


</xsl:stylesheet>