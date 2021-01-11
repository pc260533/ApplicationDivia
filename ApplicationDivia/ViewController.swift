//
//  ViewController.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// ViewController est la classe représentant un viewController de la vue représentant les lignes.
/// Elle hérite de UIViewController etimplémente les foncitonnalités de UITableViewDataSource, UITableViewDelegate et IVue.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IVue {
    /// Le controleur.
    private var controleur: Controleur;
    /// La liste de lignes.
    private var listeLignes: ListeLignes;
    /// Le stockage des favoris.
    private var stockageFavorisJson: StockageFavorisJson;
    
    /// L'outlet contenant la table view affichant les lignes.
    @IBOutlet weak var tableViewListeLignes: UITableView!
    
    /// Action à exécuter après le catch d'une exception personnalisée.
    /// - Parameters:
    ///   - exceptionPersonnalisee: L'execption personnalisée catchée.
    public func afficherException(exceptionPersonnalisee : ExceptionPersonnalisee) {
        DispatchQueue.main.async {
            self.presentedViewController?.dismiss(animated: true) {
                self.present(self.getAlertControllerAvecExceptionPersonnalise(exceptionPersonnalisee: exceptionPersonnalisee), animated: true, completion: nil);
            };
        };
    }

    /// Action à exécuter après l'ajout d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris ajoutée.
    public func ajoutLigneArretFavoris(ligne: Ligne, arret: Arret) {
        
    }

    /// Action à exécuter après la suppression d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris supprimée.    
    public func suppressionLigneArretFavoris(ligne: Ligne, arret: Arret) {
        
    }

    /// Action à exécuter après le début du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    ///   - completion: La méthode completion appelé à la fin.    
    public func debutChargementFavoris(listeLignesFavorites: ListeLignes, completion: (() -> Void)?) -> Void {
        completion?();
    }

    /// Action à exécuter après la fin du chargement des lignes favorites.
    /// - Parameters:
    ///   - listeLignesFavorites: La liste des ligne favorites chargée.
    public func finChargementFavoris(listeLignesFavorites: ListeLignes) -> Void {
        DispatchQueue.main.async {
            self.presentedViewController?.dismiss(animated: true, completion: nil);
        };
    }

    /// Action à exécuter après le début du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    ///   - completion: La méthode completion appelé à la fin.
    public func debutChargementListeLignes(listeLignes: ListeLignes, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            self.present(self.LoadingController, animated: true) {
                completion?();
            };
        }
    }

    /// Action à exécuter après la fin du chargement des lignes.
    /// - Parameters:
    ///   - listeLignes: La liste des ligne chargée.
    public func finChargementListeLignes(listeLignes: ListeLignes) {
        DispatchQueue.main.async {
            self.rechargerListeLignesTableView();
        };
        
        do {
            let listeLignesFavorites = try self.stockageFavorisJson.chargerListeLignesFavorites();
            self.controleur.chargerListeArretsDesLignesFavorites(listeLignesFavorites: listeLignesFavorites);
        }
        catch let exception as ExceptionGeneraleStockageFavoris {
            self.afficherException(exceptionPersonnalisee: exception);
            print(exception);
        }
        catch let exception {
            print(exception);
        }
        
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

    /// Recharger la table view liste lignes.
    private func rechargerListeLignesTableView() -> Void {
        self.tableViewListeLignes.reloadData();
    }

    /// Retourner la ligne sélectionné.
    private func getSelectedLigne() -> Ligne? {
        var ligneSelectionnee: Ligne? = nil;
        if let indexPathForSelectedRow: IndexPath  = self.tableViewListeLignes.indexPathForSelectedRow {
            ligneSelectionnee = self.listeLignes.ListeDesLignes[indexPathForSelectedRow.row];
        }
        return ligneSelectionnee;
    }
    
    /// Constructeur ViewController prenant en paramètre un NSCoder.
    public required init?(coder: NSCoder) {
        self.listeLignes = ListeLignes();
        self.controleur = Controleur(modeleListeLignes: self.listeLignes);
        self.stockageFavorisJson = StockageFavorisJson(cheminFichierJson: "sauvegardeFavoris.json", listeLignesChargees: self.listeLignes);
        
        super.init(coder: coder);
    }
    
    /// Action à exécuter quand la vue est chargée.
    public override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        
        self.tableViewListeLignes.dataSource = self;
        self.tableViewListeLignes.delegate = self;
        
        self.controleur.inscrireVue(vue: self.stockageFavorisJson);
        self.controleur.inscrireVue(vue: self);
        self.controleur.chargerListeLignes(listeLignes: self.listeLignes);
    }
    
    /// Action à exécuter pour retourner le nombre de ligne de la table view liste lignes.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listeLignes.ListeDesLignes.count;
    }

    /// Action à exécuter pour ajouter une ligne dans la table view liste lignes.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "LigneTableViewCell";
        guard let cell = self.tableViewListeLignes.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LigneTableViewCell else {
            fatalError("La cellule n'est pas une instance de LigneTableViewCell");
        };
        let ligneAAfficher = listeLignes.ListeDesLignes[indexPath.row];
        cell.labelNomLigne.text = ligneAAfficher.NomLigne;
        if (ligneAAfficher.CouleurLigne == "0") {
            ligneAAfficher.CouleurLigne = "13395456";
        }
        cell.labelNomLigne.backgroundColor = UIColor(couleurDecimalString: ligneAAfficher.CouleurLigne);
        cell.labelDestinationLigne.text = ligneAAfficher.DestinationLigne;
        return cell;
    }
    
    /// Action à exécuter pour notifier le viewController qu'une segue va être réalisée.
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueViewControllerVersListeArretsViewController") {
            if let listeArretsViewController: ListeArretsViewController = segue.destination as? ListeArretsViewController {
                listeArretsViewController.Controleur = self.controleur;
                listeArretsViewController.LigneSelectionnee = self.getSelectedLigne();
            }
        }
        else if (segue.identifier == "segueViewControllerVersListePassagesViewController") {
            if let listePassagesViewController: ListePassagesViewController = segue.destination as? ListePassagesViewController {
                listePassagesViewController.Controleur = self.controleur;
                let listeArretAvecPassages: ListeArretAvecPassages = ListeArretAvecPassages();
                for arretFavoris in self.listeLignes.getListeDesArretsFavoris() {
                    listeArretAvecPassages.ajouterArretAvecPassages(arretAvecPassages: ArretAvecPassages(arretPassage: arretFavoris));
                }
                listePassagesViewController.ListeArretAvecPassages = listeArretAvecPassages;
            }
        }
    }
    
}

