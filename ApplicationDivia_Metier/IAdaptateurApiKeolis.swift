//
//  IAdaptateurApiKeolis.swift
//  ApplicationDivia
//
//  Created by pcnf on 26/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// IAdapteurApiKeolis est le protocole représentant représentant les fonctionnalités de l'API Keolis.
public protocol IAdapteurApiKeolis {
    
    /// Charger la liste des lignes
    /// - Parameters:
    ///   - listeLignes: La liste des lignes à charger.
    func chargerListeLignes(listeLignes: ListeLignes) -> Void;
    
    /// Charger la liste des arrêts d'une ligne.
    /// - Parameters:
    ///   - ligne: La ligne dont on charge les arrêts.
    ///   - callBackSpecifiqueApresChargementArrets: Le callback appelé à la fin du chargement des arrêts.
    func chargerListeArret(ligne: Ligne, callBackSpecifiqueApresChargementArrets: (() -> Void)?) -> Void;
    
    /// Charger la liste des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage à charger.
    func chargerListePassages(arretAvecPassages: ArretAvecPassages) -> Void;
    
}
