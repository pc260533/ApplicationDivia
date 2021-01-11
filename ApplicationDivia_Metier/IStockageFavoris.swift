//
//  IStockageFavoris.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// IStockageFavoris est le protocole représentant représentant les fonctionnalités de stockage des arrêts et des lignes favoris.
/// Elle implémente l'interface IVue mais ne réalise pas ces méthodes.
public protocol IStockageFavoris : IVue {
    
    /// Ajouter un arret favoris d'une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt.
    ///   - arret: L'arrêt favoris à ajouter.
    func ajouterLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void;
    
    /// Supprimer un arret favoris d'une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt.
    ///   - arret: L'arrêt favoris à supprimer.
    func supprimerLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void;
    
    /// Charger la liste des lignes favorites contenant les arrêts favoris.
    func chargerListeLignesFavorites() throws -> ListeLignes;
    
}
