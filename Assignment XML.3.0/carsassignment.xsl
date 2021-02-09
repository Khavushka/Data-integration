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
                <title>Second Hand Sardine Cans</title>
                <!-- <link rel="stylesheet" href="carassignment.css"/> -->
            </head>
            <body style="background-color: #DF7E69;
				     margin: 50px;
				     font: 14px 'Lucida Grande', Helvetica, Arial, sans-serif;">
                <h1>Second Hand Sardine Cans</h1>
                <table>
                    <tr>
                        <th>Model</th>
                        <th>Year</th>
                        <th>KMs</th>
                        <th>Color</th>
                        <th>Price</th>
                        <th>Warranty</th>
                    </tr>                   
                    <xsl:apply-templates/>                   
                    <tr>
                        <td colspan="4">Average price</td>
                        <td>DKR</td>
                        <td>
                            <xsl:value-of select="
                            round(sum(cars/car/price) div count(cars/car))"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
	</xsl:template>
    
    <xsl:template match="cars">
        <xsl:apply-templates select="car">
            <xsl:sort select="price" data-type="number" order="ascending"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="car">
        <tr>
            <td><xsl:value-of select="manufacturer"/></td>
            <td><xsl:value-of select="model"/></td>
            <td><xsl:value-of select="year"/></td>
            <td><xsl:value-of select="meter"/></td>
            <xsl:apply-templates select="color"/>
            <td><xsl:value-of select="price"/></td>
            <xsl:apply-templates select="dealersecurity"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="color">
        <xsl:choose>
            <xsl:when test=". = 'black'"> 
                <td class="black"></td>
            </xsl:when>
            <xsl:when test=". = 'red'"> 
                <td class="red"></td>
            </xsl:when>
            <xsl:when test=". = 'green'"> 
                <td class="green"></td>
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