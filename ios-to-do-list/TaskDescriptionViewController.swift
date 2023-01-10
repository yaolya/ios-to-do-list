//
//  TaskDescriptionViewController.swift
//  ios-to-do-list
//
//  Created by Оля Галягина on 01.01.2023.
//

import UIKit

class TaskDescriptionViewController: UIViewController {
    
    var task: Task!
    var taskIndex: Int!
    weak var delegate: TaskDelegate?
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var completeTaskBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    func setupView() {
        nameLbl.text = task.name
        detailsTextView.text = task.details
        if task.isComplete {
            disableBtn()
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy hh:mm"
        let taskDate = dateFormatter.string(from: task.completionDate)
        dateLbl.text = taskDate
    }
    
    func disableBtn() {
        completeTaskBtn.isEnabled = false
        completeTaskBtn.backgroundColor = UIColor.gray
    }
    
    @IBAction func taskDidComplete(_ sender: Any) {
        task.isComplete = true
        delegate?.update(task: task, index: taskIndex)
        disableBtn()
    }
    
}
