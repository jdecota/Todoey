//
//  ViewController.swift
//  Todoey
//
//  Created by Jennifer DeCota on 8/29/18.
//  Copyright © 2018 iOS Class. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

        let itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    
    //MARK  TableView Datasource Methods:  numberOfRowsInSection section:    and    didSelectRowAt indexPath
    // Create Reusable Cell using prototype cell identifier
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // Delegate Method: didSelectRowAt to select cell
            //  tableView.cellForRow for cell display
                //  Possibly:   deselectRow to deselect cell
                            //  Change UI using flashes, accessories, etc
                            //  Conditionals used to determine IF cell ......
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            // can print to debug which item is selected
            print(indexPath.row) //prints the row number
            print(itemArray[indexPath.row])  //prints the item in that index of the array
 
            //Create checkmark upon SELECT using accessory; choose ACTUAL cell on storyboard >Attribute Insp. >select Accessory
            //Create Cell Display with tableView.cellForRow at
            // Below reads: upon didSelect, cell at indexPath of Tableview will have Accessory type checkmark
            // To REMOVE checkmark, will need conditional
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
         // Conditional to check to see:   IF current cell already has checkmark
         // IF yes, change to none OR  ELSE cellForRow has checkmark
         if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
         }else{
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
         }
         
            // didSelectRow HIGHLIGHTS cell until deselected; to get rid of continuous highlight for row chosen;
            // can use deselectRow so it goes right back to UNhighlighted (creates flash of highlight upon choosing)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    }

    
    /*SHE DELETEDoverride func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/


