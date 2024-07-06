//
//  ListViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class ListViewController: BaseViewController {
    
    private let listView = ListView()
    private let repository = TodoTableRepository()
    private var todoList: [TodoTable] = []
    
    
    override func loadView() {
        view = listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        todoList = repository.fetchAll()
    }
    
    override func configureView() {
        listView.listTableView.dataSource = self
        listView.listTableView.delegate = self
        listView.listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.id)
        listView.listTableView.estimatedRowHeight = 100
        listView.listTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupNavigationBar() {
        let menu = UIBarButtonItem(image: UIImage(systemName: Resource.ImageCase.moreImage.rawValue), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.rightBarButtonItem = menu
    }
    
    @objc private func menuButtonTapped() {
        print(#function)
    }
    
    @objc func checkButtonTapped(_ sender: UIButton) {
        repository.updateItem {
            todoList[sender.tag].todoLike.toggle()
            listView.listTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        }
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as? ListTableViewCell else {
            fatalError( "ListTableViewCell 데이터가 없어요")
        }
        cell.configureCell(todoList[indexPath.row])
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let data = todoList[indexPath.row]
        
        if editingStyle == .delete {
            
            todoList = repository.fetchAll()
            repository.deleteItem(data)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
