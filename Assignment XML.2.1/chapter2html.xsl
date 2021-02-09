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
            <!-- <xsl:sort select="title" data-type="text" order="ascending"/> -->
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="title"/></td>
             <td><xsl:value-of select="edition"/></td>
            <td><xsl:value-of select="authors"/></td>
             <td><xsl:value-of select="publisher"/></td>
             <td><xsl:value-of select="pages"/></td>
             <td><xsl:value-of select="isbn"/></td>
             <td><xsl:value-of select="price"/></td>
            <td><xsl:value-of select="currency"/></td>
             <td><xsl:value-of select="comments"/></td>

            
        </tr>
    </xsl:template>
    
    <xsl:template match="author">
      
    </xsl:template>   

    <xsl:template match="title">
    <xsl:if test="@mdu = 'yes'"> 
                <td>&#10004;</td>
    </xsl:if>

    </xsl:template> 
</xsl:stylesheet>