//
//  WAButton.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 15.11.22.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {

    private var type: WAButtonType = .primary

    private let lable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        return lable
    }()

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()

    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type

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

    func setTitle(_ title: String?) {
        lable.text = title
    }
}

private extension WAButton {

    func setupViews() {
        setupView(lable)
        setupView(iconView)
    }

    func constraintViews() {
        var horisontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }

        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),

            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
        ])
    }

    func configureAppearance() {
        switch type {
        case .primary:
            lable.textColor = R.Colors.inActive
            lable.font = R.Fonts.helveticaRegular(with: 13)
            iconView.tintColor = R.Colors.inActive

        case .secondary:
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            lable.textColor = R.Colors.active
            lable.font = R.Fonts.helveticaRegular(with: 15)
            iconView.tintColor = R.Colors.active
        }

        makeSystem(self)
    }
}
