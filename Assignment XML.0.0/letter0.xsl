﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="text"/>
   
  <!-- 1st step -->
  <xsl:template match="/emails/email">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <!-- 2nd step -->
  <xsl:template match="from">
    From: <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="subject">
    Subject: <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="message">
    Message: <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="to">
    To: <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>