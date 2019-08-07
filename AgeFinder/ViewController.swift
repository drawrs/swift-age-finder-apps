//
//  ViewController.swift
//  AgeFinder
//
//  Created by Rizal Hilman on 06/08/19.
//  Copyright © 2019 Rizal Hilman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFiledBirtDate: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    var datePickerView = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func textFieldTouched(_ sender: UITextField) {
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
    }
    
    
    @IBAction func calculateAge(_ sender: UIButton) {
        guard let txtBirthDate = textFiledBirtDate.text else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        guard let date = dateFormatter.date(from: txtBirthDate) else {return}
        
        let age = calculateAgeFromDate(birtDate: date)
        let image = generateImageFromAge(age: age)
        
        labelResult.isHidden = false
        labelResult.text = "\(age) years old"
        
        imageView.isHidden = false
        imageView.image = image
    }
    
    @IBAction func mainViewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc func handleDatePicker(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        textFiledBirtDate.text = dateFormatter.string(from: sender.date)
    }
    
    func generateImageFromAge(age: Int) -> UIImage? {
        if age < 5 {
            return UIImage(named: "Baby")
        } else if age < 10 {
            return UIImage(named: "Boy")
        } else if age < 20 {
            return UIImage(named: "Teenager")
        } else if age < 40 {
            return UIImage(named: "Teenager")
        } else {
            return UIImage(named: "GrandFather")
        }
    }
    
    func calculateAgeFromDate(birtDate: Date) -> Int {
        let calender = Calendar.current
        let currentDate = Date()
        
        let birthYear = calender.component(.year, from: birtDate)
        let currYear = calender.component(.year, from: currentDate)
        
        let age = currYear - birthYear
        
        return age
    }
    
}
