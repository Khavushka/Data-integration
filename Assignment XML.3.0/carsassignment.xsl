<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
	<xsl:template match="/">
        <html>
            <head>
                <title>Second Hand Sardine Cans</title>
                <style>
                        table, th, td {
                        border: 1px solid blue;
                        }
                </style>
            </head>
            <body>
                <h1 style=" background-color: black;
    color: white; text-align:center">Second Hand Sardine Cans</h1>
                <table style="text-align:center">
                    <tr >
                        <th>Manufaktur</th>
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
            <td><xsl:value-of select="@manufacturer"/></td>
            <td><xsl:value-of select="@model"/></td>
            <td><xsl:value-of select="@year"/></td>
            <td><xsl:value-of select="meter"/></td>
            <td bgcolor="{color}"><xsl:value-of select="color" /></td>
            <td><xsl:value-of select="price"/></td>            
            <xsl:apply-templates select="dealersecurity"/>
        </tr>
    </xsl:template>
    
       

    <xsl:template match="dealersecurity">
    <xsl:if test="@buyback = 'yes'"> 
                <td>&#10004;</td>
    </xsl:if>
    
    </xsl:template> 
</xsl:stylesheet>