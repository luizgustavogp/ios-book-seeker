//
//  BookCell.swift
//  BookSeeker
//
//  Created by Luiz Guimarães on 18/04/20.
//  Copyright © 2020 CodeOfThings. All rights reserved.
//

import UIKit
import Kingfisher

class BookCell : UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbArtist: UILabel!
    @IBOutlet weak var imgThumb: UIImageView!
    
    func configureCell(rowBook : Book?){
        
        if let book: Book = rowBook {
            let url = URL(string: book.artworkUrl100)
            
            self.imgThumb.kf.setImage(with : url)
            self.lbTitle.text = book.trackName
            self.lbArtist.text = book.artistName
        }
    }    
}
