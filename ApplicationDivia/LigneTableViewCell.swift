//
//  LigneTableViewCell.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// LigneTableViewCell est la classe représentant une cellule de la table view contenant les lignes.
public class LigneTableViewCell: UITableViewCell {

    /// L'outlet contenant le label du nom de la ligne.
    @IBOutlet weak var labelNomLigne: UILabel!;
    /// L'outlet contenant le label de la destination de la ligne.
    @IBOutlet weak var labelDestinationLigne: UILabel!;
    
    public override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

        // Configure the view for the selected state
    }

}
