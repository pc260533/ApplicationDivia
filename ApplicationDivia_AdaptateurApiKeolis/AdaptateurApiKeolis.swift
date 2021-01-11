//
//  AdaptateurApiKeolis.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// AdaptateurApiKeolis est la classe représentant l'implémentation des fonctionnalités de l'API Keolis.
/// Elle implémente l'interface IAdapteurApiKeolis.
public class AdaptateurApiKeolis : IAdapteurApiKeolis {
    /// Le lien de base de l'api.
    private var lienBaseApi: String;
    /// Le controleur.
    private var controleur: Controleur;
    
    /// Constructeur AdaptateurApiKeolis prenant en paramètre le controleur.
    /// - Parameters:
    ///   - controleur: Le controleur.
    public init(controleur: Controleur) {
        self.lienBaseApi = "http://timeo3.keolis.com/relais/217.php?";
        self.controleur = controleur;
    }
    
    /// Charger la liste des lignes
    /// - Parameters:
    ///   - listeLignes: La liste des lignes à charger.
    public func chargerListeLignes(listeLignes: ListeLignes) -> Void {
        let liensLignes: String = self.lienBaseApi + "xml=1";
        let url = URL(string: liensLignes)!;
        let session = URLSession.shared;
        // ca prend une focnotion qui prend trois paramètres
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.controleur.notifierExceptionPersonnalisee(exceptionPersonnalisee: ExceptionGeneraleChargementListeLignes());
                return;
            }
            if let data = data {
                let xmlParcer: XMLParser = XMLParser(data: data);
                let xmlParcerDelegateLignes: XmlParserDelegateLignes = XmlParserDelegateLignes(listeLignes: listeLignes);
                xmlParcer.delegate = xmlParcerDelegateLignes;
                xmlParcer.parse();
                if (xmlParcerDelegateLignes.ErreurDetectee) {
                    let exceptionGeneraleChargementListeLignes: ExceptionGeneraleChargementListeLignes = ExceptionGeneraleChargementListeLignes();
                    exceptionGeneraleChargementListeLignes.MessageDeveloppeur = xmlParcerDelegateLignes.CodeErreurApi + " : " + xmlParcerDelegateLignes.MessageErreurApi;
                    self.controleur.notifierExceptionPersonnalisee(exceptionPersonnalisee: exceptionGeneraleChargementListeLignes);
                }
                else {
                    self.controleur.finChargementListeLignes(listelignes: listeLignes);
                }
            }
        };
        task.resume();
    }
    
    /// Charger la liste des arrêts d'une ligne.
    /// - Parameters:
    ///   - ligne: La ligne dont on charge les arrêts.
    ///   - callBackSpecifiqueApresChargementArrets: Le callback appelé à la fin du chargement des arrêts.
    public func chargerListeArret(ligne: Ligne, callBackSpecifiqueApresChargementArrets: (() -> Void)?) -> Void {
        let listeArrets: ListeArrets = ligne.ListeDesArrets;
        let liensArretsFromLigne: String = self.lienBaseApi + "xml=1" + "&" + "ligne=" + ligne.CodeLigne + "&" + "sens=" + ligne.SensLigne;
        //let liensArretsFromLigne: String = "xml=1" + "&" + "ligne=" + ligne.CodeLigne + "&" + "sens=" + ligne.SensLigne;
        let url = URL(string: liensArretsFromLigne)!;
        let session = URLSession.shared;
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.controleur.notifierExceptionPersonnalisee(exceptionPersonnalisee: ExceptionGeneraleChargementListeArrets());
                return;
            }
            if let data = data {
                let xmlParcer: XMLParser = XMLParser(data: data);
                let xmlParcerDelegateArrets: XmlParserDelegateArrets = XmlParserDelegateArrets(listeArrets: listeArrets);
                xmlParcer.delegate = xmlParcerDelegateArrets;
                xmlParcer.parse();
                if (xmlParcerDelegateArrets.ErreurDetectee) {
                    let exceptionGeneraleChargementListeArrets: ExceptionGeneraleChargementListeArrets = ExceptionGeneraleChargementListeArrets();
                    exceptionGeneraleChargementListeArrets.MessageDeveloppeur = xmlParcerDelegateArrets.CodeErreurApi + " : " + xmlParcerDelegateArrets.MessageErreurApi;
                    self.controleur.notifierExceptionPersonnalisee(exceptionPersonnalisee: exceptionGeneraleChargementListeArrets);
                }
                else {
                    self.controleur.finChargementListeArrets(ligne: ligne);
                    callBackSpecifiqueApresChargementArrets?();
                }
            }
        };
        task.resume();
    }

    /// Charger la liste des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage à charger.
    public func chargerListePassages(arretAvecPassages: ArretAvecPassages) -> Void {
        //var liensPassagesFromArret: String = "xml=3" + "&" + "refs=" + arretAvecPassages.ArretPassage.ReferenceArret + "&" + "ran=1";
        var liensPassagesFromArret: String = self.lienBaseApi + "xml=3" + "&" + "refs=" + arretAvecPassages.ArretPassage.ReferenceArret + "&" + "ran=1";
        liensPassagesFromArret = liensPassagesFromArret.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!;
        let url = URL(string: liensPassagesFromArret)!;
        let session = URLSession.shared;
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.controleur.notifierExceptionPersonnalisee(exceptionPersonnalisee: ExceptionGeneraleChargementListePassages());
                return;
            }
            if let data = data {
                let xmlParcer: XMLParser = XMLParser(data: data);
                let xmlParcerDelegatePassages: XmlParserDelegatePassages = XmlParserDelegatePassages(arretAvecPassages: arretAvecPassages);
                xmlParcer.delegate = xmlParcerDelegatePassages;
                xmlParcer.parse();
                if (xmlParcerDelegatePassages.ErreurDetectee) {
                    let exceptionGeneraleChargementListePassages: ExceptionGeneraleChargementListePassages = ExceptionGeneraleChargementListePassages();
                    exceptionGeneraleChargementListePassages.MessageDeveloppeur = xmlParcerDelegatePassages.CodeErreurApi + " : " + xmlParcerDelegatePassages.MessageErreurApi;
                    self.controleur.notifierExceptionPersonnalisee(exceptionPersonnalisee: exceptionGeneraleChargementListePassages);
                }
                else {
                    self.controleur.finChargementListePassages(arretAvecPassages: arretAvecPassages);
                }
            }
        };
        task.resume();
    }
    
}
