//
//  Item.swift
import Foundation

class Item {
    
    var title: String = ""
    var done: Bool = false
    
}

// CORRESPOND WITH:   Under View Did Load, update data
// -> change hard-coded itemArray to an array of items [Item]
/*  Under super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
 
 
         let newItem1 = Item()
         newItem1.title = "Find Mike"
         itemArray.append(newItem)
 
         let newItem2 = Item()
         newItem2.title = "Buy Eggs"
         itemArray.append(newItem)
 
         let newItem3 = Item()
         newItem3.title = "Destroy Demogorgon"
         itemArray.append(newItem)
 
 @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
 
 var textField = UITextField()
 let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
 
 let newItem = Item()
 newItem.title = textField.text!
 
 let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
 self.itemArray.append(newItem)
 // want object now; self.itemArray.append(textField.text!)
 self.defaults.set(self.itemArray, forKey: "TodoListArray")
 self.tableView.reloadData()
 }
 
 
*/
