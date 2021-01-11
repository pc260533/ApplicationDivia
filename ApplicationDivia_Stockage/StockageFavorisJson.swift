//
//  StockageFavorisJson.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

public class StockageFavorisJson : IStockageFavoris {
    /// Le chemin du fichier json.
    private var cheminFichierJson: String;
    /// La liste des lignes à charger ou a sauvegarder.
    private var listeLignesChargees: ListeLignes;
    
    /// Action à exécuter après le catch d'une exception personnalisée.
    /// - Parameters:
    ///   - exceptionPersonnalisee: L'execption personnalisée catchée.
    public func afficherException(exceptionPersonnalisee : ExceptionPersonnalisee) {
        
    }

    /// Action à exécuter après l'ajout d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris ajoutée.    
    public func ajoutLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void {
        self.ajouterLigneArretFavoris(ligne: ligne, arret: arret);
    }

    /// Action à exécuter après la suppression d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris supprimée.    
    public func suppressionLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void {
        self.supprimerLigneArretFavoris(ligne: ligne, arret: arret);
    }

    /// Action à exécuter après le début du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    ///   - completion: La méthode completion appelé à la fin.    
    public func debutChargementFavoris(listeLignesFavorites: ListeLignes, completion: (() -> Void)?) -> Void {
        
    }

    /// Action à exécuter après la fin du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.    
    public func finChargementFavoris(listeLignesFavorites: ListeLignes) -> Void {
        
    }

    /// Action à exécuter après le début du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    ///   - completion: La méthode completion appelé à la fin.    
    public func debutChargementListeLignes(listeLignes: ListeLignes, completion: (() -> Void)?) {
        
    }

    /// Action à exécuter après la fin du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.    
    public func finChargementListeLignes(listeLignes: ListeLignes) {
        
    }

    /// Action à exécuter après le début du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.
    ///   - completion: La méthode completion appelé à la fin.    
    public func debutChargementListeArrets(ligne: Ligne, completion: (() -> Void)?) {
        
    }
    
    /// Action à exécuter après la fin du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.    
    public func finChargementListeArrets(ligne: Ligne) {
        
    }

    /// Action à exécuter après le début du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.
    ///   - completion: La méthode completion appelé à la fin.    
    public func debutChargementListePassages(arretAvecPassages: ArretAvecPassages, completion: (() -> Void)?) {
        
    }
    
    /// Action à exécuter après la fin du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.    
    public func finChargementListePassages(arretAvecPassages: ArretAvecPassages) {
        
    }
    
    /// Sauvegarger la liste des lignes.
    private func sauver() -> Void {
        let jsonEncoder = JSONEncoder();
        jsonEncoder.outputFormatting = JSONEncoder.OutputFormatting.prettyPrinted;
        do {
            let jsonData: Data = try jsonEncoder.encode(self.listeLignesChargees.getListeLignesFavorites());
            if let jsonString: String = String(data: jsonData, encoding: String.Encoding.utf8) {
                if let documentDirectory: URL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first {
                    let cheminFichierComplet: URL = documentDirectory.appendingPathComponent(self.cheminFichierJson);
                    try jsonString.write(to: cheminFichierComplet, atomically: true, encoding: String.Encoding.utf8);
                }
                
            }
        }
        catch let erreurSauvegarde {
            print(erreurSauvegarde);
        }
    }
    
    /// Constructeur StockageFavorisJson sans paramètres.
    /// - Parameters:
    ///   - cheminFichierJson: Le chemin du fichier json.
    ///   - listeLignesChargees: La liste des ligne à charger ou sauvegarder.
    public init(cheminFichierJson: String, listeLignesChargees: ListeLignes) {
        self.cheminFichierJson = cheminFichierJson;
        self.listeLignesChargees = listeLignesChargees;
    }
    
    /// Ajouter un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant les arrêts favoris.
    ///   - arret: L'arrêt favoris à ajouter.
    public func ajouterLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void {
        self.sauver();
    }

    /// Supprimer un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant les arrêts favoris.
    ///   - arret: L'arrêt favoris à supprimer.
    public func supprimerLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void {
        self.sauver();
    }
    
    /// Charger la liste des lignes favorites.
    public func chargerListeLignesFavorites() throws -> ListeLignes {
        var listeLignes = ListeLignes();
        if let documentDirectory: URL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first {
            let cheminFichierComplet: URL = documentDirectory.appendingPathComponent(self.cheminFichierJson);
            do {
                let jsonString = try String(contentsOf: cheminFichierComplet, encoding: String.Encoding.utf8);
                if let jsonData = jsonString.data(using: String.Encoding.utf8) {
                    let jsonDecoder = JSONDecoder();
                    listeLignes = try jsonDecoder.decode(ListeLignes.self, from: jsonData);
                }
                
            }
            catch let erreurChargement {
                print(erreurChargement);
                throw ExceptionGeneraleStockageFavoris();
            }
        }
        return listeLignes;
    }
    
}
