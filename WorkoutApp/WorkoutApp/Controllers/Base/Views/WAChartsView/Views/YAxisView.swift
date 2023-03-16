//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Alexey Grebennikov on 13.01.23.
//

import UIKit

final class YAxisView: WABaseView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()

    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        (0...9).reversed().forEach {
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRegular(with: 9)
            lable.textColor = R.Colors.inActive
            lable.textAlignment = .right
            lable.text = "\($0 * 10)" // TODO: - Remake to colculated interval

            stackView.addArrangedSubview(lable)
        }
    }
}

extension YAxisView {
    override func setupViews() {
        super.setupViews()

        setupView(stackView)
    }

    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
}


