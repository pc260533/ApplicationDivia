//
//  ListeArrets.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ListeArrets est la classe représentant une liste d'arrêt sérializable.
/// Elle hérite de Codable.
public class ListeArrets : Codable {
    /// La liste des arrêts.
    private var listeDesArrets: Array<Arret>;
    
    /// Retourner la liste des arrêts.
    public var ListeDesArrets: Array<Arret> {
        get {
            return self.listeDesArrets;
        }
    }
    
    /// Constructeur ListeArrets sans paramètres.
    public init() {
        self.listeDesArrets = Array();
    }
    
    /// Retourner la liste des arrêts favoris.
    public func getListeDesArretsFavoris() -> Array<Arret> {
        var listeArretsFavoris: Array<Arret> = Array();
        for arret in self.listeDesArrets {
            if (arret.FavorisArret) {
                listeArretsFavoris.append(arret);
            }
        }
        return listeArretsFavoris;
    }
    
    /// Retourner l'arrêt correspondant au code arrêt.
    /// - Parameters:
    ///   - codeArret: Le code arrêt.
    public func getArretAvecCodeArret(codeArret: String) -> Arret? {
        var res: Arret? = nil;
        for arret in self.listeDesArrets {
            if (arret.CodeArret == codeArret) {
                res = arret;
            }
        }
        return res;
    }
    
    /// Initialiser la ligne de tous les arrêts de la liste.
    /// - Parameters:
    ///   - ligne: La ligne  de chaque arrêt.
    public func initialiserLigneDeChaqueArret(ligne: Ligne) -> Void {
        for arret: Arret in self.ListeDesArrets {
            arret.LigneArrret = ligne;
        }
    }
    
    /// Ajouter l'arrêt dans la liste.
    /// - Parameters:
    ///   - arret: L'arrêt à ajouter.
    public func ajouterArret(arret: Arret) -> Void {
        self.listeDesArrets.append(arret);
    }

    /// Supprimer l'arrêt dans la liste.
    /// - Parameters:
    ///   - arret: L'arrêt à supprimer. 
    public func supprimerArret(arret: Arret) -> Void {
        if let indexArret = self.listeDesArrets.firstIndex(where: { $0 === arret }) {
            self.listeDesArrets.remove(at: indexArret);
        }
    }
    
}
