//
//  IVue.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// IVue est un protocole représentant les fonctionnalités d'une Vue.
public protocol IVue : class {

    /// Action à exécuter après le catch d'une exception personnalisée.
    /// - Parameters:
    ///   - exceptionPersonnalisee: L'execption personnalisée catchée.
    func afficherException(exceptionPersonnalisee : ExceptionPersonnalisee);

    /// Action à exécuter après l'ajout d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris ajoutée.
    func ajoutLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void;

    /// Action à exécuter après la suppression d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris supprimée.
    func suppressionLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void;

    /// Action à exécuter après le début du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    ///   - completion: La méthode completion appelé à la fin.
    func debutChargementFavoris(listeLignesFavorites: ListeLignes, completion: (() -> Void)?) -> Void;

    /// Action à exécuter après la fin du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    func finChargementFavoris(listeLignesFavorites: ListeLignes) -> Void;

    /// Action à exécuter après le début du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    ///   - completion: La méthode completion appelé à la fin.
    func debutChargementListeLignes(listeLignes: ListeLignes, completion: (() -> Void)?) -> Void;

    /// Action à exécuter après la fin du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    func finChargementListeLignes(listeLignes: ListeLignes) -> Void;

    /// Action à exécuter après le début du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.
    ///   - completion: La méthode completion appelé à la fin.
    func debutChargementListeArrets(ligne: Ligne, completion: (() -> Void)?) -> Void;
    
    /// Action à exécuter après la fin du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.
    func finChargementListeArrets(ligne: Ligne) -> Void;

    /// Action à exécuter après le début du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.
    ///   - completion: La méthode completion appelé à la fin.
    func debutChargementListePassages(arretAvecPassages: ArretAvecPassages, completion: (() -> Void)?) -> Void;
    
    /// Action à exécuter après la fin du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.
    func finChargementListePassages(arretAvecPassages: ArretAvecPassages) -> Void;
    
}
