//
//  ViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let userDefaults = UserDefaults()

    @IBAction func goToSyllable(sender: NSButton) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let sourceViewController = storyboard
            .instantiateControllerWithIdentifier("SyllableViewController") as? NSViewController
        view.window?.contentViewController = sourceViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        switch userDefaults.activeView! {
            case "about" :
                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("showAbout", sender: self)
                })
            break
            case "syllabe" :
                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("showSyllabe", sender: self)
                })
            break
            case "number" :
                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("showNumber", sender: self)
                })
            break
            default :
            break
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            switch segueIdentifier {
                case "showAbout":
                    userDefaults.activeView = "about"
                break
                case "showSyllabe":
                    userDefaults.activeView = "syllabe"
                break
                case "showNumber":
                    userDefaults.activeView = "number"
                break
                default :
                break
            }
        }
        //        print(segue.identifier)
    }


}
