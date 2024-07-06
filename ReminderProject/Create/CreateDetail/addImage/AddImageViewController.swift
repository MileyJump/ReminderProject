//
//  AddImageViewController.swift
//  ReminderProject
//
//  Created by 최민경 on 7/6/24.
//

import UIKit
import PhotosUI

final class AddImageViewController: BaseViewController {
    
    let imageView = AddImageView()
    
    override func loadView() {
        view = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGesture()
        setupNavigationBar(title: "이미지 추가", leftTitle: "취소", rightTitle: "저장", leftAction: #selector(cancelButtonTapped), rightAction: #selector(saveButtonTapped))
    }
    
    @objc func saveButtonTapped() {
        print("AddImageVC", #function)
        let image = imageView.todoImageView.image
        NotificationCenter.default.post(name: Notification.Name.todoImage, object: image)
        dismiss(animated: true)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(todoImageViewTapped))
        imageView.todoImageView.isUserInteractionEnabled = true
        imageView.todoImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func todoImageViewTapped() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
}


extension AddImageViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    self.imageView.todoImageView.image = image as? UIImage
                    self.imageView.explainLabel.isHidden = true
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        }
        dismiss(animated: true)
    }
    
    
}
