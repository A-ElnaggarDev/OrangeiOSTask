//
//  HomeVC.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Core.shared.getCategory()!)
        print(Core.shared.getCountryCode()!)
    }

}
