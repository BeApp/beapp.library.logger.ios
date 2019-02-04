//
//  ViewController.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 02/04/2019.
//  Copyright (c) 2019 Anthony Dudouit. All rights reserved.
//

import UIKit
import BeappLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		Logger.debug("My controller did Load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

