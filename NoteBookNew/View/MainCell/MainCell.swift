//
//  MainCell.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit
import SDWebImage

class MainTableCell: UITableViewCell {
    //MARK: UI
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        //view.addShadowOnView(setColor: .gray, setOpacity: 0.1, setRadius: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = UIImage(named: "rita")
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.isHidden = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    } ()
    //MARK: - image
    private var image: UIImage? {
        get {
            
            return userImageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            userImageView.image = newValue
        }
    }
    
    // MARK: - Инициализаторы
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - settingCastomView()
    func settingCastomView(users: UserRealmModel) {
        fetchImage(users: users)
        nameLabel.text = users.userFirstName
    }
    //MARK: - fetchImage()
    func fetchImage(users: UserRealmModel) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        DispatchQueue.main.async {
            self.userImageView.sd_setImage(with: URL(string: users.iconUser)) { image, _, _, _ in
                self.image = image
            }
        }
    }
    //MARK: - setupViews()
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(backgroundCell)
        addSubview(nameLabel)
        addSubview(userImageView)
        addSubview(activityIndicator)
    }
    
}//закрывает класс

//MARK: - extension
extension MainTableCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            userImageView.heightAnchor.constraint(equalToConstant: 70),
            userImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 10),
            activityIndicator.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
}

