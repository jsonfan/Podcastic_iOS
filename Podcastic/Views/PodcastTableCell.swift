//
//  PodcastTableCell.swift
//  Podcastic
//
//  Created by Jason on 1/26/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit
import Alamofire

class PodcastTableCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var artistLabelName: UILabel!
    
    
    @IBAction func handleSubscribeButtonPressed(sender: UIButton) {
    }
    
    private var _model: Podcast? = nil
    
    var model: Podcast? {
        get {
            return self._model
        }
        set {
            self._model = newValue
            self.titleLabel!.text = self._model!.collectionName
            self.artistLabelName!.text = self._model!.artistName
            Alamofire.request(.GET, self._model!.artworkUrl600).response { (request, response, data, error) in
                self.mainImageView.image = UIImage(data: data!, scale:1)
            }
            
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
