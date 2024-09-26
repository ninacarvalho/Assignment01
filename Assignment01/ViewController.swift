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
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    
    @IBOutlet weak var weightUnitLbl: UILabel!
    @IBOutlet weak var heightUnitLbl: UILabel!
    
    @IBOutlet weak var bmiResultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        guard let weight = strToDouble(weightInput), weight > 0 else {
            bmiResultLbl.text = "Invalid weight"
                return
        }
        
        guard let height = strToDouble(heightInput), height > 0 else {
            bmiResultLbl.text = "Invalid height"
            return
        }
        
        let bmi: Double = weight/(height*height)
        bmiResultLbl.text = String(format: "%.2f", bmi)
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
        heightUnitLbl.text = "ft"
    }
}
