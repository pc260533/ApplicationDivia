//
//  Ligne.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// Ligne est la classe représentant une ligne sérializable.
/// Elle hérite de Codable.
public class Ligne : Codable {
    /// Le code de la ligne.
    private var codeLigne: String;
    /// Le nom de la ligne.
    private var nomLigne: String;
    /// Le sens de la ligne.
    private var sensLigne: String;
    /// La destination de la ligne.
    private var destinationLigne: String;
    /// La couleur de la ligne.
    private var couleurLigne: String;
    /// La liste des arrêts la ligne.
    private var listeDesArrets: ListeArrets;
    
    /// Retourner ou modifier le code de la ligne.
    public var CodeLigne: String {
        get {
            return self.codeLigne;
        }
        set(codeLigne) {
            self.codeLigne = codeLigne;
        }
    }
    
    /// Retourner ou modifier le nom de la ligne.
    public var NomLigne: String {
        get {
            return self.nomLigne;
        }
        set(nomLigne) {
            self.nomLigne = nomLigne;
        }
    }
    
    /// Retourner ou modifier le sens de la ligne.
    public var SensLigne: String {
        get {
            return self.sensLigne;
        }
        set(sensLigne) {
            self.sensLigne = sensLigne;
        }
    }

    /// Retourner ou modifier la destination de la ligne.
    public var DestinationLigne: String {
        get {
            return self.destinationLigne;
        }
        set(destinationLigne) {
            self.destinationLigne = destinationLigne;
        }
    }
    
    /// Retourner ou modifier la couleur de la ligne.
    public var CouleurLigne: String {
        get {
            return self.couleurLigne;
        }
        set(couleurLigne) {
            self.couleurLigne = couleurLigne;
        }
    }

    /// Retourner ou modifier la liste des arrêts de la ligne.
    public var ListeDesArrets: ListeArrets {
        get {
            return self.listeDesArrets;
        }
        set(listeDesArrets) {
            self.listeDesArrets = listeDesArrets;
        }
    }

    /// Constructeur Ligne sans paramètres.
    public init() {
        self.codeLigne = "";
        self.nomLigne = "";
        self.sensLigne = "";
        self.destinationLigne = "";
        self.couleurLigne = "";
        self.listeDesArrets = ListeArrets();
    }

    /// Constructeur Ligne prenant en paramètres le code, le nom, le sens, la destination et la couleur de la ligne.
    /// - Parameters:
    ///   - codeLigne: Le code de la ligne.
    ///   - nomLigne: Le nom de la ligne.
    ///   - sensLigne: Le sens de la ligne.
    ///   - destinationLigne: La destination de la ligne.
    ///   - couleurLigne: La couleur de la ligne.
    public init(codeLigne: String, nomLigne: String, sensLigne: String, destinationLigne: String, couleurLigne: String) {
        self.codeLigne = codeLigne;
        self.nomLigne = nomLigne;
        self.sensLigne = sensLigne;
        self.destinationLigne = destinationLigne;
        self.couleurLigne = couleurLigne;
        self.listeDesArrets = ListeArrets();
    }

    /// Constructeur Ligne prenant en paramètres une ligne.
    /// - Parameters:
    ///   - ligne: La ligne.
    public init(ligne: Ligne) {
        self.codeLigne = ligne.CodeLigne;
        self.nomLigne = ligne.NomLigne;
        self.sensLigne = ligne.SensLigne;
        self.destinationLigne = ligne.DestinationLigne;
        self.couleurLigne = ligne.CouleurLigne;
        self.listeDesArrets = ListeArrets();
    }
 
}
