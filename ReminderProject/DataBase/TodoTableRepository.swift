//
//  TodoTableRepository.swift
//  ReminderProject
//
//  Created by 최민경 on 7/5/24.
//

import Foundation
import RealmSwift

final class TodoTableRepository {
    
    // Realm 위치 찾기
    private let realm = try! Realm()
    
    // Realm 가져오기
    func fetchAll() -> [TodoTable] {
        let todoList = realm.objects(TodoTable.self)
        return Array(todoList)
    }
    
    // Realm 필터링
    func filterItem(todoType: TodoType) -> [TodoTable] {
        switch todoType {
        case .all:
            return fetchAll()
        case .finish:
            return Array(realm.objects(TodoTable.self).filter("todoLike==true"))
        case .flag:
            return fetchAll()
        case .schedule:
            return fetchAll()
        case .today:
            return fetchAll()
        }
    }
    
    // Realm 추가하기
    func createItem(_ data: TodoTable) {
        do {
            try realm.write {
                realm.add(data)
                print("Realm Create Succeed")
            }
        } catch {
            print("Realm Error")
        }
    }
    
    func deleteItem(_ data: TodoTable) {
        do {
            try realm.write {
                realm.delete(data)
                print("Realm Delete Succeed")
            }
        } catch {
            print("Realm Error")
        }
    }
    
    func updateItem(_ completionHandler: () -> Void) {
        do {
            try realm.write {
                completionHandler()
            }
        } catch {
            print("Realm Update Failed")
        }
    }
    
    
}
