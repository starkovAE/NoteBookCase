//
//  ExtensionNavigBar.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//

import UIKit

extension MainViewController {
     //MARK: - setupNavigationBar()
     func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    //MARK: - navigationBarActivityIndicator()
    func navigationBarActivityIndicator(hide: Bool = false) {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = #colorLiteral(red: 0.07864784449, green: 0.1034145281, blue: 0.1695130467, alpha: 0.8975010702)
        activityIndicator.startAnimating()
        let barButton = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.isHidden = hide
        navigationItem.rightBarButtonItem = barButton
    }
}
