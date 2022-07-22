//
//  UserRealmModel.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit
import RealmSwift

class UserRealmModel: Object {
    @Persisted var userFirstName: String = "Unknow"
    @Persisted var userSecondName: String = "Unknow"
    @Persisted var gender: String = ""
    @Persisted var email: String = "Unknow"
    @Persisted var dataBirthday = "Unknow"
    @Persisted var age: Int = 0
    @Persisted var iconUser: String = ""
    @Persisted var userPhoto: String = ""
    @Persisted var time: String = ""
    @Persisted var timeZone: String = ""
    
}
