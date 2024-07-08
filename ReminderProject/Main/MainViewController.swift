//
//  MainViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/3/24.
//

import UIKit
import RealmSwift

final class MainViewController: BaseViewController {
    
    let realm = try! Realm()
    
    private let mainView = MainView()
    private let repository = TodoTableRepository()
    var folderList: [FolderTable] = []
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(realm.configuration.fileURL)
        
        folderList = repository.fetchFolder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainView.collectionView.reloadData()
    }
    
    override func configureView() {
        navigationItem.backButtonTitle = ""
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.id)
        
        mainView.addTodoButton.addTarget(self, action: #selector(addTodoButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addTodoButtonTapped() {
        print(#function)
        let vc = CreateViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        present(navigationController, animated: true, completion: nil)
    }  
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return TodoType.allCases.count
        return folderList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.id, for: indexPath) as? MainCollectionViewCell else {
            fatalError("MainCollectionViewCell 데이터가 없습니다.")
        }
//        let todoCase = TodoType.allCases[indexPath.row]
//        cell.configureCell(todoCase, data: repository)

        let data = folderList[indexPath.row]
        cell.titleLabel.text = data.name
        cell.countLabel.text = "\(data.detail.count)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ListViewController()
//        let vc = CreateViewController()
        vc.folder = folderList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
