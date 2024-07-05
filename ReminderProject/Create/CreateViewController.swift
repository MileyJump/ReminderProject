//
//  CreateViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit
import RealmSwift

final class CreateViewController: BaseViewController {

    private let createView = CreateView()
    private let repository = TodoTableRepository()
    var todoTitle: String = ""
    var todoMemo: String = ""
//    private var todoList: [TodoTable] = []
    let realm = try! Realm()
    
    override func loadView() {
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        print(realm.configuration.fileURL)
  
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "새로운 할 일"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        saveButton.isEnabled = false // 초기 상태에서 비활성화
    }
    
    @objc private func saveButtonTapped() {
        print(#function)
        
        let data = TodoTable(todoTitle: todoTitle, todoMemo: todoMemo, todoDate: nil, todoPriority: nil, todoTag: nil, todoImage: nil)
        
        repository.createItem(data)
        
        
    }
    
    @objc private func cancelButtonTapped() {
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

extension CreateViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            todoTitle = text
            if !text.isEmpty {
                navigationItem.rightBarButtonItem?.isEnabled = true
            } else {
                navigationItem.rightBarButtonItem?.isEnabled = false
            }
        }
    }
}

extension CreateViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        todoMemo = textView.text
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == Resource.placeholder.memo.rawValue && textView.textColor == UIColor.systemGray2 {
            textView.text = ""
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = Resource.placeholder.memo.rawValue
            textView.textColor = .systemGray2
        }
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
            contentCell.titleTextField.delegate = self
            contentCell.memoTextView.delegate = self
            
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





