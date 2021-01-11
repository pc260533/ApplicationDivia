//
//  ExceptionGeneraleChargementListeArrets.swift
//  ApplicationDivia
//
//  Created by pcnf on 28/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ExceptionGeneraleChargementListeArrets est la classe représentant une exception correspondant à une erreur générale du chargement des arrêts.
public class ExceptionGeneraleChargementListeArrets : ExceptionPersonnalisee {

    /// Constructeur ExceptionGeneraleChargementListeArrets sans paramètres.
    public init() {
        super.init(titreException: "Erreur générale du chargement des arrêts.", messageException: "Une erreur générale du chargement des arrêts est survenue.");
    }
}
