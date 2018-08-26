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
        setUpCalculateView()
    }
    
    @objc private func calculateBtnTapped() {
        guard let wageText = wageTxt.text,
            let priceText = priceTxt.text else { return }
        
        guard let wage = Double(wageText),
            let price = Double(priceText) else { return }
        
        view.endEditing(true)
        
        quantityOfHoursLbl.isHidden = false
        hoursLbl.isHidden = false
        
        let resultHours = String(Wage.getHours(forWage: wage, andPrice: price))
        
        quantityOfHoursLbl.text = resultHours
        
        resultHours.hasSuffix("1") ? (hoursLbl.text = "hour") : (hoursLbl.text = "hours")
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










