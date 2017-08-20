//
//  PopUpViewController.swift
//  PopUp
//
//  Created by Anirudha on 19/08/17.
//  Copyright © 2017 Anirudha Mahale. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popView: UIView!
    var originalFrame: CGRect?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        originalFrame = popView.frame
        
        let translation = CGAffineTransform(translationX: 0, y: -view.bounds.height)
        let scale = CGAffineTransform(scaleX: 0, y: 0)
        
        popView.transform = scale.concatenating(translation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let originalFrame = originalFrame {
            // self.popView.transform = CGAffineTransform(translationX: originalFrame.origin.x, y: originalFrame.origin.y)
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.popView.transform = CGAffineTransform(translationX: 0, y: originalFrame.origin.y)
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.3, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [.curveEaseIn], animations: {
            self.popView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {_ in
            self.popView.transform = .identity
        })
    }
    
    @IBAction func dismissPopUp(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn], animations: {
            self.popView.transform = CGAffineTransform(translationX: 0, y: -40)
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.curveEaseOut], animations: {
            self.popView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height)
        }, completion: { _ in
            self.dismiss(animated: true, completion: nil)
        })
    }
}
