//
//  CustomView.swift
//  CustomViewApp
//
//  Created by Ádám-Krisztián Német on 07.09.2021.
//

import UIKit

@IBDesignable
final class CustomView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.configureView()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard  let view = self.loadViewFromNib(nibName: "CustomView") else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    @IBAction func pressButtonTUI(_ sender: Any) {
        let alertController = UIAlertController(title: "You pressed the button", message: "message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        alertController.addAction(okAction)
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }
        //...
        rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
}
