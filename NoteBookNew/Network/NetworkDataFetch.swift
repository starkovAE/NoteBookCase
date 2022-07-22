//
//  NetworkDataFetch.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//


import Foundation

struct NetwrokDataFetch {
    let networkRequest = NetworkRequest()
    //MARK: - метод преобразует данные из формата Json в нужный нам формат
    func fetchUsers(urlString: String, completion: @escaping (UserData?) -> Void) {
        networkRequest.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode(UserData.self, from: data)
                    completion(users)
                    //print("ДАННЫЕ О ПОЛЬЗОВАТЕЛЯХ: \(users)")
                    
                } catch let jsonError { //если не смогли декодировать
                    print("Failed to decode JSON", jsonError.localizedDescription)
                    completion(nil)
                }
            case .failure(let error):
                print("Error received requesting data", error.localizedDescription)
                completion(nil)
            }
        }
    }
}
