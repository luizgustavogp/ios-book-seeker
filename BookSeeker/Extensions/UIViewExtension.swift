//
//  UIViewExtension.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 25/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

//https://stackoverflow.com/questions/46317061/how-do-i-use-safe-area-layout-programmatically

import UIKit

extension UIView {

  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return self.safeAreaLayoutGuide.topAnchor
    }
    return self.topAnchor
  }

  var safeLeftAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return self.safeAreaLayoutGuide.leftAnchor
    }
    return self.leftAnchor
  }

  var safeRightAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return self.safeAreaLayoutGuide.rightAnchor
    }
    return self.rightAnchor
  }

  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return self.safeAreaLayoutGuide.bottomAnchor
    }
    return self.bottomAnchor
  }
}
