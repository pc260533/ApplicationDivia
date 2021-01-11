//
//  ListeArretsViewController.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit

/// ListeArretsViewController est la classe représentant un viewController de la vue représentant les arrêts.
/// Elle hérite de UIViewController etimplémente les foncitonnalités de UITableViewDataSource, UITableViewDelegate et IVue.
class ListeArretsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IVue {
    /// Le controleur.
    private var controleur: Controleur?;
    /// La liste des arrêts de la ligne sélectionnée.
    private var listeArrets: ListeArrets?;
    /// La ligne sélectionnée.
    private var ligneSelectionnee: Ligne?;

    /// L'outlet contenant la table view affichant les arrêts d'une ligne.
    @IBOutlet weak var tableViewListeArrets: UITableView!;
    
    /// Retourner ou modifier le controleur.
    public var Controleur: Controleur? {
        get {
            return self.controleur;
        }
        set(controleur) {
            self.controleur = controleur;
        }
    }

    /// Retourner ou modifier la liste des arrêts de la ligne sélectionnée.
    public var ListeArrets: ListeArrets? {
        get {
            return self.listeArrets;
        }
        set(listeArrets) {
            self.listeArrets = listeArrets;
        }
    }

    /// Retourner ou modifier la ligne sélectionnée.
    public var LigneSelectionnee: Ligne? {
        get {
            return self.ligneSelectionnee;
        }
        set(ligneSelectionnee) {
            self.ligneSelectionnee = ligneSelectionnee;
        }
    }

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
        DispatchQueue.main.async {
            self.present(self.LoadingController, animated: true) {
                completion?();
            };
        }
    }

    /// Action à exécuter après la fin du chargement des arrêts d'une ligne.
    /// - Parameters:
    ///   - Ligne: La ligne contenant la liste des arrêts chargée.
    public func finChargementListeArrets(ligne: Ligne) {
        DispatchQueue.main.async {
            self.rechargerListeArretsTableView();
            self.presentedViewController?.dismiss(animated: true, completion: nil);
        };
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

    /// Recharger la table view liste arrêts.
    private func rechargerListeArretsTableView() -> Void {
        self.tableViewListeArrets.reloadData();
    }
    
    /// Retourner l'arrêt sélectionné.
    private func getSelectedArret() -> Arret? {
        var arretSelectionnee: Arret? = nil;
        if let indexPathForSelectedRow: IndexPath  = self.tableViewListeArrets.indexPathForSelectedRow {
            arretSelectionnee = self.listeArrets?.ListeDesArrets[indexPathForSelectedRow.row];
        }
        return arretSelectionnee;
    }

    /// Constructeur ListeArretsViewController prenant en paramètre un NSCoder et le controleur.
    public required init?(coder: NSCoder, controleur: Controleur) {
        self.listeArrets = nil;
        self.controleur = controleur;
        self.ligneSelectionnee = nil;
        super.init(coder: coder);
    }

    /// Constructeur ListeArretsViewController prenant en paramètre un NSCoder.
    public required init?(coder: NSCoder) {
        self.listeArrets = nil;
        self.controleur = nil;
        self.ligneSelectionnee = nil;
        super.init(coder: coder);
    }

    /// Action à exécuter quand la vue est chargée.
    public override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.

        self.tableViewListeArrets.dataSource = self;
        self.tableViewListeArrets.delegate = self;
        
        self.listeArrets = self.ligneSelectionnee?.ListeDesArrets;
        
        if let controleur: Controleur = self.controleur {
            controleur.inscrireVue(vue: self);
            if let ligneSelectionnee: Ligne = self.ligneSelectionnee {
                if let listeArrets: ListeArrets = self.listeArrets {
                    if (listeArrets.ListeDesArrets.isEmpty) {
                        controleur.chargerListeArretsAvecPrechargement(ligne: ligneSelectionnee, callBackSpecifiqueApresChargementArrets: nil);
                    }
                    else {
                        self.rechargerListeArretsTableView();
                    }
                }
            }
        }
    }

    /// Action à exécuter pour retourner le nombre de lignes de la table view liste arrêts.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var res: Int = 0;
        if let listeArrets: ListeArrets = self.listeArrets {
            res = listeArrets.ListeDesArrets.count;
        }
        return res;
    }

    /// Action à exécuter pour ajouter une ligne dans la table view liste arrêts.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ArretTableViewCell";
        guard let cell = self.tableViewListeArrets.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArretTableViewCell else {
            fatalError("La cellule n'est pas une instance de ArretTableViewCell");
        };
        
        if let ligneSelectionnee: Ligne = self.ligneSelectionnee {
            if let listeArrets: ListeArrets = self.listeArrets {
                let arretAAfficher = listeArrets.ListeDesArrets[indexPath.row];
                cell.labelNomLigneSelectionnee.text = ligneSelectionnee.NomLigne;
                cell.labelNomLigneSelectionnee.backgroundColor = UIColor(couleurDecimalString: ligneSelectionnee.CouleurLigne);
                cell.labelNomArret.text = arretAAfficher.NomArret;
            }
        }
        
        return cell;
    }

    /// Action à exécuter pour notifier le viewController qu'une segue va être réalisée.
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueListeArretsViewControllerVersListePassagesViewController") {
            if let listePassagesViewController: ListePassagesViewController = segue.destination as? ListePassagesViewController {
                listePassagesViewController.Controleur = self.controleur;
                if let arretSelectionne: Arret = self.getSelectedArret() {
                    let listeArretAvecPassages: ListeArretAvecPassages = ListeArretAvecPassages();
                    listeArretAvecPassages.ajouterArretAvecPassages(arretAvecPassages: ArretAvecPassages(arretPassage: arretSelectionne));
                    listePassagesViewController.ListeArretAvecPassages = listeArretAvecPassages;
                }
            }
        }
    }

    /// Action à exécuter au clic sur le bouton accueil.
    @IBAction public func buttonAccueilClick(_ sender: UIButton) {
        self.controleur?.resilierVue(vue: self);
        self.dismiss(animated: true, completion: nil);
    }

}
