//
//  TabCoordinator.swift
//  myRent
//
//  Created by Павел Грабчак on 16.02.2022.
//

import UIKit

enum TabBarPage {
    case apartments
    case steady
    case go

    init?(index: Int) {
        switch index {
        case 0:
            self = .apartments
        case 1:
            self = .steady
        case 2:
            self = .go
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .apartments:
            return "Квартиры"
        case .steady:
            return "Календарь"
        case .go:
            return "Настройки"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .apartments:
            return 0
        case .steady:
            return 1
        case .go:
            return 2
        }
    }
    
    func imageForTab() -> UIImage? {
        switch self {
        case .apartments:
            return UIImage(named: "first")
        case .steady:
            return UIImage(named: "second")
        case .go:
            return UIImage(named: "third")
        }
    }
    
    // Add tab icon selected / deselected color
    
    // etc
}


protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.go, .steady, .apartments]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func startApartamentsFlow(navigationController: UINavigationController){
        let apartamentsCoordinator = ApartamentsCoordinator.init(navigationController)
        apartamentsCoordinator.finishDelegate = self
        apartamentsCoordinator.start()
        childCoordinators.append(apartamentsCoordinator)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = TabBarPage.apartments.pageOrderNumber()
        /// Styling
        tabBarController.becomeDefault()

        
        /// In this step, we attach tabBarController to navigation controller associated with this coorda nator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.navigationBar.defaultAppearance()

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.imageForTab(),
                                                     tag: page.pageOrderNumber())

        switch page {
        case .apartments:
            startApartamentsFlow(navigationController: navController)
        case .steady:
            let steadyVC = SteadyViewController()
            steadyVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .steady:
                    self?.selectPage(.go)
                }
            }
            
            navController.pushViewController(steadyVC, animated: true)
        case .go:
            let goVC = GoViewController()
            goVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .go:
                    self?.finish()
                }
            }
            
            navController.pushViewController(goVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}

extension TabCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .apartaments:
            print("puk")
        default:
            break
        }
    }
    
    
}
