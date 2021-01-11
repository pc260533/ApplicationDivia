//
//  ExceptionGeneraleChargementListeLignes.swift
//  ApplicationDivia
//
//  Created by pcnf on 28/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ExceptionGeneraleChargementListeLignes est la classe représentant une exception correspondant à une erreur générale du chargement des lignes.
public class ExceptionGeneraleChargementListeLignes : ExceptionPersonnalisee {

    /// Constructeur ExceptionGeneraleChargementListeLignes sans paramètres.
    public init() {
        super.init(titreException: "Erreur générale du chargement des lignes.", messageException: "Une erreur générale du chargement des lignes est survenue.");
    }
}
