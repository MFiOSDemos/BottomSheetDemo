//
//  ViewController.swift
//  BottomSheetDemo
//
//  Created by changyou on 2022/1/2.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // Defined UI views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "百字令·偶忆"
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()

    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.isEditable = false
        textView.text = "横街南巷，记钿车小小，翠帘徐揭。绿酒分曹人散后，心事低徊潜说。莲子湖头，枇杷花下，绾就同心结。明珠未斛，朔风千里催别。\n同是沦落天涯，青青柳色，争忍先攀折。红浪香温围夜玉，堕我怀中明月。暮雨空归，秋河不动，虬箭丁丁咽。十年一梦，鬓丝今已如雪。 "
        return textView
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = view.tintColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textView, spacer, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        // 3. Add action
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)

    }
    
    func setupView() {
        // cosmetics
        view.backgroundColor = .systemBackground
    }
    
    // Add subviews and set constraints
    func setupConstraints() {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        // Call .activate method to enable the defined constraints
        NSLayoutConstraint.activate([
            // Set containerStackView edges to superview with 24 spacing
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            // Set button height
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // To be updated
    @objc func presentModalController() {
        let vc = CustomModalViewController()
        vc.modalPresentationStyle = .overCurrentContext
        // Keep animated value as false
        // Custom Modal presentation animation will be handled in VC itself
        self.present(vc, animated: false)
    }
    
   
}

