<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
		method="html"
		doctype-system="about:legacy-compat"
		encoding="UTF-8"
		indent="yes" />
                
	<xsl:template match="/">
        <html>
            <head>
                <title>Learn How to Build Web Sites the Right Way from Scratch</title>
                <link rel="stylesheet" href="carassignment.css"/>
            </head>
            <body>
                <h1>Learn How to Build Web Sites the Right Way from Scratch</h1>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Edition</th>
                        <th>Authors</th>
                        <th>Publisher</th>
                        <th>ISBN</th>
                        <th>Price</th>
                        <th>Currency</th>
                        <th>Comments</th>
                    </tr>                   
                    <xsl:apply-templates/>                   
                     <tr>
                        <td>
                            <xsl:value-of select="
                            round(sum(books/book/price) div count(books/book))"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
	</xsl:template>
    
    <xsl:template match="books">
        <xsl:apply-templates select="book">
            <xsl:sort select="price" data-type="number" order="ascending"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="@mdu"/></td>
            <td><xsl:value-of select="author"/></td>
            <xsl:apply-templates select="publisher"/>
            <xsl:apply-templates select="pages"/>
            <td><xsl:value-of select="price"/></td>
            
        </tr>
    </xsl:template>
    
    <xsl:template match="author">
        <xsl:choose>
            <xsl:when test=". = 'Ian'"> 
                <td class="Ian"></td>
            </xsl:when>
            <xsl:when test=". = 'Rich'"> 
                <td class="Rich"></td>
            </xsl:when>
            <xsl:when test=". = 'Robin'"> 
                <td class="Robin"></td>
            </xsl:when>
            <xsl:when test=". = 'blue'"> 
                <td class="blue"></td>
            </xsl:when>
            <xsl:when test=". = 'silver'"> 
                <td class="silver"></td>
            </xsl:when>
            <xsl:when test=". = 'gray'"> 
                <td class="gray"></td>
            </xsl:when>
            <xsl:otherwise> 
                <td class="white"></td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>   

    <xsl:template match="dealersecurity">
    <xsl:if test="@buyback = 'yes'"> 
                <td>&#10004;</td>
    </xsl:if>

    </xsl:template> 
</xsl:stylesheet>