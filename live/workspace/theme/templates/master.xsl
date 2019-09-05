<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;&#10;</xsl:text>
    <html lang="en" class="bg-gray-100 text-gray-800 font-sans leading-normal text-sm">
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>
          <xsl:if test="$page-title != 'Home'">
            <xsl:value-of select="$page-title" /><xsl:text>: </xsl:text>
          </xsl:if>
          <xsl:value-of select="$website-name" /><xsl:text> - Global Title Suffix</xsl:text>
        </title>
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="/workspace/theme/assets/css/main-a74f9594.css" rel="stylesheet" data-turbolinks-track="reload" />
        <xsl:apply-templates match="*" mode="page-css" />
        <script src="/workspace/theme/assets/js/main-9a633739.js" data-turbolinks-track="reload"><xsl:attribute name="defer"></xsl:attribute><xsl:text> </xsl:text></script>
        <xsl:apply-templates match="*" mode="page-js" />
        <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
        <meta name="turbolinks-cache-control" content="no-preview" />
      </head>
      <body class="sect-{$current-page} min-h-screen flex flex-col">
        <header>
          <h3><a href="#" class="text-red-400"><img src="/workspace/theme/assets/img/logo.svg" alt="{$website-name}" class="svg fill-current" /></a></h3>
          <h5 class="mx-auto max-w-xl text-5xl text-center">Intro</h5>
          <nav>
            <ul class="flex items-center justify-center">
              <li class="mx-4"><a href="/">Home</a></li>
              <xsl:for-each select="//navigation/page[@handle != 'home']">
                <li>
                  <a href="/{@handle}/"><xsl:value-of select="name" /></a>
                </li>
              </xsl:for-each>
            </ul>
          </nav>
        </header>
        <main class="flex-1">
          <div class="container mx-auto">
            <xsl:apply-templates />
          </div>
        </main>
        <footer class="mt-auto p-4 border-t text-sm text-center">
          <p class="m-0 text-gray-600">&#169;<xsl:value-of select="$this-year" /><xsl:text> </xsl:text><a href="#">Company Name</a> · This site was crafted with <svg class="mx-2 text-red-400 fill-current" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" role="img"><title>Love</title><polygon fill-rule="evenodd" points="8 6 11 3 15 7 8 14 1 7 5 3"></polygon></svg>, and other nerdy stuff too.</p>
        </footer>

        <script>
          window.ga = function () { ga.q.push(arguments) }; ga.q = []; ga.l = +new Date;
          ga('create', 'UA-XXXXXXX-X', 'auto'); ga('set','transport','beacon'); ga('send', 'pageview')
        </script>
        <script src="https://www.google-analytics.com/analytics.js" async="async"><xsl:text> </xsl:text></script>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
