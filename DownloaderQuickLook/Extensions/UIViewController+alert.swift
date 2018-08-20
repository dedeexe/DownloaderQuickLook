//
//  UIViewController+alert.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 18/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showMessage(_ message:String, buttonTitle:String = "Ok") {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
