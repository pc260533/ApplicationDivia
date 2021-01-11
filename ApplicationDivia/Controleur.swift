//
//  Controleur.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

public class Controleur {
    /// La liste contenant les IVues.
    private var listeVues: Array<IVue>;
    /// Le modèle de liste de lignes.
    private var modeleListeLignes: ListeLignes;
    /// L'adaptateur de l'API Keolis.
    private var adaptateurApiKeolis: AdaptateurApiKeolis!;
    
    /// Constructeur Controleur prenant en paramètre le modèle de liste de lignes.
    /// - Parameters:
    ///   - modeleListeLignes: Le modèle de liste de lignes.
    public init(modeleListeLignes: ListeLignes) {
        self.modeleListeLignes = modeleListeLignes;
        self.listeVues = Array<IVue>();
        self.adaptateurApiKeolis = AdaptateurApiKeolis(controleur: self);
    }
    
    /// Inscrire une IVue.
    public func inscrireVue(vue: IVue) -> Void {
        self.listeVues.append(vue);
    }

    /// Résilier une IVue.
    public func resilierVue(vue: IVue) -> Void {
        if let indexVue = self.listeVues.firstIndex(where: { $0 === vue }) {
            self.listeVues.remove(at: indexVue);
        }
    }

    /// Retourner le nombre de IVue.
    public func nombreDeVues() -> Int {
        return self.listeVues.count;
    }
    
    /// Notifier du catch d'une exception personnalisée.
    /// - Parameters:
    ///   - exceptionPersonnalisee: L'exception personnalisée catchée.
    internal func notifierExceptionPersonnalisee(exceptionPersonnalisee: ExceptionPersonnalisee) -> Void {
        self.listeVues.last?.afficherException(exceptionPersonnalisee: exceptionPersonnalisee);
    }

    /// Notifier l'ajout d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris ajoutée.
    internal func notifierAjoutLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void {
        for vue: IVue in self.listeVues {
            vue.ajoutLigneArretFavoris(ligne: ligne, arret: arret);
        }
    }

    /// Notifier la suppression d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris supprimée.
    internal func notifierSuppressionLigneArretFavoris(ligne: Ligne, arret: Arret) -> Void {
        for vue: IVue in self.listeVues {
            vue.suppressionLigneArretFavoris(ligne: ligne, arret: arret);
        }
    }

    /// Notifier le début du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    ///   - completion: La méthode completion appelé à la fin.    
    internal func notifierDebutChargementFavoris(listeLignesFavorites: ListeLignes, completion: (() -> Void)?) -> Void {
        for vue: IVue in self.listeVues {
            vue.debutChargementFavoris(listeLignesFavorites: listeLignesFavorites, completion: completion);
        }
    }

