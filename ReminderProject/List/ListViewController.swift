//
//  ListViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class ListViewController: BaseViewController {
    
    private let listView = ListView()
    
    
    
    override func loadView() {
        view = listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
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
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as? ListTableViewCell else {
            fatalError( "ListTableViewCell 데이터가 없어요")
        }
        
        return cell
    }
    
    
}
