//
//  ExceptionPersonnalisee.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/10/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// ExceptionPersonnalisee est la classe représentant une exception personnalisée de l'application.
public class ExceptionPersonnalisee : Error {
    /// Le titre de l'exception.
    private var titreException: String;
    /// Le message de l'exception.
    private var messageException: String;
    /// Le message développeur de l'exception.
    private var messageDeveloppeur: String;
    
    /// Retourner ou modifier le titre de l'exception.
    public var TitreException: String {
        get {
            return self.titreException;
        }
        set(titreException) {
            self.titreException = titreException;
        }
    }

    /// Retourner ou modifier le message de l'exception.
    public var MessageException: String {
        get {
            return self.messageException;
        }
        set(messageException) {
            self.messageException = messageException;
        }
    }

    /// Retourner ou modifier le message développeur de l'exception.
    public var MessageDeveloppeur: String {
        get {
            return self.messageDeveloppeur;
        }
        set(messageDeveloppeur) {
            self.messageDeveloppeur = messageDeveloppeur;
        }
    }

    /// Retourner le message complet de l'exception.
    public var MessageComplet: String {
        get {
            var messageComplet: String = self.messageException;
            if (!self.messageDeveloppeur.isEmpty) {
                messageComplet += "\nMessage développeur : " + self.messageDeveloppeur;
            }
            return messageComplet;
        }
    }
    
    /// Constructeur ExceptionPersonnalisee prenant en paramètre le titre et le message de l'exception.
    /// - Parameters:
    ///   - titreException: Le titre de l'exception.
    ///   - messageException: Le message de l'exception.
    public init(titreException: String, messageException: String) {
        self.titreException = titreException;
        self.messageException = messageException;
        self.messageDeveloppeur = "";
    }
}
