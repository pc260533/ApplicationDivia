//
//  Passage.swift
//  ApplicationDivia
//
//  Created by pcnf on 24/12/2020.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import Foundation;

/// Passage est la classe représentant un passage de transport.
public class Passage {
    /// L'heure du passage.
    private var heurePassage: Date;
    /// Le temps d'attente avant le passage.
    private var tempsAttenteAvantPassage: String;
    
    /// Retourner ou modifier l'heure de passage.
    public var HeurePassage: Date {
        get {
            return self.heurePassage;
        }
        set(heurePassage) {
            self.heurePassage = heurePassage;
        }
    }
    
    /// Retourner ou modifier le temps d'attente avant le passage.
    public var TempsAttenteAvantPassage: String {
        get {
            return self.tempsAttenteAvantPassage;
        }
        set(tempsAttenteAvantPassage) {
            self.tempsAttenteAvantPassage = tempsAttenteAvantPassage;
        }
    }
    
    /// Retourner l'heure de passage au format String.
    public var HeurePassageString: String {
        get {
            var res: String = "";
            let dateFormatter: DateFormatter = DateFormatter();
            dateFormatter.dateFormat = "HH:mm";
            res = dateFormatter.string(from: self.heurePassage);
            return res;
        }
    }
    
    /// Retourner le temps d'attente avant le passage avec le String min.
    public var TempsAttenteAvantPassageAvecMinutes: String {
        get {
            return self.tempsAttenteAvantPassage + "min";
        }
    }
    
    /// Constructeur Passage sans paramètres.
    public init() {
        self.heurePassage = Date();
        self.tempsAttenteAvantPassage = "";
    }
    
    /// Constructeur Passage prenant en paramètre l'heure du passage au format Date.
    /// - Parameters:
    ///   - heurePassage: L'heure du passage.
    public init(heurePassage: Date) {
        self.heurePassage = heurePassage;
        self.tempsAttenteAvantPassage = "";
        
        let calendar = Calendar.current;
        let dateCourante = Date();
        
        let dateFormatter: DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "HH:mm";
        let dateMinuit: Date = dateFormatter.date(from: "00:00")!;
        let dateMinuitMoins1: Date = dateFormatter.date(from: "23:59")!;
        
        let heuresMintuesComposantesCourantes = calendar.dateComponents([.hour, .minute], from: dateCourante);
        let heuresMinutesComposantes = calendar.dateComponents([.hour, .minute], from: self.heurePassage);
        
        var differenceEnMinutes: Int? = nil;
        
        if (self.heurePassage >= dateMinuitMoins1) {
            let heuresMintuesComposantesMinuitMoins1 = calendar.dateComponents([.hour, .minute], from: dateMinuitMoins1);
            let heuresMintuesComposantesMinuit = calendar.dateComponents([.hour, .minute], from: dateMinuit);
            var differenceEnMinutesTotale: Int = 0;
            if let differenceEnMinutesEntreCouranteEtMinuitMoins1 = calendar.dateComponents([.minute], from: heuresMintuesComposantesCourantes, to: heuresMintuesComposantesMinuitMoins1).minute {
                differenceEnMinutesTotale += differenceEnMinutesEntreCouranteEtMinuitMoins1 + 1;
            }
            if let differenceEnMinutesEntreCouranteEtMinuit = calendar.dateComponents([.minute], from: heuresMintuesComposantesMinuit, to: heuresMinutesComposantes).minute {
                differenceEnMinutesTotale += differenceEnMinutesEntreCouranteEtMinuit;
            }
            differenceEnMinutes = differenceEnMinutesTotale;
        }
        else {
            differenceEnMinutes = calendar.dateComponents([.minute], from: heuresMintuesComposantesCourantes, to: heuresMinutesComposantes).minute;
        }
        
        if let differenceEnMinutes = differenceEnMinutes {
            self.tempsAttenteAvantPassage = String(differenceEnMinutes);
        }
    }
    
    /// Constructeur Passage prenant en paramètre l'heure du passage au format String.
    /// - Parameters:
    ///   - heurePassage: L'heure du passage.
    public convenience init(heurePassage: String) {
        let dateFormatter: DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "HH:mm";
        if let heurePassage = dateFormatter.date(from: heurePassage) {
            self.init(heurePassage: heurePassage);
        }
        else {
            self.init();
        }
    }
    
}

