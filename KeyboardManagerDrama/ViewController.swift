//
//  ViewController.swift
//  KeyboardManagerDrama
//
//  Created by Paiste Family on 31/10/17.
//  Copyright © 2017 Bam Bam Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var activeField: UITextField?
    var keyboardManager: KeyboardManager!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardManager = KeyboardManager(vc: self, scrollView: scrollView, activeField: activeField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }

}

