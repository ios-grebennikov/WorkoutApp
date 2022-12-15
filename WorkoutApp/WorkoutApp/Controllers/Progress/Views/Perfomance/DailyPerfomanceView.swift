//
//  DailyPerfomanceView.swift.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 15.12.22.
//

import UIKit

final class DailyPerfomanceView: WABaseInfoView {
    
    private let barsView = WABarsView()
    
    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)
    }

    
}

extension DailyPerfomanceView {
    override func setupViews() {
        super.setupViews()
        
        setupView(barsView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}