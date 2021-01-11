//
//  ListePassages.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// Arret est la classe représentant un arrêt avec une liste de passages.
public class ArretAvecPassages {
    /// La liste des passages.
    private var listeDesPassage: Array<Passage>;
    // L'arrêt.
    private var arretPassage: Arret;
    
    /// Retourner la liste des passages.
    public var ListeDesPassage: Array<Passage> {
        get {
            return self.listeDesPassage;
        }
    }
    
    /// Modifier la liste des passages.
    public var ArretPassage: Arret {
        get {
            return self.arretPassage;
        }
    }
    
    /// Constructeur ArretAvecPassage prenant en paramètres l'arrêt.
    /// - Parameters:
    ///   - arretPassage: L'arrêt.
    public init(arretPassage: Arret) {
        self.listeDesPassage = Array();
        self.arretPassage = arretPassage;
    }

    /// Ajouter un passage à la liste des passages.
    /// - Parameters:
    ///   - passage: Le passage à ajouter.
    public func ajouterPassage(passage: Passage) -> Void {
        self.listeDesPassage.append(passage);
    }

    /// Supprimer un passage de la liste des passages.
    /// - Parameters:
    ///   - passage: Le passage à supprimer.    
    public func supprimerPassage(passage: Passage) -> Void {
        if let indexPassage = self.listeDesPassage.firstIndex(where: { $0 === passage }) {
            self.listeDesPassage.remove(at: indexPassage);
        }
    }

    /// Vider la liste de passages.
    public func viderListeDesPassages() -> Void {
        self.listeDesPassage.removeAll();
    }
    
}
