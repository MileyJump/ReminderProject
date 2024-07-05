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
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "새로운 할 일"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        saveButton.isEnabled = false // 초기 상태에서 비활성화
    }
    
    @objc func saveButtonTapped() {
        
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
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
        return AddType.allCases.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let contentCell = tableView.dequeueReusableCell(withIdentifier: CreateContentTableViewCell.id, for: indexPath) as? CreateContentTableViewCell else {
                fatalError("CreateContentTableViewCell 데이터가 없습니다.")
            }
            return contentCell
        } else {
            guard let itemCell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.id, for: indexPath) as? TodoListTableViewCell else {
                fatalError("TodoListTableViewCell 데이터가 없습니다.")
            }
            let data = AddType.allCases[indexPath.row - 1]
            itemCell.configureCell(data)
            return itemCell
        }
    }
}





