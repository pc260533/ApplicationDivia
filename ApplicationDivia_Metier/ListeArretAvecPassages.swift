//
//  ListeDeListePassages.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ListeArretAvecPassages est la classe représentant une liste d'ArretAvecPassage.
public class ListeArretAvecPassages {
    /// La liste des arrêts avec passages.
    private var listeDesArretAvecPassages: Array<ArretAvecPassages>;
    
    /// Retourner la liste des arrêts avec passages.
    public var ListeDesArretAvecPassages: Array<ArretAvecPassages> {
        get {
            return self.listeDesArretAvecPassages;
        }
    }
    
    /// Constructeur ListeArretAvecPassages sans paramètres.
    public init() {
        self.listeDesArretAvecPassages = Array();
    }
    
    /// Ajouter un arrêt avec passage dans la liste des arrêts avec passages.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage à ajouter.
    public func ajouterArretAvecPassages(arretAvecPassages: ArretAvecPassages) -> Void {
        self.listeDesArretAvecPassages.append(arretAvecPassages);
    }

    /// Supprimer un arrêt avec passage dans la liste des arrêts avec passages.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage à supprimer.
    public func supprimerArretAvecPassages(arretAvecPassages: ArretAvecPassages) -> Void {
        if let indexArretAvecPassages = self.listeDesArretAvecPassages.firstIndex(where: { $0 === arretAvecPassages }) {
            self.listeDesArretAvecPassages.remove(at: indexArretAvecPassages);
        }
    }

    /// Retourner un booléen indiquant si la liste des arrêts avec pasages est vide.
    public func estVide() -> Bool {
        return self.listeDesArretAvecPassages.isEmpty;
    }

    /// Vider tous les arrêts des arrêts avec passages.
    public func viderToutArretAvecPassages() -> Void {
        for arretAvecPassages: ArretAvecPassages in self.listeDesArretAvecPassages {
            arretAvecPassages.viderListeDesPassages();
        }
    }
}
