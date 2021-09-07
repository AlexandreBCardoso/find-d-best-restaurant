//
//  MenuCollectionCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 02/09/21.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: MenuCollectionCell.self)
    
    // MARK: - UI Element
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray300
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "rest-1")
        return imageView
    }()
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Nome do restaurante"
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}

// MARK: - CodeView Extension

extension MenuCollectionCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(cardView)
        cardView.addSubview(menuImageView)
        containerView.addSubview(itemNameLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().inset(16)
        }
        
        cardView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        menuImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        itemNameLabel.snp.makeConstraints { make in
            make.top.equalTo(menuImageView.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        cardView.layer.cornerRadius = 12
        cardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}