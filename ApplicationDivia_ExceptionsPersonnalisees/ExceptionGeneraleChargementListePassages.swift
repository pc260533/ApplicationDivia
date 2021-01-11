//
//  ExceptionGeneraleChargementListePassages.swift
//  ApplicationDivia
//
//  Created by pcnf on 28/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ExceptionGeneraleChargementListePassages est la classe représentant une exception correspondant à une erreur générale du chargement des passages.
public class ExceptionGeneraleChargementListePassages : ExceptionPersonnalisee {
    
    /// Constructeur ExceptionGeneraleChargementListePassages sans paramètres.
    public init() {
        super.init(titreException: "Erreur générale du chargement des passages.", messageException: "Une erreur générale du chargement des passages est survenue.");
    }
}
