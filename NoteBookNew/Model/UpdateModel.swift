////
////  UpdateModel.swift
////  NoteBookNew
////
////  Created by Александр Старков on 17.07.2022.
////
//import Foundation
//import RealmSwift
//
//class UpdateModel {
//    static let shared = UpdateModel()
//    
//    private let networkDataFetch = NetwrokDataFetch()
//    
//    private var userData: UserData? = nil
//    private var result = 20
//    
////    //MARK: Работа с Realm
////    let localRealm = try! Realm() // создали экземпляр класса реалм
////    var usersArray: Results <UserRealmModel>!
//    
//    //MARK: - setNetworkData()
//     func setNetworkData() {
//        let urlString = "https://randomuser.me/api/?results=\(result)"
//      
//            self.networkDataFetch.fetchUsers(urlString: urlString) { userdata in
//                guard let userdata = userdata else { return }
//                self.userData = userdata
//                for user in userdata.results! {
//                    let userR = UserRealmModel()
//                    userR.userFirstName = user.name.first
//                    userR.userSecondName = user.name.last
//                    userR.gender = user.gender
//                    userR.email = user.email
//                    userR.dataBirthday = user.dob.date
//                    userR.age = user.dob.age
//                    userR.iconUser = user.picture.thumbnail
//                    userR.userPhoto = user.picture.large
//                    userR.time = user.location.timezone.timezoneDescription
//                    userR.timeZone = user.location.timezone.offset
//                    RealmManager.shared.saveUserModel(userModel: userR)
//                }
//
//            }
//           
//        }
//    
//}
//
//
//
//
