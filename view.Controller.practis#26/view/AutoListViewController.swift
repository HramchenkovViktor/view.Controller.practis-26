//
//  AutoListViewController.swift
//  view.Controller.practis#26
//
//  Created by Виктор on 18.09.2026.
//

import UIKit
import SnapKit

struct Car {
    let name: String
    let price: Int
    let horsepower: Int
    let imageName: ImageResource
}

class AutoListViewController: UIViewController {

    let cars: [Car] = [
        Car(name: "BMW M5", price: 120000, horsepower: 727, imageName: .bmwM5),
        Car(name: "Audi RS6", price: 125000, horsepower: 630, imageName: .audiRS6),
        Car(name: "Mercedes-AMG GT", price: 140000, horsepower: 585, imageName: .mercedesAMGGT),
        Car(name: "Porsche 911", price: 135000, horsepower: 394, imageName: .porsche911),
        Car(name: "Ford Mustang GT", price: 65000, horsepower: 480, imageName: .fordMustang),
        Car(name: "Nissan GT-R", price: 120000, horsepower: 565, imageName: .nissanGTR)
    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AutoCell.self, forCellWithReuseIdentifier: "AutoCell")
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }


}
extension AutoListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let car = cars[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AutoCell", for: indexPath) as? AutoCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: car)
        return cell
        
        
    }
    
}

extension AutoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let horizontalInset: CGFloat = 10
        
        let availableWidth = collectionView.bounds.width - horizontalInset * 2
        let cellWidth = (availableWidth - spacing) / 2
        return CGSize(width: cellWidth, height: 400)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let car = cars[indexPath.item]
        let autoDetailsViewController = AutoDetailsViewController(car: car)
        navigationController?.pushViewController(autoDetailsViewController, animated: true)
        
    }
    
}
