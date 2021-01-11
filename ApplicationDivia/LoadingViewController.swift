//
//  LoadingViewController.swift
//  ApplicationDivia
//
//  Created by pcnf on 07/01/2021.
//  Copyright © 2020 Pierre-Nicolas Chassagne. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5);

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark);
        let blurEffectView = UIVisualEffectView(effect: blurEffect);
        blurEffectView.alpha = 0.8;
        blurEffectView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight];
        blurEffectView.frame = self.view.bounds;
        
        self.view.insertSubview(blurEffectView, at: 0);
        
        let activityIndicatorView = UIActivityIndicatorView();
        activityIndicatorView.style = UIActivityIndicatorView.Style.large;
        activityIndicatorView.color = UIColor.white;
        activityIndicatorView.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin];
        activityIndicatorView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY);
        activityIndicatorView.startAnimating();
        
        self.view.addSubview(activityIndicatorView);
    }

}
