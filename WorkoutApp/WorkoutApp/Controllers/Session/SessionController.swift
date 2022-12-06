//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 14.11.22.
//

import UIKit

class SessionController: WABaseController {
    
    private let timerView = TimerView()
    
    private let timerDuration = 13.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.navBarRightButtonHandler()
                }
            }
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForNavBarButton(timerView.state == .isRunning ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart,
                                at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(R.Strings.Session.navBarStart, at: .left)
        
    }

}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = { [weak self] progress in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.navBarRightButtonHandler()
                print(progress)
            }
        }
    }
}
