<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml"
				indent="yes"
				omit-xml-declaration="no"
	            doctype-system="about:legacy-compat"/>

	<!-- The following rule matches the root element,
		 irrespective of name,
	     and creates an html outline with an apply templates somewhere
	-->
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/chapter/title"/></title>
				<meta charset="utf-8"/>
			</head>
			<body>
				<xsl:apply-templates/>		<!-- here the following
				                                 rules wil place
				                                 content -->
			</body>
		</html>
	</xsl:template>

	<!-- on meeting the chapter/title in the xml doc xslt will
	     create an h1 element in the html. Its content will be
	     the content of the chapter/title element of the xml -->
	<xsl:template match="chapter/title">
		<h1><xsl:apply-templates/></h1>
	</xsl:template>

	<xsl:template match="chapter/section/title">
		<h2><xsl:apply-templates/></h2>
	</xsl:template>

	<xsl:template match="chapter/section/section/title">
		<h3><xsl:apply-templates/></h3>
	</xsl:template>

	<xsl:template match="chapter/section/section/section/title">
		<h4><xsl:apply-templates/></h4>
	</xsl:template>

	<xsl:template match="para">
		<p><xsl:apply-templates/></p>
	</xsl:template>

	<!-- This rule matches a para from xml and creates a p-tag in the html, but only if the para has a type attribute with
	the value 'intro' -->
	<xsl:template match="para[@type='intro']" priority="1">
		<p><i><xsl:apply-templates/></i></p>
	</xsl:template>

	<xsl:template match="para[@type='warning']" priority="1">
		<p style="background-color: #cccccc; border: thin solid; width:300px; color:#ff0000;">
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="para[@type='note']" priority="1">
		<p style="background-color: #cccccc; border: thin solid; width:300px;">
			<b><xsl:apply-templates/></b>
		</p>
	</xsl:template>

	<xsl:template match="b">
		<b><xsl:apply-templates/></b>
	</xsl:template>

</xsl:stylesheet>