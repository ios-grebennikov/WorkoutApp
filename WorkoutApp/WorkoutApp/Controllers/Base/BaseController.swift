//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 14.11.22.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    



}

@objc extension BaseController {
    
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Resources.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("navBarLeftButton did tap")
    }
    
    func navBarRightButtonHandler() {
        print("navBarRightButton did tap")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inActive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
        
    }
}