//
//  ViewControllerB.swift
//  Passing Data B-A
//
//  Created by Jure Zove on 10/05/15.
//  Copyright (c) 2015 Candy Code. All rights reserved.
//

import UIKit

protocol NameTransferProtocol {
    func transferName(name: String)
}

class ViewControllerB: UITableViewController {

    var nameTransferDelegate:NameTransferProtocol?
    var names = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        names = ["John", "Paul", "George", "Ringo"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    // Cell is tapped - call transferName on delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let delegate = nameTransferDelegate as NameTransferProtocol? {
            delegate.transferName(names[indexPath.row])
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

}
