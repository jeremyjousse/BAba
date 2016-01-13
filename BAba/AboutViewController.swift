//
//  ViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {

    let userDefaults = UserDefaults()

    @IBAction func dismiss(sender: NSButton) {
        userDefaults.activeView = ""
        self.dismissViewController(self)
    }


    override var representedObject: AnyObject? {
        didSet {
        }
    }
}
