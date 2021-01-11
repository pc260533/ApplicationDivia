//
//  ListeLignes.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ListeLignes est la classe représentant une liste de ligne sérializable.
/// Elle hérite de Codable.
public class ListeLignes : Codable {
    /// La liste des lignes.
    private var listeDesLignes: Array<Ligne>;
    
    /// Retourner la liste des lignes.
    public var ListeDesLignes: Array<Ligne> {
        get {
            return self.listeDesLignes;
        }
    }
    
    /// Constructeur ListeLignes sans paramètres.
    init() {
        self.listeDesLignes = Array();
    }
    
    /// Retourner la liste des arrêts favoris de toute les lignes.
    public func getListeDesArretsFavoris() -> Array<Arret> {
        var listeDesArretsFavoris: Array<Arret> = Array<Arret>();
        for ligne in self.listeDesLignes {
            listeDesArretsFavoris.append(contentsOf: ligne.ListeDesArrets.getListeDesArretsFavoris());
        }
        return listeDesArretsFavoris;
    }
    
    /// Retourner une liste de lignes contenant les lignes favorites.
    public func getListeLignesFavorites() -> ListeLignes {
        let listeLignesFavorites = ListeLignes();
        for ligne in self.listeDesLignes {
            let listeDesArretsFavoris: Array<Arret> = ligne.ListeDesArrets.getListeDesArretsFavoris();
            if (!listeDesArretsFavoris.isEmpty) {
                let ligneFavorite: Ligne = Ligne(ligne: ligne);
                for arretFavoris in listeDesArretsFavoris {
                    let nouvelArretFavoris = Arret(arret: arretFavoris);
                    nouvelArretFavoris.FavorisArret = true;
                    ligneFavorite.ListeDesArrets.ajouterArret(arret: nouvelArretFavoris);
                }
                listeLignesFavorites.ajouterLigne(ligne: ligneFavorite);
            }
        }
        return listeLignesFavorites;
    }
    
    /// Retourner une ligne avec son code de ligne et son sens de ligne.
    /// - Parameters:
    ///   - codeLigne: Le code de la ligne.
    ///   - sensLigne: Le sens de la ligne.
    public func getLigneAvecCodeLigneEtSensLigne(codeLigne: String, sensLigne: String) -> Ligne? {
        var res: Ligne? = nil;
        for ligne in self.listeDesLignes {
            if ((ligne.CodeLigne == codeLigne) && (ligne.SensLigne == sensLigne)) {
                res = ligne;
            }
        }
        return res;
    }

    /// Ajouter une ligne dans la liste de lignes.
    /// - Parameters:
    ///   - ligne: La ligne à ajouter.
    public func ajouterLigne(ligne: Ligne) -> Void {
        self.listeDesLignes.append(ligne);
    }

    /// Supprimer une ligne dans la liste de lignes.
    /// - Parameters:
    ///   - ligne: La ligne à supprimer.
    public func supprimerLigne(ligne: Ligne) -> Void {
        if let indexLigne = self.listeDesLignes.firstIndex(where: { $0 === ligne }) {
            self.listeDesLignes.remove(at: indexLigne);
        }
    }
}
