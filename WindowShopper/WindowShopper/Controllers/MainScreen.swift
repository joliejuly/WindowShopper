//
//  ViewController.swift
//  WindowShopper
//
//  Created by Julia Nikitina on 26/08/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var priceTxt: CurrencyTextField!
    @IBOutlet weak var quantityOfHoursLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    @objc private func calculateBtnTapped() {
        guard let wageText = wageTxt.text,
            let priceText = priceTxt.text else { return }
        
        guard let wage = Double(wageText),
            let price = Double(priceText) else { return }
        
        view.endEditing(true)
        
        quantityOfHoursLbl.isHidden = false
        hoursLbl.isHidden = false
        
        let resultHours = Wage.getHours(forWage: wage, andPrice: price)
        let textsForLabels = getTextForResultLabels(for: resultHours)
        quantityOfHoursLbl.text = textsForLabels.0
        hoursLbl.text = textsForLabels.1
    }
    
    private func getTextForResultLabels(for resultHours: Int) -> (String, String) {
        
        var resultHoursText = String(resultHours)
            if resultHours < 8 {
                if resultHoursText.hasSuffix("1") {
                  return (resultHoursText, "hour")
                }
                return (resultHoursText, "hours")
            } else {
                if resultHours % 8 == 0 {
                    if resultHours == 8 {
                        return ("1", "day")
                    } else {
                        let workdays = String(resultHours / 8)
                        return (workdays, "days")
                    }
                } else {
                
                let remainder = resultHours % 8
                let workdays = String(resultHours / 8)
                resultHoursText = "\(workdays)"
                var addInfo = workdays.hasSuffix("1") ? "day" : "days"
                addInfo += " and \(remainder) "
                "\(remainder)".hasSuffix("1") ? (addInfo += "hour") : (addInfo += "hours")
                
                return (resultHoursText, addInfo)
            }
        }
    }
    
    
    @IBAction func clearBtnTapped(_ sender: UIButton) {
        quantityOfHoursLbl.isHidden = true
        hoursLbl.isHidden = true
        
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    private func setUpViews() {
        quantityOfHoursLbl.isHidden = true
        hoursLbl.isHidden = true
        setUpCalculateView()
    }
    
    private func setUpCalculateView() {
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(calculateBtnTapped), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
    }
    
}










