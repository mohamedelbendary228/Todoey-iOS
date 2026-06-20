//
//  ViewController.swift
//  Todoey
//
//  Created by Mohamed Elbendary on 19/06/2026.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let todoItems = ["First Item", "Second Item", "Third Item", "Fourth Item", "Fifth Item"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = todoItems[indexPath.row]
        
        return cell
    }


}

