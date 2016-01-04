//
//  SimpleWord.swift
//  BAba
//
//  Created by Jérémy Jousse on 30/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Foundation

class SimpleWord {

    var words: NSDictionary

    init() {
        words = [String: String]()
        if let path = NSBundle.mainBundle()
            .pathForResource("simpleWords", ofType: "json") {
                if let jsonData = NSData(contentsOfFile: path) {
                    do {
                        let JSON = try NSJSONSerialization
                            .JSONObjectWithData(jsonData, options: NSJSONReadingOptions(rawValue: 0))
                        guard let JSONDictionary: NSDictionary = JSON as? NSDictionary else {
                            print("Not a Dictionary")
                            return
                        }
                        words = JSONDictionary
                    } catch let JSONError as NSError {
                        print("\(JSONError)")
                    }
                }
        } else {
            print("impossible de charger json")
        }
    }
}
