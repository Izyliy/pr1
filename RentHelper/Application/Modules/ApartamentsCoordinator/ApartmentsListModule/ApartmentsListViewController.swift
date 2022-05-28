//
//  ApartmentsListViewController.swift
//  RentHelper
//
//  Created by Павел Грабчак on 01.03.2022.
//

import UIKit
import SnapKit

class ApartmentsListViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear

        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FlatPreviewTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        defaultAppearance()
    }
}

extension ApartmentsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

extension ApartmentsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlatPreviewTableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}
