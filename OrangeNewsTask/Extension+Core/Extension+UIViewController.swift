//
//  Extension+UIViewController.swift
//  OrangeNewsTask
//
//  Created by maika on 09/02/2022.
//

import UIKit


//hide keyboard when tap on screen
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
