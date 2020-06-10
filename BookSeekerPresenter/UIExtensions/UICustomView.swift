//
//  UICustomView.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 29/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

public class CustomViewController<CustomView: UIView>: UIViewController {
    var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("view is not a custom view")
        }
        return customView
    }
    public override func loadView() {
        view = CustomView()
    }
}
