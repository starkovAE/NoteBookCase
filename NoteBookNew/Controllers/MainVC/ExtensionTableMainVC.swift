//
//  ExtensionMainVC.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Метод количества ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 
        return  usersArray != nil ? usersArray.count : 30
    }
    //MARK: - Метод высоты ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    //MARK: - Метод конфигурирующий ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableCell
        let model = usersArray[indexPath.row]
        cell.settingCastomView(users: model)
        return cell
    }
    //MARK: - Удаление ячеек
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { //
        let action = UIContextualAction(style: .destructive, title: "") { _, _, _ in
            let deleteModel = self.usersArray[indexPath.row]
            RealmManager.shared.deleteUserModel(userModel: deleteModel)
            tableView.reloadData()
        }
        action.backgroundColor = .white
        action.image = UIImage(named: "delete")
        return UISwipeActionsConfiguration(actions: [action])
    }
    //MARK: - Метод по выбранной ячейке
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}
