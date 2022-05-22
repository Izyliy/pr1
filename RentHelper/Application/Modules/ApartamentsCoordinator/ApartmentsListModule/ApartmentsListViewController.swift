//
//  ApartmentsListViewController.swift
//  RentHelper
//
//  Created by Павел Грабчак on 01.03.2022.
//

import UIKit
import SnapKit

class ApartmentsListViewController: UIViewController {
    
    private let testButton: UIButton = {
        let button = UIButton()
        button.setTitle("dewfcerdsv", for: .normal)
        button.enabledAppearance()

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testButton)
        
        testButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.width.width.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        defaultAppearance()
//        button.layer.cornerRadius = 18
//        button.titleLabel?.font = UIFont(name: FontFamily.FiraSans.regular.name, size: 30)
    }

}
