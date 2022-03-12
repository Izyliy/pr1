//
//  ApartmentsCoordinator.swift
//  RentHelper
//
//  Created by Павел Грабчак on 24.02.2022.
//

import UIKit

protocol ApartamentsCoordinatorProtocol: Coordinator {
    func showApartamentsCoordinator()
}

class ApartamentsCoordinator: ApartamentsCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .apartaments }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showApartamentsCoordinator()
    }
    
    deinit {
        print("ApartamentsCoordinator deinit")
    }
    
    func showApartamentsCoordinator() {
        navigationController.pushViewController(getReadyModule(), animated: true)
    }
    
    //MARK: - Methods for creating modules
    
    func getReadyModule() -> ReadyViewController {
        let viewController: ReadyViewController = .init()
        
        viewController.didSendEventClosure = { [weak self] event in
            guard let apList = self?.getApartamentsListModule() else { return }
            
            self?.navigationController.pushViewController(apList, animated: true)
        }
        
        return viewController
    }
    
    func getApartamentsListModule() -> ApartamentsListViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "ApartamentsList", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ApartamentsList") as! ApartamentsListViewController
                
        return viewController
    }
}


