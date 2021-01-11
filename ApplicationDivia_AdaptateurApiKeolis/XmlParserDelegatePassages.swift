//
//  XmlParserDelegatePassages.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// XmlParserDelegatePassages est la classe représentant le parseur Xml utilisé pour déserializer les passages renvoyés par l'API Keolis.
public class XmlParserDelegatePassages : XmlParserDelegateApiKeolis {
    /// L'arrêt avec passages à chrager.
    private var arretAvecPassages: ArretAvecPassages;
    /// Le passage courant.
    private var passageCourant: Passage?;

    /// Constructeur XmlParserDelegatePassages prenant en paramètre l'arrêt avec passage à charger.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passages à charger.
    public init(arretAvecPassages: ArretAvecPassages) {
        self.arretAvecPassages = arretAvecPassages;
        self.passageCourant = nil;
    }

    /// Action à exécuter quand un tag de départ est rencontré par le parseur.
    public override func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        super.parser(parser, didStartElement: elementName, namespaceURI: namespaceURI, qualifiedName: qName, attributes: attributeDict);
    }

    /// Action à exécuter quand un tag de fin est rencontré par le parseur.
    public override func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName == "passage") {
            if let passageCourant = self.passageCourant {
                self.arretAvecPassages.ajouterPassage(passage: passageCourant);
                self.passageCourant = nil;
            }
        }
    }
    
    /// Action à exécuter quand tous ou une partie des caractères de l'élément courant ont été détectés.
    public override func parser(_ parser: XMLParser, foundCharacters string: String) {
        super.parser(parser, foundCharacters: string);
        let donneeLigne = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
        if (!donneeLigne.isEmpty) {
            if (self.elementCourant == "duree") {
                let dateFormatter: DateFormatter = DateFormatter();
                dateFormatter.dateFormat = "HH:mm";
                let heurePassageDate = dateFormatter.date(from: donneeLigne);
                if let heurePassageDate = heurePassageDate {
                    self.passageCourant = Passage(heurePassage: heurePassageDate);
                }
            }
        }
    }
    
}
