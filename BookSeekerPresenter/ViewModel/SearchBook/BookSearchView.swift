//
//  BookSearchView.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 24/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit

final public class BookSearchView: UIView {
    weak var delegate: BookSearchTextViewDelegate?

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(lbTitle)
        addSubview(tfSearch)
        setupLayoutConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var lbTitle: UILabel = {
        let lbTitle: UILabel = UILabel(frame: .zero)
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbTitle.text = "search".localized()
        return lbTitle
    }()
    private lazy var tfSearch: UITextField = {
        let tfSearch: UITextField = UITextField(frame: .zero)
        tfSearch.delegate = self
        tfSearch.translatesAutoresizingMaskIntoConstraints = false
        tfSearch.borderStyle = .roundedRect
        tfSearch.keyboardType = .default
        tfSearch.placeholder = "book_search_place_holder".localized()
        return tfSearch
    }()
    private func setupLayoutConstraint() {
        NSLayoutConstraint.activate([
            lbTitle.safeTopAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            lbTitle.safeLeftAnchor.constraint(equalTo: safeLeftAnchor, constant: 10),
            lbTitle.safeRightAnchor.constraint(equalTo: safeRightAnchor, constant: -10),
            tfSearch.safeTopAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 10),
            tfSearch.safeLeftAnchor.constraint(equalTo: lbTitle.safeLeftAnchor),
            tfSearch.safeRightAnchor.constraint(equalTo: lbTitle.safeRightAnchor)
        ])
    }
    public func getText() -> String? {
        return self.tfSearch.text
    }
}

//https://medium.com/@garg.vivek/primary-action-event-of-uitextfield-87fdac46b648
extension BookSearchView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let term = self.tfSearch.text else { return false }
        self.delegate?.didSearch(term)
        return true
    }
}
