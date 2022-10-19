//
//  Extension.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import Foundation
import UIKit
extension UIView{
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                
                left: NSLayoutXAxisAnchor? = nil,
                paddingLeft: CGFloat = 0,
                
                right: NSLayoutXAxisAnchor? = nil,
                paddingRight: CGFloat = 0,
                
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingBottom: CGFloat = 0,
                
                width: CGFloat? = nil,
                height: CGFloat? = nil) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }

    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingleft: CGFloat? = nil, constant: CGFloat? = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true

        if let leftAnchor = leftAnchor, let padding = paddingleft {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        }
    }

    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: bottomAnchor)
    }
    func removeConstraint(){
        removeConstraints(constraints)
    }
}

import Nuke
extension UIImageView {
    func loadImage(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        loadImage(with: url)
    }

    func loadImage(with url: URL) {
        Nuke.loadImage(with: url, into: self)
    }
}
