//
//  ListePassagesViewController.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// ListePassagesViewController est la classe représentant un viewController de la vue représentant les passages.
/// Elle hérite de UIViewController etimplémente les foncitonnalités de UITableViewDataSource, UITableViewDelegate et IVue.
public class ListePassagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IVue {
    /// Le controleur
    private var controleur: Controleur?;
    /// La liste des arrêts avec passages.
    private var listeArretAvecPassages: ListeArretAvecPassages?;

    /// L'outlet contenant la table view affichant des passages d'un arrêt.
    @IBOutlet weak var tableViewListePassages: UITableView!;
    
    /// Retourner ou modifier le controleur.
    public var Controleur: Controleur? {
        get {
            return self.controleur;
        }
        set(controleur) {
            self.controleur = controleur;
        }
    }

    /// Retourner ou modifier la liste des arrêts avec passages.
    public var ListeArretAvecPassages: ListeArretAvecPassages? {
        get {
            return self.listeArretAvecPassages;
        }
        set(listeArretAvecPassages) {
            self.listeArretAvecPassages = listeArretAvecPassages;
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
        DispatchQueue.main.async {
            self.rechargerListePassagesTableView();
        };
    }

    /// Action à exécuter après la suppression d'un arrêt favoris dans une ligne favorite.
    /// - Parameters:
    ///   - ligne: La ligne favorite contenant l'arrêt favoris.
    ///   - arret: L'arrêt favoris supprimée.    
    public func suppressionLigneArretFavoris(ligne: Ligne, arret: Arret) {
        DispatchQueue.main.async {
            self.rechargerListePassagesTableView();
        };
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
        if (arretAvecPassages === self.listeArretAvecPassages?.ListeDesArretAvecPassages.first) {
            DispatchQueue.main.async {
                self.present(self.LoadingController, animated: true) {
                    completion?();
                };
            }
        }
        else {
            completion?();
        }
    }

    /// Action à exécuter après la fin du chargement des passages d'un arrêt.
    /// - Parameters:
    ///   - arretAvecPassages: L'arrêt avec passage d'un arrêt.
    public func finChargementListePassages(arretAvecPassages: ArretAvecPassages) {
        DispatchQueue.main.async {
            self.rechargerListePassagesTableView();
            self.presentedViewController?.dismiss(animated: true, completion: nil);
        }
    }
    
    /// Recharger la table view liste passages.
    private func rechargerListePassagesTableView() -> Void {
        self.tableViewListePassages.reloadData();
    }
    
    /// Afficher le label indiquant qu'il n'y a aucun favoris.
    private func afficherLabelPasDeFavoris() -> Void {
        let labelPasDeFavoris = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableViewListePassages.bounds.size.width, height: self.tableViewListePassages.bounds.size.height))
        labelPasDeFavoris.text = "Pas de favoris";
        labelPasDeFavoris.textColor = UIColor.black;
        labelPasDeFavoris.numberOfLines = 0;
        labelPasDeFavoris.textAlignment = NSTextAlignment.center;
        labelPasDeFavoris.font = UIFont.systemFont(ofSize: 25);
        labelPasDeFavoris.sizeToFit();
        self.tableViewListePassages.backgroundView = labelPasDeFavoris;
    }

    /// Constructeur ListePassagesViewController prenant en paramètre un NSCoder.
    public required init?(coder: NSCoder) {
        self.listeArretAvecPassages = nil;
        self.controleur = nil;
        super.init(coder: coder);
    }

    /// Action à exécuter quand la vue est chargée.
    public override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.

        self.tableViewListePassages.dataSource = self;
        self.tableViewListePassages.delegate = self;
                
        if let controleur: Controleur = self.controleur {
            controleur.inscrireVue(vue: self);
            if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
                for arretAvecPassages in listeArretAvecPassages.ListeDesArretAvecPassages {
                    controleur.chargerListePassages(arretAvecPassages: arretAvecPassages);
                }
            }
        }

        if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
            if (listeArretAvecPassages).estVide() {
                self.afficherLabelPasDeFavoris();
            }
        }
    }

    /// Action à exécuter pour retourner le nombre de sections de la table view liste passages.
    public func numberOfSections(in tableView: UITableView) -> Int {
        var res: Int = 0;
        if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
            res = listeArretAvecPassages.ListeDesArretAvecPassages.count;
        }
        return res;
    }

    /// Action à exécuter pour retourner le nombre de lignes de la table view liste passages.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var res: Int = 0;
        if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
            res = listeArretAvecPassages.ListeDesArretAvecPassages[section].ListeDesPassage.count;
        }
        return res;
    }

    /// Action à exécuter pour ajouter une section dans la table view liste passages.
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellIdentifier = "HeaderPassageTableViewCell";
        guard let cell = self.tableViewListePassages.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeaderPassageTableViewCell else {
            fatalError("La cellule n'est pas une instance de HeaderPassageTableViewCell");
        };
       if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
            let arretAAffiche: Arret = listeArretAvecPassages.ListeDesArretAvecPassages[section].ArretPassage;
            if let ligneAAffiche: Ligne = arretAAffiche.LigneArrret {
                cell.labelNomLignePassage.text = ligneAAffiche.NomLigne;
                cell.labelNomLignePassage.backgroundColor = UIColor(couleurDecimalString: ligneAAffiche.CouleurLigne);
                cell.labelDestinationLignePassage.text = ligneAAffiche.DestinationLigne;
                cell.labelNomArretPassage.text = arretAAffiche.NomArret;
                cell.buttonEditerFavoris.backgroundColor = UIColor(couleurDecimalString: ligneAAffiche.CouleurLigne);
                if (arretAAffiche.FavorisArret) {
                    cell.buttonEditerFavoris.setImage(UIImage(named: "iconeSupprimerFavoris"), for: UIControl.State.normal);
                }
                else {
                    cell.buttonEditerFavoris.setImage(UIImage(named: "iconeAjouterFavoris"), for: UIControl.State.normal);
                }
                cell.EditerFavorisAction = { (cell) in
                    if (arretAAffiche.FavorisArret) {
                        self.controleur?.supprimerLigneArretFavoris(ligne: ligneAAffiche, arret: arretAAffiche);
                        cell.buttonEditerFavoris.setImage(UIImage(named: "iconeAjouterFavoris"), for: UIControl.State.normal);
                    }
                    else {
                        self.controleur?.ajouterLigneArretFavoris(ligne: ligneAAffiche, arret: arretAAffiche);
                        cell.buttonEditerFavoris.setImage(UIImage(named: "iconeSupprimerFavoris"), for: UIControl.State.normal);
                    }
                }
            }
        }
        
        return cell;
    }

    /// Action à exécuter pour ajouter une ligne dans la table view liste passages.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PassageTableViewCell";
        guard let cell = self.tableViewListePassages.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PassageTableViewCell else {
            fatalError("La cellule n'est pas une instance de PassageTableViewCell");
        };
        
        if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
            let passageAAficher = listeArretAvecPassages.ListeDesArretAvecPassages[indexPath.section].ListeDesPassage[indexPath.row];
            cell.labelHeurePassage.text = passageAAficher.HeurePassageString;
            cell.labelTempsAttenteAvantPassage.text = passageAAficher.TempsAttenteAvantPassageAvecMinutes;
        }
        
        return cell;
    }

    /// Action à exécuter au clic sur le bouton accueil.
    @IBAction public func buttonAccueilClick(_ sender: UIButton) {
        self.controleur?.resilierVue(vue: self);
        if let listeArretsViewController = self.presentingViewController as? ListeArretsViewController {
            self.controleur?.resilierVue(vue: listeArretsViewController);
        }
        
        if (self.presentingViewController?.presentingViewController != nil) {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil);
        }
        else {
            self.presentingViewController?.dismiss(animated: true, completion: nil);
        }
    }
    
    /// Action à exécuter au clic sur le bouton actualiser.
    @IBAction func buttonActualiser(_ sender: UIButton) {
        self.listeArretAvecPassages?.viderToutArretAvecPassages();
        
        if let controleur: Controleur = self.controleur {
            if let listeArretAvecPassages: ListeArretAvecPassages = self.listeArretAvecPassages {
                for arretAvecPassages in listeArretAvecPassages.ListeDesArretAvecPassages {
                    controleur.chargerListePassages(arretAvecPassages: arretAvecPassages);
                }
            }
        }
    }
    
}
