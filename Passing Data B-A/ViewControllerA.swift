//
//  ViewController.swift
//  Passing Data B-A
//
//  Created by Jure Zove on 10/05/15.
//  Copyright (c) 2015 Candy Code. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController, NameTransferProtocol {

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func transferName(name: String) {
        self.nameLabel.text = name
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showNames" {
            (segue.destinationViewController as! ViewControllerB).nameTransferDelegate = self
        }
    }

}

