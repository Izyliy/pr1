//
//  ReadyVievController.swift
//  myRent
//
//  Created by Павел Грабчак on 16.02.2022.
//

import UIKit

class ReadyViewController: UIViewController {

    var didSendEventClosure: ((ReadyViewController.Event) -> Void)?

    private let readyButton: UIButton = {
        let button = UIButton()
        button.setTitle("apts", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 100.0

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        view.backgroundColor = .white

        view.addSubview(readyButton)

        readyButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            readyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            readyButton.topAnchor.constraint(equalTo: view.topAnchor),
            readyButton.widthAnchor.constraint(equalToConstant: 200),
            readyButton.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        readyButton.addTarget(self, action: #selector(didTapReadyButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("ReadyViewController deinit")
    }
    
    @objc private func didTapReadyButton(_ sender: Any) {
        didSendEventClosure?(.ready)
    }
}

extension ReadyViewController {
    enum Event {
        case ready
    }
}

