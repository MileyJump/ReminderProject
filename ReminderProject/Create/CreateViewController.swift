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
//    var todoTitle: String = ""
//    var todoMemo: String = ""
//    var todoDate: Date?
//    var todoTag: String = ""
    var todoImage: UIImage?
    var folder: FolderTable?
//    var priority: String = ""
    private var todo: TodoTable = TodoTable(todoTitle: "", todoMemo: "", todoDate: nil, todoPriority: "", todoTag: "", todoImage: nil)
    let realm = try! Realm()
    
    override func loadView() {
        view = createView
    }
    
    
    // 왜 뷰디드로드가 실행이 안 될까요? ^^ 브레이크포인트도 안 되고,.. 프린트도 안 되고.... 왜...ㅠㅠ
    override func viewDidLoad() {
        super.viewDidLoad()
        print("dfdafdfadfasf")
//        print(realm.configuration.fileURL)
        guard let folder = folder else { return }
        
        
        setupNavigationBar(title: "\(folder.name) : 새로운 할 일", leftTitle: "취소", rightTitle: "추가", leftAction: #selector(cancelButtonTapped), rightAction:  #selector(saveButtonTapped))
        
        notification()
        
//        if let folder = folder {
//            let value = folder.detail
//            todoList = Array(value)
//        }
        
    }
    
    @objc private func saveButtonTapped() {
        print(#function)
        let data = TodoTable(todoTitle: todo.todoTitle, todoMemo: todo.todoMemo, todoDate: todo.todoDate, todoPriority: todo.todoPriority, todoTag: todo.todoTag, todoImage: nil)
        
        if let folder = folder {
            repository.createItem(data, folder: folder)
        }
        
        if let image = todoImage {
            self.view.saveImageToDocument(image: image, filename: "\(data.id)") // 아이디 값으로 이미지 저장
        }
//        dismiss(animated: true)
        
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc private func cancelButtonTapped() {
//        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func notification() {
        print("노티피케이션")
        NotificationCenter.default.addObserver(self, selector: #selector(deadlineAction), name: Notification.Name.deadline, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tagAction), name: Notification.Name.hashTag, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(imageAction), name: Notification.Name.todoImage, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(priorityAction), name: Notification.Name.priority, object: nil)
    }
    
    @objc func deadlineAction(_ notification: Notification) {
        if let date = notification.object as? Date {
            todo.todoDate = date
            createView.todoTableView.reloadData()
        }
    }
    
    @objc func tagAction(_ notification: Notification) {
        if let tag = notification.object as? String {
            todo.todoTag = tag
            createView.todoTableView.reloadData()
        }
    }
    
    @objc func imageAction(_ notification: Notification) {
        if let image = notification.object as? UIImage {
            todoImage = image
            
        }
    }
    
    @objc func priorityAction(_ notification: Notification) {
        if let priority = notification.object as? String {
            todo.todoPriority = priority
            createView.todoTableView.reloadData()
        }
    }
    
    
    override func configureView() {
        createView.todoTableView.delegate = self
        createView.todoTableView.dataSource = self
        createView.todoTableView.register(CreateItemsTableViewCell.self, forCellReuseIdentifier: CreateItemsTableViewCell.id)
        createView.todoTableView.register(CreateContentTableViewCell.self, forCellReuseIdentifier: CreateContentTableViewCell.id)
        createView.todoTableView.estimatedRowHeight = 44.0
        createView.todoTableView.rowHeight = UITableView.automaticDimension
    }
}

extension CreateViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            todo.todoTitle = text
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
//        todoMemo = textView.text
        todo.todoMemo = textView.text
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
            guard let itemCell = tableView.dequeueReusableCell(withIdentifier: CreateItemsTableViewCell.id, for: indexPath) as? CreateItemsTableViewCell else {
                fatalError("TodoListTableViewCell 데이터가 없습니다.")
            }
            let type = AddType.allCases[indexPath.row - 1]
            print(todo)
            itemCell.configureCell(type, data: todo, image: todoImage)
            return itemCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            return
        }
        
        let addType = AddType.allCases[indexPath.row - 1]
        switch addType {
        case .deadline :
            let vc = DeadlineViewController()
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .tag:
            let vc = TagViewController()
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .priority:
            let vc = PriorityViewController()
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .addImage:
            let vc = AddImageViewController()
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        }
    }
    
}





