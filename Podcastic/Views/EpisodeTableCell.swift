//
//  EpisodeTableCell.swift
//  Podcastic
//
//  Created by Jason on 1/28/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit

class EpisodeTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    private var _model: Episode? = nil
    
    var model: Episode? {
        get {
            return self._model
        }
        set {
            self._model = newValue
            self.titleLabel!.text = self._model!.title
//            self.artistLabelName!.text = self._model!.artistName
//            Alamofire.request(.GET, self._model!.artworkUrl600).response { (request, response, data, error) in
//                self.mainImageView.image = UIImage(data: data!, scale:1)
//            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
