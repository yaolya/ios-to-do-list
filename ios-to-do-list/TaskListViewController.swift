//
//  ViewController.swift
//  ios-to-do-list
//
//  Created by Оля Галягина on 28.12.2022.
//

import UIKit

protocol TaskDelegate: AnyObject {
    func update(task:Task, index: Int)
}

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems: [Task] = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.title = "ToDoList"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        
        let testItem: Task = Task(name: "name1", details: "details1", completionDate: Date())
                                                    
        toDoItems.append(testItem)
        
        let testItem2: Task = Task(name: "name2", details: "details2", completionDate: Date())
                                                    
        toDoItems.append(testItem2)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.setEditing(false, animated: false)
    }
    
    @objc func addTapped() {
        performSegue(withIdentifier: "AddTaskSegue", sender: nil)
    }
    
    @objc func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTapped))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.toDoItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = toDoItems[indexPath.row]
        performSegue(withIdentifier: "TaskDetailsSegue", sender: (indexPath.row, selectedItem))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = toDoItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task")!
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.isComplete ? "Complete" : "Incomplete"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TaskDetailsSegue" {
            guard let destinationVC = segue.destination as? TaskDescriptionViewController else { return }
            guard let task = sender as? (Int, Task) else { return }
            destinationVC.taskIndex = task.0
            destinationVC.task = task.1
            destinationVC.delegate = self
        }
    }
    
}
extension TaskListViewController: TaskDelegate {
    func update(task:Task, index: Int) {
        toDoItems[index] = task
        tableView.reloadData()
    }
}

