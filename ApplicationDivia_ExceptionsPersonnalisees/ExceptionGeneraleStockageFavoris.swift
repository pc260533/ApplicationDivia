//
//  ExceptionGeneraleStockageFavoris.swift
//  ApplicationDivia
//
//  Created by pcnf on 28/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ExceptionGeneraleStockageFavoris est la classe représentant une exception correspondant à une erreur générale du fichier de stockage des favoris.
public class ExceptionGeneraleStockageFavoris : ExceptionPersonnalisee {
    
    /// Constructeur ExceptionGeneraleStockageFavoris sans paramètres.
    public init() {
        super.init(titreException: "Erreur générale du stockage des favoris.", messageException: "Une erreur générale du fichier de stockage des favoris est survenue.");
    }
}
