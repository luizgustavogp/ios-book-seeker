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
        return view as! CustomView
    }

    public override func loadView() {
        view = CustomView()
    }
}