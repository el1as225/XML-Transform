# -*- coding: utf-8 -*-
from lxml import etree

def transform_xml(xml_file, xslt_file, output_file):
    # Laden der XML-Datei
    xml_doc = etree.parse(xml_file)
    
    # Laden der XSLT-Datei
    xslt_doc = etree.parse(xslt_file)
    
    # Erstellen eines XSLT-Transformers
    transform = etree.XSLT(xslt_doc)
    
    # Anwenden der Transformation
    result_doc = transform(xml_doc)
    
    # Speichern des Ergebnisses
    with open(output_file, 'wb') as f:
        f.write(etree.tostring(result_doc, pretty_print=True, xml_declaration=True, encoding='UTF-8'))

    print(f"Transformation complete. Output saved to {output_file}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 4:
        print("Usage: python xslt_transform.py input.xml stylesheet.xsl output.xml")
        sys.exit(1)
    
    input_xml = sys.argv[1]
    xslt_file = sys.argv[2]
    output_xml = sys.argv[3]
    
    transform_xml(input_xml, xslt_file, output_xml)
