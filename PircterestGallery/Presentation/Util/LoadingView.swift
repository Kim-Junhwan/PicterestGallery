//
//  LoadingView.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 28/03/2020.
//

import UIKit

public class LoadingView {

     static var spinner: UIActivityIndicatorView?
    
    static let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene

    public static func show() {
            if spinner == nil{
                guard let windowScene = windowScene else {return}
                let frame = windowScene.screen.bounds
                let spinner = UIActivityIndicatorView(frame: frame)
                spinner.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                spinner.style = .large
                spinner.color = .white
                spinner.hidesWhenStopped = true
                windowScene.keyWindow?.addSubview(spinner)
                spinner.startAnimating()
                self.spinner = spinner
            } else {
                guard let spinner = spinner else { return }
                spinner.startAnimating()
            }
    }

    public static func hide() {
            guard let spinner = spinner else { return }
            spinner.stopAnimating()
            //spinner.removeFromSuperview()
            //self.spinner = nil
    }
}
