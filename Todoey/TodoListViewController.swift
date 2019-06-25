//
//  ViewController.swift
//  Todoey
//
//  Created by Richard Maleho on 2019/06/20.
//  Copyright © 2019 Profecia IT. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [ChecklistItem]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [ChecklistItem] {
            itemArray = items
        }
        
//        for n in 1...20 {
//            itemArray.append(ChecklistItem(text: "item \(n)", checked: false))
//        }
    }

    //MARK - tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.text //itemArray[indexPath.row]
        
        cell.accessoryType = item.checked ? .checkmark : .none
        
//        if item.checked {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
        
        /*if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
            //itemArray[indexPath.row].checked = false
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
            //itemArray[indexPath.row].checked = true
        }*/
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        
        //var text : String = ""
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //self.itemArray.append(textField.text!)
            
            self.itemArray.append(ChecklistItem(text: textField.text!, checked: false))
            
            //self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            
            //text = alertTextField.text!
            
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}

