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
        navigationController.pushViewController(getApartmentsListModule(), animated: true)
    }
    
    //MARK: - Methods for creating modules
    func getApartmentsListModule() -> ApartmentsListViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: StoryboardScene.ApartmentsList.storyboardName, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: StoryboardScene.ApartmentsList.storyboardName) as! ApartmentsListViewController
                
        return viewController
    }
}


