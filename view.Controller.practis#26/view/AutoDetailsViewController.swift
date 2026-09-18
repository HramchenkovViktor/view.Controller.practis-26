//
//  AutoDetailsViewController.swift
//  view.Controller.practis#26
//
//  Created by Виктор on 18.09.2026.
//

import UIKit
import SnapKit

class AutoDetailsViewController: UIViewController {

    let imageNameAuto = UIImageView()
    let nameAuto = UILabel()
    let priceAuto = UILabel()
    let horsepowerAuto = UILabel()
    
    
    let car: Car
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        setupUI()
        setupConstraints()
        configure(with: car)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageNameAuto)
        view.addSubview(nameAuto)
        view.addSubview(priceAuto)
        view.addSubview(horsepowerAuto)
        
        imageNameAuto.contentMode = .scaleAspectFit
        imageNameAuto.clipsToBounds = true
        
        nameAuto.font = .systemFont(ofSize: 20, weight: .bold)
        nameAuto.textColor = .white
        nameAuto.backgroundColor = .systemBlue
        nameAuto.clipsToBounds = true
        nameAuto.layer.cornerRadius = 15
        nameAuto.textAlignment = .center
        
        priceAuto.font = .systemFont(ofSize: 20, weight: .bold)
        priceAuto.textColor = .white
        priceAuto.backgroundColor = .systemBlue
        priceAuto.clipsToBounds = true
        priceAuto.layer.cornerRadius = 15
        priceAuto.textAlignment = .center
        
        horsepowerAuto.font = .systemFont(ofSize: 20, weight: .bold)
        horsepowerAuto.textColor = .white
        horsepowerAuto.backgroundColor = .systemBlue
        horsepowerAuto.clipsToBounds = true
        horsepowerAuto.layer.cornerRadius = 15
        horsepowerAuto.textAlignment = .center
 
    }
    
    func setupConstraints() {
        imageNameAuto.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(400)
        }
        nameAuto.snp.makeConstraints {
            $0.top.equalTo(imageNameAuto.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        priceAuto.snp.makeConstraints{
            $0.top.equalTo(nameAuto.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        horsepowerAuto.snp.makeConstraints{
            $0.top.equalTo(priceAuto.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
    }
    func configure(with car: Car) {
        imageNameAuto.image = UIImage(resource: car.imageName)
        nameAuto.text = "🚗 \(car.name)"
        priceAuto.text = "$ \(car.price) $"
        horsepowerAuto.text = "🐎🔋 \(car.horsepower) HP"
    }

}
