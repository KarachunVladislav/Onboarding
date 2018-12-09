//
//  ViewController.swift
//  Onboardig0.2
//
//  Created by Vladislav on 12/3/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WalkthroughViewControllerDelagate {

    @IBOutlet weak var bottobView: UIView!

    @IBOutlet var nextButton: UIButton! {
        didSet {
            
         
            let orange = UIColor(displayP3Red: 229/255, green: 102/255, blue: 33/255, alpha: 1.0)
            #colorLiteral(red: 0.8970529437, green: 0.4015371203, blue: 0.1298207343, alpha: 1)
            let bringOrang = UIColor(displayP3Red: 255/255, green: 175/255, blue: 72/255, alpha: 1.0)
            //nextButton.setBackgroundImage(UIImage.imageWithColor(colorOne: orange), for: .normal)
            nextButton.applyGradient(colours: [orange, bringOrang])
            //nextButton.setBackgroundImage(UIImage.imageWithColor(orange), for: .highlighted)
        }
    }
    //MARK: - Properties
    
    var walkthroughPagePageViewController: WalkthroughViewController?
    
    //MARK: - Actions
    
    @IBAction func nextButtonTapped(sender: UIButton){
        if let index = walkthroughPagePageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPagePageViewController?.forwardPage()
                
            case 2:
                dismiss(animated: true, completion: nil)
                exit(0)
                
            default: break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPagePageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("Next", for: .normal)
                
            case 2:
                nextButton.setTitle("Exit", for: .normal)
                
            default: break
            }
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughViewController {
            walkthroughPagePageViewController = pageViewController
            walkthroughPagePageViewController?.walkthroughDelegate = self
        }
    }

}

