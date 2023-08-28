//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Antoine El Samra on 24/08/2023.
//

import UIKit

//Storyboard Main -> Input Scene

class InputViewController: UIViewController {

    @IBOutlet weak var FirstNumber: UITextField!
    @IBOutlet weak var SecondNumber: UITextField!
    @IBOutlet weak var FirstText: UITextField!
    @IBOutlet weak var SecondText: UITextField!
    @IBOutlet weak var ErrorFirstNumber: UILabel!
    @IBOutlet weak var ErrorSecondNumber: UILabel!
    @IBOutlet weak var ErrorFirstText: UILabel!
    @IBOutlet weak var ErrorSecondText: UILabel!
    @IBOutlet weak var ColorWellFirst: UIColorWell!
    @IBOutlet weak var ColorWellSecond: UIColorWell!
    @IBOutlet weak var ColorFirstLabel: UILabel!
    @IBOutlet weak var ColorSecondLabel: UILabel!
    @IBOutlet weak var numberOfRow: UITextField!
    
    var selectedColors = [UIColor.systemGreen, UIColor.systemRed]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // ColorWell setup
        ColorWellFirst.addTarget(self, action: #selector(colorWellChanged1(_:)), for: .valueChanged)
        ColorWellSecond.addTarget(self, action: #selector(colorWellChanged2(_:)), for: .valueChanged)
    }
    
    
    //"OK" button pressed
    @IBAction func ValidationButtonPressed(_ sender: UIButton) {
        if textFieldValidation() {
            navigateToOutput()
        }
    }
   
    //Form Validator
    func textFieldValidation() -> Bool {
        //verify first number
        guard FirstNumber.isValid(with: .number) && Int(FirstNumber.text ?? "") ?? 0 > 0  else {
            ErrorFirstNumber.isHidden = false
            return false
        }
        //hide error label only if guard validation passed
        ErrorFirstNumber.isHidden = true
        //verify Second number
        guard SecondNumber.isValid(with: .number) && Int(SecondNumber.text ?? "") ?? 0 > 0 else {
            ErrorSecondNumber.isHidden = false
            ErrorSecondNumber.text = "not a valid number"
            return false
        }
        //verify first and second are unequal
        guard SecondNumber.text != FirstNumber.text else {
            ErrorSecondNumber.isHidden = false
            ErrorSecondNumber.text = "same numbers"
            return false
        }
        ErrorSecondNumber.isHidden = true

        //same for words: first, second then unequal
        guard FirstText.isValid(with: .word) else {
            ErrorFirstText.isHidden = false
            return false
        }
        ErrorFirstText.isHidden = true
        guard SecondText.isValid(with: .word) else {
            ErrorSecondText.isHidden = false
            ErrorSecondText.text = "not only letters (from a-z or A-Z)"
            return false
        }
        guard SecondText.text != FirstText.text else {
            ErrorSecondText.isHidden = false
            ErrorSecondText.text = "same words"
            return false
        }
        ErrorSecondText.isHidden = true
        return true
    }
    
    //Use Navigate
    func navigateToOutput() {
        let storyboard : UIStoryboard = UIStoryboard(name: "OutputViewController", bundle: nil)
        let vc : OutputViewController = storyboard.instantiateViewController(withIdentifier: "Output") as! OutputViewController
        
        //Setup Output view controller
        vc.firstText = FirstText.text!
        vc.secondText = SecondText.text!
        vc.firstNumber = Int(FirstNumber.text!) ?? 3
        vc.secondNumber = Int(SecondNumber.text!) ?? 5
        vc.firstColor = ColorWellFirst.selectedColor ?? .systemGreen
        vc.secondColor = ColorWellSecond.selectedColor ?? .systemRed
        vc.numberOfRow = Int(numberOfRow.text ?? "") ?? 100

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Event: color changed
    @objc func colorWellChanged1(_ sender: UIColorWell) {
        //change all first colors items when a color in colorWell 1 has been choosed
        FirstText.textColor = sender.selectedColor
        FirstNumber.textColor = sender.selectedColor
        ColorFirstLabel.textColor = sender.selectedColor
        selectedColors[0] = sender.selectedColor ?? UIColor.systemGreen
    }
    
    @objc func colorWellChanged2(_ sender: UIColorWell) {
        //change all second color items when a color in colorWell 2 has been choosed
        SecondText.textColor = sender.selectedColor
        SecondNumber.textColor = sender.selectedColor
        ColorSecondLabel.textColor = sender.selectedColor
        selectedColors[1] = sender.selectedColor ?? UIColor.systemRed
    }

}

