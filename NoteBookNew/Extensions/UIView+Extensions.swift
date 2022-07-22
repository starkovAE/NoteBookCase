//
//  UIView+Extensions.swift
//  NoteBookTestTask
//
//  Created by Александр Старков on 02.07.2022.
//
import UIKit
 //Расширение для добавлении тени к view
extension UIView {
    func addShadowOnView(setColor color: UIColor, setOpacity opacity: Float, setRadius radius: CGFloat){
        layer.shadowColor  = color.cgColor
        layer.masksToBounds = false //маска до предела фолс
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0) //размеры
        layer.shadowOpacity = opacity// непрозрачность
        layer.shadowRadius = radius // радиус
    }
}
