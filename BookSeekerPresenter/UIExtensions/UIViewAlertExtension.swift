//
//  AlertExtension.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 19/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

extension UIViewController {
    public func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel".localized(), style: .cancel, handler: nil)
        alert.addAction( cancel )
        present(alert, animated: true, completion: nil)
    }
}
