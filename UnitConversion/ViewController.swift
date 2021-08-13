//
//  ViewController.swift
//  UnitConversion
//
//  Created by gadgetzone on 12/07/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let array1 = ["inch", "feet", "yard"]
    let array2 = ["inch", "feet", "yard"]
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabelField: UILabel!
    @IBOutlet weak var pickerOne: UIPickerView!
   // @IBOutlet weak var pickerTwo: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOne.dataSource = self
        pickerOne.delegate = self
        pickerOne.tag = 1
        inputTextField.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedNumbers = CharacterSet.decimalDigits
        let digitSet = CharacterSet(charactersIn: string)
        return allowedNumbers.isSuperset(of: digitSet)
    }
    
        

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return array1.count
        } else {
            return array2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return array1[row]
        } else {
            return array2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {


        
        var firstPick = array1[pickerView.selectedRow(inComponent: 0)]
        var secPick = array2[pickerView.selectedRow(inComponent: 1)]
        if component == 0 {
            firstPick = array1[row]
        } else {
            secPick = array2[row]
        }
        
        if firstPick == "inch" && secPick == "inch" {
            let result = Double(inputTextField.text!)!
            outputLabelField.text = (" \(result) in")
        } else if firstPick == "inch" && secPick == "feet" {
            let result = Double(inputTextField.text!)! * 12
            outputLabelField.text = (" \(String(format: "%.4f", result)) ft")
        } else if firstPick == "inch" && secPick == "yard" {
            let result = Double(inputTextField.text!)! / 36
            outputLabelField.text = (" \(String(format: "%.4f", result)) yd")
        } else if firstPick == "feet" && secPick == "inch" {
            let result = Double(inputTextField.text!)! * 12
            outputLabelField.text = (" \(String(format: "%.4f", result)) in")
        } else if firstPick == "feet" && secPick == "feet" {
            let result = Double(inputTextField.text!)!
            outputLabelField.text = (" \(result) ft")

        } else if firstPick == "feet" && secPick == "yard" {
            let result = Double(inputTextField.text!)! / 3.0
            outputLabelField.text = (" \(String(format: "%.4f", result)) yd")

        } else if firstPick == "yard" && secPick == "inch" {
            let result = Double(inputTextField.text!)! * 36
            outputLabelField.text = ("\(String(format: "%.2f", result)) in")
        } else if firstPick == "yard" && secPick == "feet" {
            let result = Double(inputTextField.text!)! * 3
            outputLabelField.text = (" \(String(format: "%.4f", result)) ft")

        } else if firstPick == "yard" && secPick == "yard" {
            let result = Double(inputTextField.text!)!
            outputLabelField.text = (" \(String(result)) yd")
        }
    }
}
