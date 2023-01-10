//
//  ToDoItemViewController.swift
//  ios-to-do-list
//
//  Created by Оля Галягина on 01.01.2023.
//

import UIKit

class TaskCreationViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.title = "Add Task"
        navigationBar.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTouch))]
        
        scrollView.layer.backgroundColor = UIColor.white.cgColor
        scrollView.layer.borderWidth = CGFloat(1)
        scrollView.layer.cornerRadius = CGFloat(3)
    }
    
    @objc func cancelButtonDidTouch() {
        dismiss(animated: true, completion: nil)
    }

}
