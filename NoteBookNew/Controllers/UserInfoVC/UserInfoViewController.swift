//
//  UserInfoViewController.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit
import RealmSwift
import SDWebImage

class UserInfoViewController: UIViewController {

    var userDataRealm: UserRealmModel?
    
    //MARK: - UIElements
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var fullUserName: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var dataBLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    //MARK: - image
    private var image: UIImage? {
        get {
            return userPhoto.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            userPhoto.image = newValue
        }
    }
    //MARK: imageTapped() - открытие фотки на весь экран
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
    }

    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        sender.view?.removeFromSuperview()

    }
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Information"
        setupView()
    }
    //MARK: setupView()
    private func setupView() {
        //userPhoto
        setupImage()
        // fullName
        guard let firstName = userDataRealm?.userFirstName, let secondName = userDataRealm?.userSecondName else { return  }
        fullUserName.text = firstName + " " + secondName
        //userEmail
        emailLabel.text = userDataRealm?.email ?? "no data"
        //dataBirth
        if let dataB = userDataRealm?.dataBirthday, let standartData = DateFormatter.iso8601Full.date(from: dataB) {
            self.dataBLabel.text = DateFormatter.ddMMyyyy.string(from: standartData)
            switch userDataRealm?.age {
            case .some(let age):
                if let age = ageLabel.text?.replacingOccurrences(of: "00", with: age.description) {
                    self.ageLabel.text = age
                }
            default:
                self.ageLabel.text = ""
            }
        }
        //userGender
        if userDataRealm?.gender == "male" {
            genderImage.image = UIImage(named: "man")
        } else {
            genderImage.image = UIImage(named: "female")
        }
        //timeZone
        if let timeZones = userDataRealm?.timeZone {
            let format = DateFormatter()
            format.dateFormat = "HH:mm"
            format.timeZone = TimeZone(identifier: "GMT" + timeZones)
            timeLabel.text = format.string(from: .init()) + " (GMT \(timeZones.prefix(2)))"
        }
    }
    //MARK: - setupImage()
    private func setupImage() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        DispatchQueue.main.async {
            self.userPhoto.sd_setImage(with: URL(string: self.userDataRealm?.userPhoto ?? "")) { image, _, _, _ in
                self.image = image
            }
                 }
        
//        if let cachedImagePhoto = imagePhotoCache.object(forKey: String(userDataRealm?.userPhoto ?? "") as  NSString) {
//            self.image = cachedImagePhoto
//            print("КЭЭЭШБИГФОТКА")
//        } else {
//            DispatchQueue.main.async {
//                guard let url = URL(string: self.userDataRealm?.userPhoto ?? "") else { return }
//                guard let data = try? Data(contentsOf: url) else { return }
//                self.image = UIImage(data: data)
//            }
//        }
    }
    //MARK: - viewDidLayoutSubviews()
    override func viewDidLayoutSubviews() { //перерисовывает
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2 // делаем круг и перерисовываем его
    }
} //закрывает класс

