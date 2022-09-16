//
//  ContinueView.swift
//  GowabiAssignment
//
//  Created by Stanislav Rassolenko on 9/15/22.
//

import UIKit

class ContinueView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - UI Elements
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // MARK: - Config
    
    private func setupHierarchy() {
        self.addSubview(continueButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            continueButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            continueButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            continueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            continueButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    private func setupView() {
        self.backgroundColor = .systemBackground
    }
}
