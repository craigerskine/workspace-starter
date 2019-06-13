<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="../templates/master.xsl" />

  <xsl:template match="data">

    <!-- content-->

    <!-- /content -->

    <!-- partial example -->
    <xsl:apply-templates select="." mode="some-list" />
    <!-- /partial example -->

  </xsl:template>

  <xsl:include href="../partials/partial.xsl" />

  <xsl:template match="*" mode="page-css">
    <!-- add your per page CSS -->
  </xsl:template>
  <xsl:template match="*" mode="page-js">
    <!-- add your per page JS -->
  </xsl:template>

</xsl:stylesheet>