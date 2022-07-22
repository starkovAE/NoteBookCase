//
//  NetworkRequest.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit
struct NetworkRequest {
    //MARK: - данный метод получает данные из удаленного API в формате JSon
    func request(urlString: String, completion: @escaping (Result<Data,Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
                //print("ПРИХОДЯТ ДАННЫЕ: \(data)")
                
            }
        }.resume()
    }
}

