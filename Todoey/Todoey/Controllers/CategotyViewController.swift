//
//  CategotyTableViewController.swift
//  Todoey
//
//  Created by Anastasia Veremiichyk on 10/28/18.
//  Copyright © 2018 Anastasia Veremiichyk. All rights reserved.
//

import UIKit
import CoreData

class CategotyViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    // MARK: TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryItem", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    // MARK: Add Button Pressed
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) {
            (alert) in
            if let text = textField.text {
                
                let newCategory = Category(context: self.context)
                newCategory.name = text
                self.categories.append(newCategory)
                
                self.saveCategories()
            }
        }
        
        alert.addAction(action)
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Add a new category"
            textField = alertTextField
            
        }
        
        present(alert, animated: true, completion: nil)
    }
    

    
    
    // MARK: TableView Delegate Methods
    
    
    
    // MARK: Data Manipulation Methods
    
    func saveCategories() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }
    
}
