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
        print(#function)
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
    
}
