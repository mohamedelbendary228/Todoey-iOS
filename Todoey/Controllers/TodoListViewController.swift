//
//  ViewController.swift
//  Todoey
//
//  Created by Mohamed Elbendary on 19/06/2026.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var todoItems :[Item] = []
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 26.0, *) {
            navigationItem.rightBarButtonItem?.hidesSharedBackground = true
        }
        
        
        if let items = userDefaults.array(forKey: "TodoListArray") as? [Item] {
            todoItems = items
        }
    }
    
    // MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = todoItems[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        todoItems[indexPath.row].done = !todoItems[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            let newAddedItem = Item()
           
            newAddedItem.title = textField.text!
            
            self.todoItems.append(newAddedItem)
            
            self.userDefaults.set(self.todoItems, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}

