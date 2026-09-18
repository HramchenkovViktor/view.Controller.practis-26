//
//  AutoCell.swift
//  view.Controller.practis#26
//
//  Created by Виктор on 18.09.2026.
//

import UIKit
import SnapKit

class AutoCell: UICollectionViewCell {

    let nameAuto = UILabel()
    let priceAuto = UILabel()
    let horsePower = UILabel()
    let imageNameAuto = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(imageNameAuto)
        contentView.addSubview(nameAuto)
        contentView.addSubview(priceAuto)
        contentView.addSubview(horsePower)
        
        imageNameAuto.contentMode = .scaleAspectFit
        imageNameAuto.clipsToBounds = true
        
        nameAuto.font = .systemFont(ofSize: 20, weight: .bold)
        nameAuto.textColor = .white
        nameAuto.backgroundColor = .systemGreen
        nameAuto.numberOfLines = 0
        
        priceAuto.font = .systemFont(ofSize: 18, weight: .semibold)
        priceAuto.textColor = .white
        priceAuto.backgroundColor = .systemGreen
        priceAuto.numberOfLines = 0
        
        horsePower.font = .systemFont(ofSize: 16, weight: .semibold)
        horsePower.textColor = .white
        horsePower.backgroundColor = .systemGreen
        horsePower.numberOfLines = 0
        
        
    }
    
    func setupConstraints() {
        imageNameAuto.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(200)
            
        }
        nameAuto.snp.makeConstraints {
            $0.top.equalTo(imageNameAuto.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
        priceAuto.snp.makeConstraints {
            $0.top.equalTo(nameAuto.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
        horsePower.snp.makeConstraints {
            $0.top.equalTo(priceAuto.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
    }
    func configure(with car: Car) {
        
        imageNameAuto.image = UIImage(resource: car.imageName)
        nameAuto.text =   "🚗 \(car.name)"
        priceAuto.text =  "🤑 \(car.price)"
        horsePower.text = "🐎🔋 \(car.horsepower)"
        
    }
    
    
}
