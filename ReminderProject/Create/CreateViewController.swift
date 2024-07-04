//
//  CreateViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit

class CreateViewController: BaseViewController {
    
    
    
    
    let createView = CreateView()
    
    override func loadView() {
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    
    override func configureView() {
        createView.todoTableView.delegate = self
        createView.todoTableView.dataSource = self 
        createView.todoTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.id)
        createView.todoTableView.register(CreateContentTableViewCell.self, forCellReuseIdentifier: CreateContentTableViewCell.id)
         createView.todoTableView.estimatedRowHeight = 44.0
             createView.todoTableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension CreateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Resource.Todo.allCases.count
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateContentTableViewCell.id, for: indexPath) as? CreateContentTableViewCell else {
            fatalError("TodoListTableViewCell 데이터가 없습니다.")
        }
        
//        let todoCase = Resource.Todo.allCases[indexPath.row]
//        cell.titleLabel.text = todoCase.rawValue
        return cell
    }
    
    
    
    
}
