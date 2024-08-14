# -*- coding: utf-8 -*-
import os
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

def process_folder(input_folder, xslt_file, output_folder):
    # Überprüfen, ob der Ausgabeordner existiert, andernfalls erstellen
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Iterieren über alle Dateien im Eingabeordner
    for filename in os.listdir(input_folder):
        if filename.endswith(".xml"):
            input_file = os.path.join(input_folder, filename)
            output_file = os.path.join(output_folder, filename)

            # Transformation durchführen
            transform_xml(input_file, xslt_file, output_file)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 4:
        print("Usage: python xslt_transform.py input_folder stylesheet.xsl output_folder")
        sys.exit(1)
    
    input_folder = sys.argv[1]
    xslt_file = sys.argv[2]
    output_folder = sys.argv[3]
    
    process_folder(input_folder, xslt_file, output_folder)
