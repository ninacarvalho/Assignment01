//
//  ViewController.swift
//  Assignment01
//
//  Created by Marina Carvalho on 2024-09-20.
//

import UIKit

class ViewController: UIViewController {
    
    var isMetric: Bool = true
    var weight: Double?
    var height: Double?
    var bmi: Double?
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    
    @IBOutlet weak var unitSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var weightUnitLbl: UILabel!
    @IBOutlet weak var heightUnitLbl: UILabel!
    
    @IBOutlet weak var bmiResultLbl: UILabel!
    @IBOutlet weak var bmiCategoryLbl: UILabel!
    
    @IBOutlet weak var bmiIntervalsTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResultLbl.text = ""
        bmiCategoryLbl.text = ""
        bmiIntervalsTxt.text = ""
        
        // Default to Metric
        unitSegmentControl.selectedSegmentIndex = 0
        changeUnits(unitSegmentControl)
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        guard let weight = strToDouble(weightInput), weight > 0, weight < 1000 else {
            bmiResultLbl.text = "Invalid weight"
                return
        }
        
        guard let height = strToDouble(heightInput), height > 0, height < 200 else {
            bmiResultLbl.text = "Invalid height"
            return
        }

        bmi = weight/(height*height)
        if(!isMetric) {
            bmi = bmi!*703
        }
        
        bmiResultLbl.text = String(format: "%.2f", bmi!)
        bmiCategoryLbl.text = getCategory(bmi!)
        bmiIntervalsTxt.text = showIntervals()
    }

    @IBAction func changeUnits(_ sender: UISegmentedControl) {
       //Metric = 0; Imperial = 1
        if sender.selectedSegmentIndex == 0 {
            changeLabelsToMetric()
            isMetric = true
        } else if sender.selectedSegmentIndex == 1 {
            changeLabelsToImperial()
            isMetric = false
        }
        clearFields();
    }
    
    func getCategory (_ bmi: Double) -> String {
        switch bmi {
        case ..<18.5:
            return "You are underweight"
        case 18.5...24.9:
            return "You have a normal weight"
        case 24.9...29.9:
            return "You are overweight"
        default:
            return "You are obese"
        }
    }
    
    func showIntervals () -> String {
        return "BMI Categories:\nUnderweight = <18.5\nNormal weight = 18.5–24.9\nOverweight = 25–29.9\nObesity = BMI of 30 or greater"
    }
    
    func strToDouble (_ userIput : UITextField) -> Double? {
        if let inputText = userIput.text, let inputDouble = Double(inputText) {
            return inputDouble
        }
        return nil
    }
    
    func changeLabelsToMetric (){
        weightUnitLbl.text = "kg"
        heightUnitLbl.text = "m"
    }
    
    func changeLabelsToImperial (){
        weightUnitLbl.text = "lbs"
        heightUnitLbl.text = "in"
    }
    
    func clearFields (){
        bmiResultLbl.text = ""
        bmiCategoryLbl.text = ""
        bmiIntervalsTxt.text = ""
        weightInput.text = ""
        heightInput.text = ""

    }
}
