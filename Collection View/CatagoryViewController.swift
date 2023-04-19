//
//  CatagoryViewController.swift
//  Collection View
//
//  Created by R93 on 02/01/23.
//

import UIKit
struct Employee{
    var name: String
    var ID: Int
    var salary: Double
    var isHonest: Bool
}
struct CarItem {
    var name: String
    var price: Double
    var discountedPrice: Double
    var milage: String
    var model: String
}
class CatagoryViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var employeeCollectionView: UICollectionView!
    // MARK: - variable
    var arrEmployee: [Employee] = []
    var arrCarItems: [CarItem] = []
    var numberOfItemsInRow: Int = 3
    var interItemSpace: CGFloat = 16
    // MARK: - lifecycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setup()
    }
    
    private func setup() {
        LoadEmployee()
        loadCarItems()
        configerCatagoryCollectionview()
    }
    private func LoadEmployee() {
        let employee1: Employee = Employee(name: "bhargav domadiya", ID: 1, salary: 45000, isHonest: true)
        let employee2: Employee = Employee(name: "Rakshil Dudhat", ID: 2, salary: 50000, isHonest: true)
        let employee3: Employee = Employee(name: "Rahul Sohaliya", ID: 3, salary: 45000, isHonest: true)
        arrEmployee = [employee1, employee2, employee3]
    }
    
    private func loadCarItems() {
        let car1: CarItem = CarItem(name: "honda", price: 230000.0, discountedPrice: 10000.0, milage: "20 kms/l", model: "2021")
        let car2: CarItem = CarItem(name: "suzuki", price: 450000.0, discountedPrice: 5000.0, milage: "12 kms/l", model: "2019")
   arrCarItems = [car1, car2]
    }
    
    private func configerCatagoryCollectionview() {
        let nibFile: UINib = UINib(nibName: "EmployeeCollectionViewCell", bundle: nil)
        employeeCollectionView.register(nibFile, forCellWithReuseIdentifier: "EmployeeCollectionViewCell")
    }
}

extension CatagoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        let cell: EmployeeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeCollectionViewCell", for: indexPath) as! EmployeeCollectionViewCell
        let employee = arrEmployee[indexPath.row]
        cell.nameLabel.text = "\(employee.name) \n\(employee.salary)"
        
        if indexPath.row == selectedIndex {
            cell.layer.borderColor = UIColor.red.cgColor
        }else {
            cell.layer.borderColor = UIColor.blue.cgColor
        }
        cell.layer.borderWidth = 1
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
        } else {
            let cell: CarItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarItemCollectionViewCell", for: indexPath) as! CarItemCollectionViewCell
            cell.nameLabel.text = arrCarItems[indexPath.row].name
            cell.priceLabel.text = "$ \(arrCarItems[indexPath.row].price)"
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return arrEmployee.count
        } else {
            return arrCarItems.count
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CatagoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
