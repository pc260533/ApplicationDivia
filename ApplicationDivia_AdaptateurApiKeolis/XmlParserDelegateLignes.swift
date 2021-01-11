//
//  XmlParserDelegateLignes.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// XmlParserDelegatePassages est la classe représentant le parseur Xml utilisé pour déserializer les lignes renvoyées par l'API Keolis.
public class XmlParserDelegateLignes : XmlParserDelegateApiKeolis {
    /// La liste des lignes à charger.
    private var listeLignes: ListeLignes;
    /// La ligne courante.
    private var ligneCourante: Ligne?;

    /// Constructeur XmlParserDelegateLignes prenant en paramètre la liste des lignes à charger.
    /// - Parameters:
    ///   - listeLignes: La liste des lignes à charger.
    public init(listeLignes: ListeLignes) {
        self.listeLignes = listeLignes;
        self.ligneCourante = nil;
    }

    /// Action à exécuter quand un tag de départ est rencontré par le parseur.
    public override func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        super.parser(parser, didStartElement: elementName, namespaceURI: namespaceURI, qualifiedName: qName, attributes: attributeDict);
        if (elementName == "ligne") {
            self.ligneCourante = Ligne();
        }
    }

    /// Action à exécuter quand un tag de fin est rencontré par le parseur.
    public override func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName == "ligne") {
            if let ligneCourante = self.ligneCourante {
                self.listeLignes.ajouterLigne(ligne: ligneCourante);
                self.ligneCourante = nil;
            }
        }
    }

    /// Action à exécuter quand tous ou une partie des caractères de l'élément courant ont été détectés.
    public override func parser(_ parser: XMLParser, foundCharacters string: String) {
        super.parser(parser, foundCharacters: string);
        let donneeLigne = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
        if (!donneeLigne.isEmpty) {
            if let ligneCourante = self.ligneCourante {
                if (self.elementCourant == "code") {
                    ligneCourante.CodeLigne += donneeLigne;
                }
                else if (self.elementCourant == "nom") {
                    ligneCourante.NomLigne += donneeLigne;
                }
                else if (self.elementCourant == "sens") {
                    ligneCourante.SensLigne += donneeLigne;
                }
                else if (self.elementCourant == "vers") {
                    ligneCourante.DestinationLigne += donneeLigne;
                }
                else if (self.elementCourant == "couleur") {
                    ligneCourante.CouleurLigne += donneeLigne;
                }
            }
        }
        
    }
}
