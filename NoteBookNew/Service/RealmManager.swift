//
//  RealmManager.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private init() {}
    let localRealm = try! Realm()
    //MARK: - saveUserModel
    func saveUserModel(userModel: UserRealmModel) {
        try! localRealm.write {
            localRealm.add(userModel)
        }
    }
    //MARK: - deleteUserModel
    func deleteUserModel(userModel: UserRealmModel) {//метод для удаления модели
        try! localRealm.write {
            localRealm.delete(userModel)
        }
   }
}
