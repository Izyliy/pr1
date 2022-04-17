//
//  ApartmentsListViewController.swift
//  RentHelper
//
//  Created by Павел Грабчак on 01.03.2022.
//

import UIKit

class ApartmentsListViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 18
            button.titleLabel?.font = UIFont(name: FontFamily.FiraSans.regular.name, size: 30)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.layer.cornerRadius = 18
//        button.titleLabel?.font = UIFont(name: FontFamily.FiraSans.regular.name, size: 30)
    }

}
