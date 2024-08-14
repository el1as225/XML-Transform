<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:dcterms="http://purl.org/dc/terms/"
                xmlns:edm="http://www.europeana.eu/schemas/edm/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/OBJECTS">
		<rdf:RDF>
			<xsl:apply-templates select="OBJECT"/>
		</rdf:RDF>
	</xsl:template>

	<xsl:template match="OBJECT">
		<edm:ProvidedCHO rdf:about="">
			<dc:identifier>
				<xsl:value-of select="field[fieldname='Inventarnummer']/fieldvalue"/>
			</dc:identifier>
			<dc:title>
				<xsl:value-of select="field[fieldname='Titel (Freitext)']/fieldvalue"/>
			</dc:title>
			<dc:description>
				<xsl:value-of select="field[fieldname='Beschreibung']/fieldvalue"/>
			</dc:description>
			<dc:subject>
				<xsl:value-of select="field[fieldname='Ikonographie']/fieldvalue"/>
			</dc:subject>
			<dc:type>
				<xsl:value-of select="field[fieldname='Sammlung']/fieldvalue"/>
			</dc:type>
			<dcterms:medium>
				<xsl:value-of select="field[fieldname='Technik']/fieldvalue"/>
			</dcterms:medium>
			<dcterms:extent>
				<xsl:value-of select="field[fieldname='Maße zum Objekt']/fieldvalue"/>
			</dcterms:extent>
			<dc:contributor>
				<xsl:value-of select="field[fieldname='Rolle/Funktion Person (Tabelle)']/fieldvalue"/>
			</dc:contributor>
			<dcterms:isPartOf>
				<xsl:value-of select="field[fieldname='Teil der Sammlung']/fieldvalue"/>
			</dcterms:isPartOf>
		</edm:ProvidedCHO>

		<edm:WebResource rdf:about="{field[fieldname='Ressourcenadresse']/fieldvalue}">
			<dc:format>
				<xsl:value-of select="field[fieldname='Medienformat']/fieldvalue"/>
			</dc:format>
			<edm:rights>
				<xsl:value-of select="field[fieldname='Lizenz']/fieldvalue"/>
			</edm:rights>
		</edm:WebResource>

		<edm:WebResource rdf:about="{field[fieldname='Kontextadresse']/fieldvalue}">
			<dc:format>
				<xsl:value-of select="field[fieldname='Medienformat']/fieldvalue"/>
			</dc:format>
			<edm:rights>
				<xsl:value-of select="field[fieldname='Lizenz']/fieldvalue"/>
			</edm:rights>
		</edm:WebResource>

		<edm:WebResource rdf:about="{field[fieldname='Weitere Ressourcen']/fieldvalue}">
			<dc:format>
				<xsl:value-of select="field[fieldname='Medienformat']/fieldvalue"/>
			</dc:format>
			<edm:rights>
				<xsl:value-of select="field[fieldname='Lizenz']/fieldvalue"/>
			</edm:rights>
		</edm:WebResource>

		<edm:Agent rdf:about="">
			<dc:title>
				<xsl:value-of select="field[fieldname='Data Provider']/fieldvalue"/>
			</dc:title>
		</edm:Agent>

		<edm:Agent rdf:about="">
			<dc:rights>
				<xsl:value-of select="field[fieldname='Rechte']/fieldvalue"/>
			</dc:rights>
		</edm:Agent>
	</xsl:template>
</xsl:stylesheet>
