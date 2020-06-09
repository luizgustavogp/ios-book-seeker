//
//  BookCell.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import Kingfisher
import BookSeekerDomain

class BookCell : UITableViewCell {    
    
    private lazy var imgThumb: UIImageView = {
        let imgThumb = UIImageView(frame: .zero)
        imgThumb.translatesAutoresizingMaskIntoConstraints = false
        return imgThumb
    }()
    
    private lazy var lbTitle: UILabel = {
        let lbTitle : UILabel = UILabel(frame: .zero)
        lbTitle.numberOfLines = 3
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.font = UIFont.init(name: "Helvetica-Bold", size: 14)
        return lbTitle;
    }()
    
    private lazy var lbArtist: UILabel = {
        let lbArtist : UILabel = UILabel(frame: .zero)
        lbArtist.translatesAutoresizingMaskIntoConstraints = false
        return lbArtist;
    }()
    
    private func setupControls() {
        addSubview(imgThumb)
        addSubview(lbTitle)
        addSubview(lbArtist)
    }
    
    private func setupLayoutConstraint() {
        NSLayoutConstraint.activate([
            
            imgThumb.widthAnchor.constraint(equalToConstant: 77),
            imgThumb.heightAnchor.constraint(equalToConstant: 100),
            imgThumb.safeTopAnchor.constraint(equalTo: safeTopAnchor, constant: 10),
            imgThumb.safeLeftAnchor.constraint(equalTo: safeLeftAnchor, constant: 10),
            
            lbTitle.safeTopAnchor.constraint(equalTo: imgThumb.safeTopAnchor, constant: 5),
            lbTitle.safeLeftAnchor.constraint(equalTo: imgThumb.safeRightAnchor, constant: 10),
            lbTitle.safeRightAnchor.constraint(equalTo: safeRightAnchor, constant: -10),
            
            lbArtist.safeTopAnchor.constraint(equalTo: lbTitle.safeTopAnchor, constant: 60),
            lbArtist.safeLeftAnchor.constraint(equalTo: imgThumb.safeRightAnchor, constant: 10),
            lbArtist.safeRightAnchor.constraint(equalTo: safeRightAnchor, constant: -10)
        ])
    }
    
    func configureCell(rowBook : Book?){
          if let book: Book = rowBook {
              setupControls()
              setupLayoutConstraint()
              
              self.imgThumb.kf.setImage(with : URL(string: book.artworkUrl100))
              self.lbTitle.text = book.trackName
              self.lbArtist.text = book.artistName
          }
      }
}
