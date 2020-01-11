//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Abhishek Saral on 1/4/20.
//  Copyright © 2020 Tech Knowns. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var themeControl: UISegmentedControl!
    let aColor = UIColor(named: "bgColor")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if defaults.integer(forKey: "themeColor") == 0 {
            overrideUserInterfaceStyle = .light
        }
        if defaults.integer(forKey: "themeColor") == 1 {
            overrideUserInterfaceStyle = .dark
        }
        view.backgroundColor = aColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Retrieve the last default tip set
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        themeControl.selectedSegmentIndex = defaults.integer(forKey: "themeColor")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    @IBAction func changeDefaultTip(_ sender: Any) {
        //Set default for tip
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        
    }
    @IBAction func changeTheme(_ sender: Any) {
        //change App Theme
        if themeControl.selectedSegmentIndex == 0 {
            defaults.set(0, forKey: "themeColor")
        }else if themeControl.selectedSegmentIndex == 1 {
            defaults.set(1, forKey: "themeColor")
        }
        
        if defaults.integer(forKey: "themeColor") == 0 {
            overrideUserInterfaceStyle = .light
        }
        if defaults.integer(forKey: "themeColor") == 1 {
            overrideUserInterfaceStyle = .dark
        }
        view.backgroundColor = aColor
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
