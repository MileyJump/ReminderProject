//
//  FileManager+Extension.swift
//  ReminderProject
//
//  Created by 최민경 on 7/6/24.
//


import UIKit

extension UIView {
    
    func saveImageToDocument(image: UIImage, filename: String) {
        
        guard let documentDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else { return }
        
        //이미지를 저장할 경로(파일명) 지정
        let fileURL = documentDirectory.appendingPathComponent("\(filename).jpg")
        
        //이미지 압축
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        //이미지 파일 저장
        do {
            try data.write(to: fileURL)
        } catch {
            print("file save error", error)
        }
    }
    
    func loadImageToDocument(filename: String) -> UIImage? {
            
        guard let documentDirectory = FileManager.default.urls(
               for: .documentDirectory,
               in: .userDomainMask).first else { return nil }
            
        let fileURL = documentDirectory.appendingPathComponent("\(filename).jpg")
           
        //이 경로에 실제로 파일이 존재하는 지 확인
        if FileManager.default.fileExists(atPath: fileURL.path()) {
            return UIImage(contentsOfFile: fileURL.path())
        } else {
            return UIImage(systemName: "star.fill")
        }
    }
    
    func removeImageFromDocument(filename: String) {
        guard let documentDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else { return }

        let fileURL = documentDirectory.appendingPathComponent("\(filename).jpg")
        
        if FileManager.default.fileExists(atPath: fileURL.path()) {
            
            do {
                // 파일매니저에서 이미지를 제거할 동안 다른 작업을 수행하지 못하도록
                try FileManager.default.removeItem(atPath: fileURL.path())
            } catch {
                print("file remove error", error)
            }
            
        } else {
            print("file no exist")
        }
        
    }
}
