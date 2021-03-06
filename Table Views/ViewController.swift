//
//  ViewController.swift
//  Table Views
//
//  Created by Imee Cuison on 5/9/16.
//  Copyright © 2016 Imee Cuison. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "CellIdentifier"
    
    var fruits: [String] = []
    var alphabetizedFruits = [String: [String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fruits = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
    
        alphabetizedFruits = alphabetizeArray(fruits)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = alphabetizedFruits.keys
        
        // Sort Keys
        let sortedKeys = keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // Fetch Fruits
        let key = sortedKeys[section]
        
        if let fruits = alphabetizedFruits[key] {
            return fruits.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetch and Sort Keys
        let keys = alphabetizedFruits.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // Fetch Fruits for Section
        let key = keys[indexPath.section]
        
        if let fruits = alphabetizedFruits[key] {
            // Fetch Fruit
            let fruit = fruits[indexPath.row]
            
            // Configure Cell
            cell.textLabel?.text = fruit
        }
        
        return cell
    }
    
    private func alphabetizeArray(array: [String]) -> [String: [String]] {
        var result = [String: [String]]()
        
        for item in array {
            let index = item.startIndex.advancedBy(1)
            let firstLetter = item.substringToIndex(index).uppercaseString
            
            if result[firstLetter] != nil {
                result[firstLetter]!.append(item)
            } else {
                result[firstLetter] = [item]
            }
        }
        
        for (key, value) in result {
            result[key] = value.sort({ (a, b) -> Bool in
                a.lowercaseString < b.lowercaseString
            })
        }
        
        return result
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let keys = alphabetizedFruits.keys
        return keys.count
    }
    
    // MARK: -
    // MARK: Table View Delegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Fetch and Sort Keys
        let keys = alphabetizedFruits.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // Fetch Fruits for Section
        let key = keys[indexPath.section]
        
        if let fruits = alphabetizedFruits[key] {
            print(fruits[indexPath.row])
        }
    }
    
    
    
    
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

