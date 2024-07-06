//
//  BaseViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/2/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureView()
        configureLayout()
        print(#function)
    }
     
    func configureHierarchy() {
        print(#function)
    }
    
    func configureView() {
        print("BaseVC",#function)
        view.backgroundColor = .black
    }
    
    func configureLayout() {
        print(#function)
    }
    
    func showAlert(title: String,message: String, ok: String, handler: @escaping (() -> Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: ok, style: .default) { _ in
            handler()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func showAlertTitleOnly(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
    
    func setupNavigationBar(title: String?, leftTitle: String?, rightTitle: String?, leftAction: Selector?, rightAction: Selector?) {
        navigationItem.title = title
        if let leftItemTitle = leftTitle {
            let leftButton = UIBarButtonItem(title: leftItemTitle, style: .plain, target: self, action: leftAction)
            navigationItem.leftBarButtonItem = leftButton
        }
        if let rightItemTitle = rightTitle {
            let rightButton = UIBarButtonItem(title: rightItemTitle, style: .done, target: self, action: rightAction)
            navigationItem.rightBarButtonItem = rightButton
            rightButton.isEnabled = false // 초기 상태에서 비활성화
        }
        
    }
    
}
