//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 5.03.23.
//

import UIKit

final class TrainingCellView: UICollectionViewCell {
    static let id = "TrainingCellView"
    
    private let checkMarkView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Overview.checkmarkNotDone
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inActive
        return label
    }()
    
    private let rightArrowView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Overview.rightArrow
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func configure(with title: String, subTitle: String, isDone: Bool) {
        self.title.text = title
        self.subTitle.text = subTitle
        
        checkMarkView.image = isDone ? R.Images.Overview.checkmarkDone : R.Images.Overview.checkmarkNotDone
    }
}

private extension TrainingCellView {
    func setupViews() {
        setupView(checkMarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
        setupView(rightArrowView)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            checkMarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkMarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMarkView.heightAnchor.constraint(equalToConstant: 28),
            checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),

            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
            
            
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
    }
    
}


