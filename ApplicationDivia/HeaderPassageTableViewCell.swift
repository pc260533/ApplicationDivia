//
//  HeaderPassageTableViewCell.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// HeaderPassageTableViewCell est la classe représentant une cellule de la table view contenant les informations sur la ligne et l'arrêt correpsondant à deux passages.
public class HeaderPassageTableViewCell: UITableViewCell {
    
    /// L'outlet contenant le label du nom de la ligne.
    @IBOutlet weak var labelNomLignePassage: UILabel!;
    /// L'outlet contenant le label de la destination de la ligne.
    @IBOutlet weak var labelDestinationLignePassage: UILabel!;
    /// L'outlet contenant le label du nom de l'arrêt.
    @IBOutlet weak var labelNomArretPassage: UILabel!;
    /// L'outlet contenant le bouton permettant d'ajouter ou supprmier l'arrêt dans la liste des arrêts favoris.
    @IBOutlet weak var buttonEditerFavoris: UIButton!;
    
    /// La closure à exécuter quand on appuie sur le bouton permettant d'ajouter ou supprmier l'arrêt dans la liste des arrêts favoris.
    private var editerFavorisAction: ((HeaderPassageTableViewCell) -> Void)? = nil;
    
    /// Retourner ou modifier la closure à exécuter quand on appuie sur le bouton permettant d'ajouter ou supprmier l'arrêt dans la liste des arrêts favoris.
    public var EditerFavorisAction: ((HeaderPassageTableViewCell) -> Void)? {
        get {
            return self.editerFavorisAction;
        }
        set (editerFavorisAction) {
            self.editerFavorisAction = editerFavorisAction;
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

        // Configure the view for the selected state
    }
    
    /// Action à exécuter au clic sue le bouton permettant d'ajouter ou supprmier l'arrêt dans la liste des arrêts favoris.
    @IBAction func buttonEditerFavorisClick(_ sender: UIButton) {
        self.editerFavorisAction?(self);
    }
    
}
