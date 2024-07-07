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
        let ascAction = UIAction(title: "오래된 순", handler: { _ in print("확인") })
        let dscAction = UIAction(title: "최신 순", handler: { _ in print("확인") })
        let priorityAction = UIAction(title: "우선순위 높음만 보기") { _ in
            print("확인")
        }
        let buttonMenu = UIMenu(children: [ascAction, dscAction, priorityAction ])

        let menu = UIBarButtonItem(title: nil, image: UIImage(systemName: Resource.ImageCase.moreImage.rawValue), menu: buttonMenu)
        navigationItem.rightBarButtonItem = menu
        
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
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
//        let delete = UIContextualAction(style: .destructive, title: "삭제") {  _, _, success in

//            let data = self.todoList[indexPath.row]

//            let imageName = data.id

//            self.removeImageFromDocument(filename: "\(imageName)") // 도큐먼트에서 이미지 삭제(realm X)

//            self.repository.deleteItem(data)

//            success(true)

//            tableView.reloadData()
//        }
//
//        return UISwipeActionsConfiguration(actions: [delete])
//    }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { [weak self] (_, _, completion) in
               guard let self = self else { return }
               
               let data = self.todoList[indexPath.row]
               let imageName = data.id
               
               // 도큐먼트에서 이미지 삭제
            self.view.removeImageFromDocument(filename: "\(imageName)")
               
               // Realm에서 데이터 삭제
               self.repository.deleteItem(data)
               
               // UI 업데이트 및 애니메이션
               tableView.performBatchUpdates({
                   self.todoList.remove(at: indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: .automatic)
               }, completion: { _ in
                   // 액션 완료 처리
                   completion(true)
               })
           }
           
           return UISwipeActionsConfiguration(actions: [deleteAction])
       }

}
