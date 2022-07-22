//
//  MainViewController.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    let networkDataFetch = NetwrokDataFetch()
    var userData: UserData? = nil
    private var result = 5
    private var timer: Timer?

    //MARK: - tableView
    @IBOutlet weak var table: UITableView!
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        usersArray = localRealm.objects(UserRealmModel.self)
        setupViews()
        setDelegate()
        setupNavigationBar()
        setNetworkData(result: result)
    }
    
    //MARK: - setNetworkData()
    private func setNetworkData(result: Int) {
        let urlString = "https://randomuser.me/api/?results=\(result)"
        
        self.networkDataFetch.fetchUsers(urlString: urlString) { userdata in
            guard let userdata = userdata else { return }
            self.userData = userdata
            for user in userdata.results! {
                let userR = UserRealmModel()
                userR.userFirstName = user.name.first
                userR.userSecondName = user.name.last
                userR.gender = user.gender
                userR.email = user.email
                userR.dataBirthday = user.dob.date
                userR.age = user.dob.age
                userR.iconUser = user.picture.thumbnail
                userR.userPhoto = user.picture.large
                userR.time = user.location.timezone.timezoneDescription
                userR.timeZone = user.location.timezone.offset
                RealmManager.shared.saveUserModel(userModel: userR)
            }
            self.table.reloadData()
        }
    }
    
    //MARK: - scrollViewDidScroll()
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYouSet = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYouSet
        if distanceFromBottom < height {
            timer?.invalidate()//активируем таймер
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { [weak self] _ in
                self?.loadMoreData() //вызываем метод
                self?.table.reloadData()
            })
        }
    }
    //MARK: - loadMoreData()
    private func loadMoreData() {
        result += 5
        setNetworkData(result: result)
    }
    //MARK: - setupViews()
    private func setupViews() {
        self.table.register(MainTableCell.self, forCellReuseIdentifier: "cell")
    }
    //MARK: - setupViews()
    private func setDelegate() {
        self.table.delegate = self
        self.table.dataSource = self
    }
    //MARK: Работа с Realm
    let localRealm = try! Realm() // создали экземпляр класса реалм
    var usersArray: Results <UserRealmModel>!

 //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = table.indexPathForSelectedRow else { return }
            let model = usersArray[indexPath.row]
          let userInfo = segue.destination as! UserInfoViewController
            userInfo.userDataRealm = model
        }
    }
} //закрывает класс

