//
//  Arret.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// Arret est la classe représentant un arrêt sérializable.
/// Elle hérite de Codable.
public class Arret : Codable {
    /// Le code de l'arrêt.
    private var codeArret: String;
    /// Le nom de l'arrêt.
    private var nomArret: String;
    /// La référence de l'arrêt.
    private var referenceArret: String;
    /// La ligne de l'arrêt.
    private var ligneArret: Ligne?;
    /// Le booléen indiquant si l'arrêt est un arrêt favoris.
    private var favorisArret: Bool = false;
    
    /// Retourner ou modifier le code de l'arrêt.
    public var CodeArret: String {
        get {
            return self.codeArret;
        }
        set(codeArret) {
            self.codeArret = codeArret;
        }
    }
    
    /// Retourner ou modifier le nom de l'arrêt.
    public var NomArret: String {
        get {
            return self.nomArret;
        }
        set(nomArret) {
            self.nomArret = nomArret;
        }
    }
    
    /// Retourner ou modifier la référence de l'arrêt.
    public var ReferenceArret: String {
        get {
            return self.referenceArret;
        }
        set(referenceArret) {
            self.referenceArret = referenceArret;
        }
    }
    
    /// Retourner ou modifier la ligne de l'arrêt.
    public var LigneArrret: Ligne? {
        get {
            return self.ligneArret;
        }
        set(ligneArret) {
            self.ligneArret = ligneArret;
        }
    }

    /// Retourner ou modifier le booléen indiquant si l'arrêt est un arrêt favoris.
    public var FavorisArret: Bool {
        get {
            return self.favorisArret;
        }
        set(favorisArret) {
            self.favorisArret = favorisArret;
        }
    }
    
    /// L'énumération de clés pour la sérialization.
    private enum CodingKeys: CodingKey {
        case codeArret;
        case nomArret;
        case referenceArret;
    }
    
    /// Constructeur Arret sans paramètres.
    init() {
        self.codeArret = "";
        self.nomArret = "";
        self.referenceArret = "";
        self.ligneArret = nil;
        self.favorisArret = false;
    }
    
    /// Constructeur Arret prenant en paramètre le code, le nom, la référence et la ligne de l'arrêt.
    /// - Parameters:
    ///   - codeArret: Le code de l'arrêt.
    ///   - nomArret: Le nom de l'arrêt.
    ///   - referenceArret: La référence de l'arrêt.
    ///   - ligneArret: La ligne contenant l'arrêt.
    init(codeArret: String, nomArret: String, referenceArret: String, ligneArret: Ligne) {
        self.codeArret = codeArret;
        self.nomArret = nomArret;
        self.referenceArret = referenceArret;
        self.ligneArret = ligneArret;
        self.favorisArret = false;
    }
    
    
    /// Constructeur Arret prenant en paramètre un arret.
    /// - Parameter arret: L'arrêt.
    init(arret: Arret) {
        self.codeArret = arret.CodeArret;
        self.nomArret = arret.NomArret;
        self.referenceArret = arret.ReferenceArret;
        self.ligneArret = nil;
        self.favorisArret = false;
    }

}