    /// Notifier la fin du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    internal func notifierFinChargementFavoris(listeLignesFavorites: ListeLignes) -> Void {
        for vue: IVue in self.listeVues {
            vue.finChargementFavoris(listeLignesFavorites: listeLignesFavorites);
        }
    }

    /// Notifier le début du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    ///   - completion: La méthode completion appelé à la fin.
    internal func notifierDebutChargementListeLignes(listeLignes: ListeLignes, completion: (() -> Void)?) -> Void {
        for vue: IVue in self.listeVues {
            vue.debutChargementListeLignes(listeLignes: listeLignes, completion: completion);
        }
    }

    /// Notifier la fin du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    internal func notifierFinChargementListeLignes(listeLignes: ListeLignes) -> Void {
        for vue: IVue in self.listeVues {
            vue.finChargementListeLignes(listeLignes: listeLignes);
        }
    }

    /// Notifier le début du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.
    ///   - completion: La méthode completion appelé à la fin.
    internal func notifierDebutChargementListeArrets(ligne: Ligne, completion: (() -> Void)?) -> Void {
        for vue: IVue in self.listeVues {
            vue.debutChargementListeArrets(ligne: ligne, completion: completion);
        }
    }

    /// Notifier la fin du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.
    internal func notifierFinChargementListeArrets(ligne: Ligne) -> Void {
        for vue: IVue in self.listeVues {
            vue.finChargementListeArrets(ligne: ligne);
        }
    }

    /// Notifier le début du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.
    ///   - completion: La méthode completion appelé à la fin.
    internal func notifierDebutChargementListePassages(arretAvecPassages: ArretAvecPassages, completion: (() -> Void)?) -> Void {
        for vue: IVue in self.listeVues {
            vue.debutChargementListePassages(arretAvecPassages: arretAvecPassages, completion: completion);
        }
    }

    /// Notifier la fin du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.
    internal func notifierFinChargementListePassages(arretAvecPassages: ArretAvecPassages) -> Void {
        for vue: IVue in self.listeVues {
            vue.finChargementListePassages(arretAvecPassages: arretAvecPassages);
        }
    }
    
    /// Charger la liste des arrêts favoris des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des lignes favorites à charger.
    public func chargerListeArretsDesLignesFavorites(listeLignesFavorites: ListeLignes) {
        self.notifierDebutChargementFavoris(listeLignesFavorites: listeLignesFavorites, completion: nil);
        if (listeLignesFavorites.ListeDesLignes.isEmpty) {
            self.notifierFinChargementFavoris(listeLignesFavorites: listeLignesFavorites);
        }
        var auUneListeArretsChargee: Bool = true;
        for (index, ligneFavorite) in listeLignesFavorites.ListeDesLignes.enumerated() {
            if let ligneDuModele: Ligne = self.modeleListeLignes.getLigneAvecCodeLigneEtSensLigne(codeLigne: ligneFavorite.CodeLigne, sensLigne: ligneFavorite.SensLigne) {
                auUneListeArretsChargee = false;
                self.chargerListeArretsSansPrechargement(ligne: ligneDuModele, callBackSpecifiqueApresChargementArrets: {
                    self.initialiserFavorisLigne(ligneDuModeleACharger: ligneDuModele, ligneFavorite: ligneFavorite);
                    if (index == listeLignesFavorites.ListeDesLignes.count - 1) {
                        self.notifierFinChargementFavoris(listeLignesFavorites: listeLignesFavorites);
                    }
                });
            }
        }
        if (auUneListeArretsChargee) {
            self.notifierFinChargementFavoris(listeLignesFavorites: listeLignesFavorites);
        }
    }

    /// Initialiser la ligne du modèle avec la ligne favorite pour indiquer les arrêts favoris dasn les lignes du modèle.
    /// - Parameters:
    ///   - ligneDuModeleACharger: La ligne du modèle.
    ///   - ligneFavorite: La ligne favorite.
    public func initialiserFavorisLigne(ligneDuModeleACharger: Ligne, ligneFavorite: Ligne) {
        for arretFavoris: Arret in ligneFavorite.ListeDesArrets.ListeDesArrets {
            if let arretDuModele: Arret = ligneDuModeleACharger.ListeDesArrets.getArretAvecCodeArret(codeArret: arretFavoris.CodeArret) {
                arretDuModele.FavorisArret = true;
            }
        }
    }

    /// Initialiser la liste de lignes modèle avec la liste lignes favorite pour indiquer les arrêts favoris dasn les lignes du modèle.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste de lignes favorite.
    public func initialiserFavorisListeLignes(listeLignesFavorites: ListeLignes) {
        for ligneFavorite: Ligne in listeLignesFavorites.ListeDesLignes {
            if let ligneDuModele: Ligne = self.modeleListeLignes.getLigneAvecCodeLigneEtSensLigne(codeLigne: ligneFavorite.CodeLigne, sensLigne: ligneFavorite.SensLigne) {
                for arretFavoris: Arret in ligneFavorite.ListeDesArrets.ListeDesArrets {
                    if let arretDuModele: Arret = ligneDuModele.ListeDesArrets.getArretAvecCodeArret(codeArret: arretFavoris.CodeArret) {
                        arretDuModele.FavorisArret = true;
                    }
                }
            }
        }
    }

    /// Ajouter un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris à ajouter.
    public func ajouterLigneArretFavoris(ligne: Ligne, arret: Arret) {
        arret.FavorisArret = true;
        self.notifierAjoutLigneArretFavoris(ligne: ligne, arret: arret);
    }

    /// Supprimer un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris à supprimer.
    public func supprimerLigneArretFavoris(ligne: Ligne, arret: Arret) {
        arret.FavorisArret = false;
        self.notifierSuppressionLigneArretFavoris(ligne: ligne, arret: arret);
    }

    /// Charger la liste des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des lignes à charger.
    public func chargerListeLignes(listeLignes: ListeLignes) -> Void {
        self.notifierDebutChargementListeLignes(listeLignes: listeLignes) {
            self.adaptateurApiKeolis.chargerListeLignes(listeLignes: listeLignes);
        };
    }

    /// Action à exécuter à la fin du chargement de la liste des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des lignes chargée.
    public func finChargementListeLignes(listelignes: ListeLignes) -> Void {
        self.notifierFinChargementListeLignes(listeLignes: listelignes);
    }

    /// Charger la liste des arrêts sans notification du début du chargement.
    /// - Parameters:
    ///   - ligne: La ligne contenant les arrêts à charger.
    ///   - callBackSpecifiqueApresChargementArrets: La closure spécifique exécuter après le chargement des arrêts.
    public func chargerListeArretsSansPrechargement(ligne: Ligne, callBackSpecifiqueApresChargementArrets: (() -> Void)?) {
        self.notifierDebutChargementListeArrets(ligne: ligne, completion: nil);
        self.adaptateurApiKeolis.chargerListeArret(ligne: ligne, callBackSpecifiqueApresChargementArrets: callBackSpecifiqueApresChargementArrets);
    }

    /// Charger la liste des arrêts avec notification du début du chargement.
    /// - Parameters:
    ///   - listeLignes: La ligne contenant les arrêts à charger.
    ///   - callBackSpecifiqueApresChargementArrets: La closure spécifique exécuter après le chargement des arrêts.
    public func chargerListeArretsAvecPrechargement(ligne: Ligne, callBackSpecifiqueApresChargementArrets: (() -> Void)?) {
        self.notifierDebutChargementListeArrets(ligne: ligne) {
            self.adaptateurApiKeolis.chargerListeArret(ligne: ligne, callBackSpecifiqueApresChargementArrets: callBackSpecifiqueApresChargementArrets);
        };
    }

    /// Action à exécuter à la fin du chargement de la liste des arrêts.
    /// - Parameters:
    ///   - ligne: La ligne contenant les arrêts chargés.
    public func finChargementListeArrets(ligne: Ligne) {
        ligne.ListeDesArrets.initialiserLigneDeChaqueArret(ligne: ligne);
        self.notifierFinChargementListeArrets(ligne: ligne);
    }

    /// Charger la liste des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passages à charger.
    public func chargerListePassages(arretAvecPassages: ArretAvecPassages) {
        self.notifierDebutChargementListePassages(arretAvecPassages: arretAvecPassages) {
            self.adaptateurApiKeolis.chargerListePassages(arretAvecPassages: arretAvecPassages);
        };
    }

    /// Action à exécuter à la fin du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passages à charger.
    public func finChargementListePassages(arretAvecPassages: ArretAvecPassages) {
        self.notifierFinChargementListePassages(arretAvecPassages: arretAvecPassages);
    }
    
}
