//
//  ViewController.swift
//  Configurations
//
//  Created by Abdullah Althobetey on 07/06/2018.
//  Copyright © 2018 Abdullah Althobetey. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Try to uncomment/comment both function calls and notice how they behave in the same way
        //setLabelValue1()
        setLabelValue2()
    }
    
    private func setLabelValue1()
    {
        // - Option 1
        // Advantage: You can see all different values in one place
        // Disadvantage: The code is a little bit verbose
        
        var value = ""
        #if RELEASE
        value = "Release"
        #elseif DEVELOPMENT
        value = "Development"
        #elseif QA
        value = "QA"
        #endif
        label.text = value
    }
    
    private func setLabelValue2()
    {
        // - Option 2
        // Advantage: Only one line of code (with the help of BundleExtension.swift file)
        // Disadvantage: You have to navigate to the *.plist to see the key and value for each environment
        
        label.text = Bundle.main.labelValue
    }
}

