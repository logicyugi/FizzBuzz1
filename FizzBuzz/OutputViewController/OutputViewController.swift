//
//  OutputViewController.swift
//  FizzBuzz
//
//  Created by Antoine El Samra on 24/08/2023.
//

import UIKit

//Storyboard OutputViewController -> Output Scene

class OutputViewController: UIViewController {
       
    //Requierments
    var firstNumber : Int = 3
    var secondNumber : Int = 5
    var firstText : String = "fizz"
    var secondText : String = "buzz"
    var firstColor : UIColor = .systemGreen
    var secondColor : UIColor = .systemRed
    var numberOfRow : Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OutputViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "outputType", for: indexPath) as! OutputTableViewCell
        let result = indexPath.row + 1
 
        //fizzbuzz
        if result%firstNumber == 0 && result%secondNumber == 0 {
            cell.outputLabel.text = firstText+secondText
            cell.outputLabel.textColor = .white
        }
        //fizz
        else if result%firstNumber == 0 {
            cell.outputLabel.text = firstText
            cell.outputLabel.textColor = firstColor
        }
        //buzz
        else if result%secondNumber == 0 {
            cell.outputLabel.text = secondText
            cell.outputLabel.textColor = secondColor
        }
        //none of that
        else {
            cell.outputLabel.text = String(result)
            cell.outputLabel.textColor = #colorLiteral(red: 0.922434032, green: 0.71376127, blue: 0.1613176465, alpha: 1)
        }
        return cell
    }
}
