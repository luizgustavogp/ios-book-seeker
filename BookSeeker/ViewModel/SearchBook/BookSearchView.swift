//
//  BookSearchView.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 24/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

final public class BookSearchView : UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addSubview(lbTitle)
        addSubview(tfSearch)
        
        layoutConstraintSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var lbTitle: UILabel = {
        let lbTitle : UILabel = UILabel(frame: .zero)
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbTitle.text = "Search"
        
        return lbTitle;
    }()
    
    private var tfSearch: UITextField = {
        let tfSearch : UITextField = UITextField(frame: .zero)
        tfSearch.translatesAutoresizingMaskIntoConstraints = false
        tfSearch.borderStyle = .roundedRect
        tfSearch.placeholder = "Apple Books"
        return tfSearch;
    }()
    
    private func layoutConstraintSetup() {
        NSLayoutConstraint.activate([
            lbTitle.safeTopAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            lbTitle.safeLeftAnchor.constraint(equalTo: safeLeftAnchor, constant: 10),
            lbTitle.safeRightAnchor.constraint(equalTo: safeRightAnchor, constant: -10),
            
            tfSearch.safeTopAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 10),
            tfSearch.safeLeftAnchor.constraint(equalTo: lbTitle.safeLeftAnchor),
            tfSearch.safeRightAnchor.constraint(equalTo: lbTitle.safeRightAnchor)
        ])
    }
}
