//
//  ViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {
    @IBAction func dismiss(sender: NSButton) {
//        self.dismiss(sender)
        self.dismissViewController(self)
    }


    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
