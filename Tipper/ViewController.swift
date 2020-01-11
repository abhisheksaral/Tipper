//
//  ViewController.swift
//  Tipper
//
//  Created by Abhishek Saral on 1/1/20.
//  Copyright © 2020 Tech Knowns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    var themeChoice:Int = 0
    let aColor = UIColor(named: "bgColor")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        themeChoice = defaults.integer(forKey: "themeColor")
        if themeChoice == 0 {
            overrideUserInterfaceStyle = .light
        }
        if themeChoice == 1 {
            overrideUserInterfaceStyle = .dark
        }
        view.backgroundColor = aColor
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get Bill Amount
        let bill = Double(billAmount.text!) ?? 0
        
        // Calculate Tip and Total
        
        let tipPercent = [0.15,0.18,0.20]
        
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip and Total Labels
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

