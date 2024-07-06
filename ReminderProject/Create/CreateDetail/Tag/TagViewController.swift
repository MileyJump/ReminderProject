//
//  TagViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import UIKit

final class TagViewController: BaseViewController {
    let tagView = TagView()
    var text = ""
    
    override func loadView() {
        view = tagView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @objc func cancelButtonTapped() {
        print(#function)
        dismiss(animated: true)
    }
    
    @objc func saveButtonTapped() {
        print(#function)
        NotificationCenter.default.post(name: Notification.Name.hashTag, object: text)
        dismiss(animated: true)
    }
    
    override func configureView() {
        super.configureView()
        setupNavigationBar(title: "태그 등록", leftTitle: "취소", rightTitle: "저장", leftAction: #selector(cancelButtonTapped), rightAction: #selector(saveButtonTapped))
        tagView.tagTextField.delegate = self
    }
}

extension TagViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.isEmpty {
            navigationItem.rightBarButtonItem?.isEnabled = false
        } else {
            self.text = text
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
}

