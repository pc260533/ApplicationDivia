//
//  ArretTableViewCell.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// ArretTableViewCell est la classe représentant une cellule de la table view contenant les arrêts d'une ligne.
public class ArretTableViewCell: UITableViewCell {

    /// L'outlet contenant le nom de la ligne sélectionnée.
    @IBOutlet weak var labelNomLigneSelectionnee: UILabel!;
    /// L'outlet contenant le nom de l'arrêt.
    @IBOutlet weak var labelNomArret: UILabel!;
    
    public override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

        // Configure the view for the selected state
    }

}
