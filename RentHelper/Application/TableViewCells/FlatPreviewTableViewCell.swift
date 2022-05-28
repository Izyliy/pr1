//
//  FlatPreviewTableViewCell.swift
//  RentHelper
//
//  Created by Павел Грабчак on 22.05.2022.
//

import UIKit

class FlatPreviewTableViewCell: UITableViewCell {
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(view)
        view.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("\nbib\n")
    }
}
