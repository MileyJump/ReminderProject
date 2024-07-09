//
//  DeadlineViewModel.swift
//  ReminderProject
//
//  Created by 최민경 on 7/9/24.
//

import Foundation

class DeadlineViewModel {
    
    
    var inputDate: Observable<String?> = Observable(nil)
    
    
    
    var outputValidationText = Observable("")
//    var outputValid = Observable(false)
    
    init() {
        print("ViewModel Init")
        inputDate.bind { _ in
            self.validation()
        }
        
    }
    
    private func validation() {
        guard let text = inputDate.value else { return }
        
//        let format = DateFormatter()
//        format.dateFormat = "yyyy.MM.dd"
//        let result = format.string(text)
//        
        
        outputValidationText.value = text
    }
    
}
