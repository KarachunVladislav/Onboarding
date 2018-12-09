//
//  WalkthroughContentViewController.swift
//  Onboardig0.2
//
//  Created by Vladislav on 12/3/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    
    var index = 0
    var descriptionText = ""
    var imageFile = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = descriptionText
        contentImageView.image = UIImage(named: imageFile)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
