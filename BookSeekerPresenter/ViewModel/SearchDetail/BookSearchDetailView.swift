//
//  BookSearchDetailView.swift
//  BookSeekerPresenter
//
//  Created by Luiz Guimarães on 09/06/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import BookSeekerDomain

final public class BookSearchDetailView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupControls()
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

    private lazy var lbArtist: UILabel = {
        let lbArtist: UILabel = UILabel(frame: .zero)
        lbArtist.translatesAutoresizingMaskIntoConstraints = false
        lbArtist.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbArtist.text = "search".localized()

        return lbArtist
    }()

    private lazy var lbDescription: UILabel = {
        let lbDescription: UILabel = UILabel(frame: .zero)
        lbDescription.translatesAutoresizingMaskIntoConstraints = false
        lbDescription.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbDescription.text = "search".localized()

        return lbDescription
    }()

    private lazy var lbPrice: UILabel = {
        let lbPrice: UILabel = UILabel(frame: .zero)
        lbPrice.translatesAutoresizingMaskIntoConstraints = false
        lbPrice.font = UIFont.boldSystemFont(ofSize: 20.0)
        lbPrice.text = "search".localized()

        return lbPrice
    }()

    private func setupLayoutConstraint() {
        NSLayoutConstraint.activate([
            lbTitle.safeTopAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            lbTitle.safeLeftAnchor.constraint(equalTo: safeLeftAnchor, constant: 10),
            lbTitle.safeRightAnchor.constraint(equalTo: safeRightAnchor, constant: -10)
        ])
    }

    private func setupControls() {
        addSubview(lbTitle)
        addSubview(lbPrice)
        addSubview(lbArtist)
        addSubview(lbDescription)
    }

    func configure(rowBook: Book?) {
        if let book: Book = rowBook {
            lbTitle.text = book.trackName
            lbPrice.text = book.formattedPrice
            lbArtist.text = book.artistName
            lbDescription.text = book.description
        }
    }
}
