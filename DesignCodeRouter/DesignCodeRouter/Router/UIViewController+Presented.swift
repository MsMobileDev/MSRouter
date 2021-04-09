//
//  UIViewController+Present.swift
//  DesignCodeRouter
//
//  Created by Olga Shilenko on 09.04.2021.
//

import UIKit

extension UIViewController {
    var isPresented: Bool {
        return self.presentingViewController != nil
    }
    
    func canPerformRollBackAction() -> Bool {
        return self.navigationController?.viewControllers.first != self
    }
}
