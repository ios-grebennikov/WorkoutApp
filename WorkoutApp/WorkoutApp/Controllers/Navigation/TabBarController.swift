//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 13.11.22.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
        
        
//        switchTo(tab: .progress)
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }

    private func configureAppearance() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inActive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        
        setViewControllers(controllers, animated: false)
            
    }

    private func getController(for tab: Tabs) -> WABaseController {
        switch tab {
        case .overview:
            return OverviewController()
        case .session:
            return SessionController()
        case .progress:
            return ProgressController()
        case .settings:
            return SettingsController()
        }
    }

        
}
