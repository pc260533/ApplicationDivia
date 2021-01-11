//
//  PassageTableViewCell.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// PassageTableViewCell est la classe représentant une cellule de la table view contenant les passages d'un arrêt.
public class PassageTableViewCell: UITableViewCell {

    /// L'outlet contenant le label de l'heure de passage.
    @IBOutlet weak var labelHeurePassage: UILabel!;
    /// L'outlet contenant le label du temps d'attente avant passage.
    @IBOutlet weak var labelTempsAttenteAvantPassage: UILabel!;
    
    public override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

        // Configure the view for the selected state
    }

}
