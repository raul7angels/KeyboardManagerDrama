//
//  KeyboardManager.swift
//  KeyboardManagerDrama
//
//  Created by Paiste Family on 31/10/17.
//  Copyright © 2017 Bam Bam Labs. All rights reserved.
//

import UIKit

class KeyboardManager {
    weak var activeField: UITextField?
    weak var vc: UIViewController!
    weak var scrollView: UIScrollView!
    
    init(vc: UIViewController, scrollView: UIScrollView, activeField: UITextField?) {
        self.vc = vc
        self.scrollView = scrollView
        self.activeField = activeField
        NotificationCenter.default.addObserver(vc, selector: #selector(keyboardDidShow), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(vc, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        let tap = UITapGestureRecognizer(target: vc, action: #selector(hideKeyboard))
        tap.numberOfTouchesRequired = 1
        self.scrollView.addGestureRecognizer(tap)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        if let activeField = activeField, let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("Keyboard height is \(keyboardSize.height)")
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            scrollView.scrollRectToVisible(activeField.frame, animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        activeField?.resignFirstResponder()
    }
    
}
