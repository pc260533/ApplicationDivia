//
//  XmlParserDelegateArrets.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// XmlParserDelegateArrets est la classe représentant le parseur Xml utilisé pour déserializer les arrêts renvoyés par l'API Keolis.
public class XmlParserDelegateArrets : XmlParserDelegateApiKeolis {
    /// L aliste des arrêts à charger.
    private var listeArrets: ListeArrets;
    /// L'arrêt courant.
    private var arretCourant: Arret?;
    /// Le booléen indiquant si code et nom ont été déjà lus au cours du parsage.
    private var codeNomDejaLu: Bool;
    
    /// Constructeur XmlParserDelegateArrets prenant en paramètre la liste des arrêts à charger.
    /// - Parameters:
    ///   - listeArrets: La liste des arrêts à charger.
    public init(listeArrets: ListeArrets) {
        self.listeArrets = listeArrets;
        self.arretCourant = nil;
        self.codeNomDejaLu = false;
    }

    /// Action à exécuter quand un tag de départ est rencontré par le parseur.
    public override func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        super.parser(parser, didStartElement: elementName, namespaceURI: namespaceURI, qualifiedName: qName, attributes: attributeDict);
        if (elementName == "arret") {
            self.arretCourant = Arret();
        }
        else if (elementName == "refs") {
            self.codeNomDejaLu = false;
        }
    }

    /// Action à exécuter quand un tag de fin est rencontré par le parseur.
    public override func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName == "arret") {
            self.codeNomDejaLu = true;
        }
        else if (elementName == "refs") {
            if let arretCourant = self.arretCourant {
                self.listeArrets.ajouterArret(arret: arretCourant);
                self.arretCourant = nil;
            }
        }
    }

    /// Action à exécuter quand tous ou une partie des caractères de l'élément courant ont été détectés.
    public override func parser(_ parser: XMLParser, foundCharacters string: String) {
        super.parser(parser, foundCharacters: string);
        let donneeLigne = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
        //code et nom sont présent dans l'xml pour l'arret puis pour la ligne.
        //on ignore si ils ont été déjà lu pour l'arret.
        if (!self.codeNomDejaLu) {
            if (!donneeLigne.isEmpty) {
                if let arretCourant = self.arretCourant {
                    if (self.elementCourant == "code") {
                        arretCourant.CodeArret += donneeLigne;
                    }
                    else if (self.elementCourant == "nom") {
                        arretCourant.NomArret += donneeLigne;
                    }
                    else if (self.elementCourant == "refs") {
                        arretCourant.ReferenceArret += donneeLigne;
                    }
                }
            }
        }
        
    }
}
