//
//  XmlParserDelegateApiKeolis.swift
//  ApplicationDivia
//
//  Created by pcnf on 02/01/2021.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// XmlParserDelegateApiKeolis est la classe représentant le parseur Xml de base utilisé pour déserializer le retour de l'API Keolis.
public class XmlParserDelegateApiKeolis : NSObject, XMLParserDelegate {
    /// Le code erreur renvoyé par l'API Keolis.
    private var codeErreurApi: String;
    /// Le message d'erreur renvoyé par l'API Keolis.
    private var messageErreurApi: String;
    /// Le booléen indiquant si une erreur a été détectée par l'API Keolis.
    private var erreurDetectee: Bool;
    /// L'élément courant du parsage.
    public var elementCourant: String;
    
    /// Retourner le code erreur renvoyé par l'API Keolis.
    public var CodeErreurApi: String {
        get {
            return self.codeErreurApi;
        }
    }

    /// Retourner message d'erreur renvoyé par l'API Keolis.
    public var MessageErreurApi: String {
        get {
            return self.messageErreurApi;
        }
    }

    /// Retourner le booléen indiquant si une erreur a été détectée par l'API Keolis.
    public var ErreurDetectee: Bool {
        get {
            return self.erreurDetectee;
        }
    }
    
    /// Constructeur XmlParserDelegateApiKeolis sans paramètres.
    public override init() {
        self.codeErreurApi = "";
        self.messageErreurApi = "";
        self.erreurDetectee = false;
        self.elementCourant = "";
    }
    
    /// Action à exécuter quand un tag de départ est rencontré par le parseur.
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if (elementName == "erreur") {
            if let codeErreurApi: String = attributeDict["code"] {
                self.codeErreurApi = codeErreurApi;
                if (self.codeErreurApi != "000") {
                    self.erreurDetectee = true;
                }
            }
        }
        self.elementCourant = elementName;
    }

    /// Action à exécuter quand un tag de fin est rencontré par le parseur.
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }

    /// Action à exécuter quand tous ou une partie des caractères de l'élément courant ont été détectés.
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        let donneeLigne = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
        if (self.elementCourant == "erreur") {
            self.messageErreurApi += donneeLigne;
        }
    }
    
}
