<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>Restaurant Menu</title>
                <style>
                    table { width: 80%; margin: 20px auto; border-collapse: collapse; }
                    th, td { border: 1px solid #000; padding: 10px; text-align: left; }
                    th { background-color: #f2f2f2; color: black }
                    h1 { text-align: center; }
                    .section-header { background-color: #333; color: white; }
                </style>
            </head>
            <body>
                <h1>Restaurant Menu</h1>

           
                <table>
                    <tr class="section-header">
                        <th colspan="1">Place Names</th>
                    </tr>
                    <xsl:for-each select="restaurant/placename/place">
                        <tr>
                            <td><xsl:value-of select="."/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <br/>

                <!-- Cafe Names and Hours -->
                <table>
                    <tr class="section-header">
                        <th colspan="2">Cafes and Hours</th>
                    </tr>
                    <tr>
                        <th>Cafe Name</th>
                        <th>Hours</th>
                    </tr>
                    <xsl:for-each select="restaurant/cafename">
                        <xsl:for-each select="cafe[position() mod 2 = 1]">
                            <tr>
                                <td><xsl:value-of select="."/></td>
                                <td><xsl:value-of select="following-sibling::time[position() mod 2 = 1]"/></td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>

                <br/>

                <!-- Menu Types -->
                <table>
                    <tr class="section-header">
                        <th colspan="1">Menu Types</th>
                    </tr>
                    <xsl:for-each select="restaurant/menu/foodtype">
                        <tr>
                            <td><xsl:value-of select="."/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <br/>

                <!-- Food Items -->
                <table>
                    <tr class="section-header">
                        <th colspan="2">Food Items</th>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <th>Cost</th>
                    </tr>
                    <xsl:for-each select="restaurant/food/fooditem">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="cost"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
