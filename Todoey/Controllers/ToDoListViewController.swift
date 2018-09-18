// ViewController.swift
//  Todoey
//  Created by Jennifer DeCota on 8/29/18.
//  Copyright © 2018 iOS Class. All rights reserved.
import UIKit


class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        //print(dataFilePath)
        
        let newItem1 = Item()
        newItem1.title = "Find Mike"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        if let items = defaults.stringArray(forKey: "TodoListArray") as? [Item] {
                itemArray = items
        }
    }
    // Do any additional setup after loading the view, typically from a nib.

    //MARK  TableView Datasource Methods:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                // debug print print("cellForRowAt called")
        // changing tableViewCell would not reset properties
        // can erase let cell = UITableViewCell(style: .default, reuseIdentifier: "String?")

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title   // replaces itemArray[indexPath.row].title once create var item
                        // DON'T want row, want the property of the object
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
            // Can even get ride of == true
                //Replaces code below
        /*if item.done == true {
            
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        } */
        
        return cell
    }
    
    // Delegate Method: didSelectRowAt to select cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        //Sets done property of current to the opposite (!)
        /*Replaces all of the following code
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        } else {
            itemArray[indexPath.row].done = false
        }
        */

        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                // Conditional to check to see:   IF current cell already has checkmark
                // IF yes, change to none OR  ELSE cellForRow has checkmark
        
                //Address above now once persisting
        /*if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
         }else{
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
         }  */
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

//MARK- Add New Items

    //@IBAction func AddItem(_ sender: Any) {
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
       
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            // want object now; self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

