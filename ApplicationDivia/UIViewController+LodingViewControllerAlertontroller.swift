//
//  UIViewController+LodingViewController.swift
//  ApplicationDivia
//
//  Created by pcnf on 06/01/2021.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit;

/// Extension de la classe UIViewController permettant de créer un LoadingViewController spécifique et de retourner un UIAlertController spécifique initilisé avec le contenu d'une exception personnalisée.  
public extension UIViewController {
    
    /// Retourner le LoadingViewController spécifique.
    public var LoadingController: LoadingViewController {
        get {
            let loadingViewController: LoadingViewController = LoadingViewController();
            loadingViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            loadingViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve;
            return loadingViewController;
        }
    }

    /// Retourner le UIAlertController spécifique initilisé avec le contenu d'une exception personnalisée
    /// - Parameters:
    ///   - exceptionPersonnalisee: L'exception personnalisée.
    public func getAlertControllerAvecExceptionPersonnalise(exceptionPersonnalisee: ExceptionPersonnalisee) -> UIAlertController {
        let alertController = UIAlertController(title: exceptionPersonnalisee.TitreException, message: exceptionPersonnalisee.MessageComplet, preferredStyle: UIAlertController.Style.alert);
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
        return alertController;
    }
    
}
