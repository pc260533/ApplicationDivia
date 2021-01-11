//
//  UIColor+InitAvecDecimal.swift
//  ApplicationDivia
//
//  Created by pcnf on 27/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// Extension de la classe UIColor permettant de créer un UIColor avec une chaine de caractères sous la forme décimal.  
public extension UIColor {
    
    /// Constructeur UIColor prenant en paramètre la couleur sous la forme décimal.
    public convenience init(couleurDecimalString: String) {
        let couleurligne: Int = Int(couleurDecimalString) ?? 0;
        let rouge: CGFloat = CGFloat((couleurligne >> 16) & 0xFF) / CGFloat(255.0);
        let vert: CGFloat = CGFloat((couleurligne >> 8) & 0xFF) / CGFloat(255.0);
        let bleu: CGFloat = CGFloat((couleurligne >> 0) & 0xFF) / CGFloat(255.0);
        let alpha: CGFloat = CGFloat(1.0);
        self.init(red: rouge, green: vert, blue: bleu, alpha: alpha);
    }
    
}
