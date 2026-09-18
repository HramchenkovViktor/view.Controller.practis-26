//
//  ViewController.swift
//  view.Controller.practis#26
//
//  Created by Виктор on 18.09.2026.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

     private let titleLabel = UILabel()
     private let selectedButton = UIButton()
     private let imageAuto = UIImageView()
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Главный экран"
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(imageAuto)
        view.addSubview(selectedButton)
        
        titleLabel.text = "Заголовок"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .systemBlue
        titleLabel.layer.cornerRadius = 10
        titleLabel.clipsToBounds = true
        
        imageAuto.image = UIImage(systemName: "car.fill")
        imageAuto.contentMode = .scaleAspectFill
        
        selectedButton.setTitle("Нажми меня", for: .normal)
        selectedButton.setTitleColor(.white, for: .normal)
        selectedButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        selectedButton.backgroundColor = .systemBlue
        selectedButton.layer.cornerRadius = 10
        selectedButton.clipsToBounds = true
        selectedButton.addTarget(self, action: #selector(selectedButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(70)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            
        }
        imageAuto.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200)
            $0.width.equalTo(200)
        }
        selectedButton.snp.makeConstraints {
            $0.top.equalTo(imageAuto.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
    }
    @objc private func selectedButtonTapped() {
        let autoListViewController = AutoListViewController()
        navigationController?.pushViewController(autoListViewController, animated: true)
    }


}

