//
//  CreateViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit

class CreateViewController: BaseViewController {
    
    
    enum Todo: String, CaseIterable {
        case deadline = "마감일"
        case tag = "태그"
        case priority = "우선 순위"
        case addImage = "이미지 추가"
    }
    
    
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
    }
    
}

extension CreateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Todo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.id, for: indexPath) as? TodoListTableViewCell else {
            fatalError("TodoListTableViewCell 데이터가 없습니다.")
        }
        
        let todoCase = Todo.allCases[indexPath.row]
        cell.titleLabel.text = todoCase.rawValue
        return cell
    }
    
    
    
}
