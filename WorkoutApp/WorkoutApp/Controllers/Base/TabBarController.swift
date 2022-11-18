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
        
//        let overviewController = OverviewController()
//        let sessionController = SessionController()
//        let progressController = ProgressController()
//        let settingsController = SettingsController()
//
//        let overviewNavigation = NavBarController(rootViewController: overviewController)
//        let sessionNavigation = NavBarController(rootViewController: sessionController)
//        let progressNavigation = NavBarController(rootViewController: progressController)
//        let settingsNavigation = NavBarController(rootViewController: settingsController)
//
//        overviewNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.overview,
//                                                     image: Resources.Images.TabBar.overview,
//                                                     tag: Tabs.overview.rawValue)
//        sessionNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.session,
//                                                    image: Resources.Images.TabBar.session,
//                                                    tag: Tabs.session.rawValue)
//        progressNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.progress,
//                                                     image: Resources.Images.TabBar.progress,
//                                                     tag: Tabs.progress.rawValue)
//        settingsNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings,
//                                                     image: Resources.Images.TabBar.settings,
//                                                     tag: Tabs.settings.rawValue)
//
//        setViewControllers([
//            overviewNavigation,
//            sessionNavigation,
//            progressNavigation,
//            settingsNavigation
//        ], animated: false)
    
    }

    private func getController(for tab: Tabs) -> BaseController {
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
