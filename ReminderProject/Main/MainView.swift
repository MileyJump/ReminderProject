//
//  MainView.swift
//  ReminderProject
//
//  Created by 최민경 on 7/3/24.
//

import UIKit

final class MainView: BaseView {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "전체"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .systemGray2
        return label
    }()
    
     lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    private func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let inset: CGFloat = 16
        let width = UIScreen.main.bounds.width - (spacing * 2) - (inset * 2)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.itemSize = CGSize(width: width/2, height: (width/2) * 0.45)
        return layout
    }
    
    let addTodoButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.setTitle("새로운 할 일", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setImage(UIImage(systemName: Resource.ImageCase.addImage.rawValue), for: .normal)
        configuration.imagePadding = 4
        button.configuration = configuration
        return button
    }()
    
    let addListButton = {
        let button = UIButton()
        button.setTitle("목록 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override func configureHierarchy() {
        addSubview(titleLabel)
        addSubview(addTodoButton)
        addSubview(addListButton)
        addSubview(collectionView)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(5)
            make.leading.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        addTodoButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(safeAreaLayoutGuide).inset(5)
            make.height.equalTo(40)
        }
        
        addListButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(5)
            make.height.equalTo(addTodoButton)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(addTodoButton.snp.top)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
