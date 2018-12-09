//
//  WalkthroughViewController.swift
//  Onboardig0.2
//
//  Created by Vladislav on 12/3/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit

protocol WalkthroughViewControllerDelagate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    //MARK: - Properties
    
    weak var walkthroughDelegate: WalkthroughViewControllerDelagate?
    
    var pageDescriptions = ["Sushi is made with specially prepared rice. The rice is mixed with vinegar, salt, and sugar. Sushi also contains raw or cooked seafood, and sometimes vegetables as well. Sometimes sushi is wrapped in a sheet of seaweed called nori.",
        "The two most common types are the ring doughnut and the filled doughnut, which is injected with fruit preserves, cream, custard, or other sweet fillings. Alternatively, small pieces of dough are sometimes cooked as doughnut holes.",
        "A candle is an ignitable wick embedded in wax, or another flammable solid substance such as tallow, that provides light, and in some cases, a fragrance. A candle can also provide heat, or be used as a method of keeping time. The candle can be used during the event of a power outage to provide light"]
    var pageImages = ["image1", "image2", "image3"]
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the data source to itself
        dataSource = self
        delegate = self
        
        // Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    //MARK: - Page View Controller Data Source
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageDescriptions.count {
            return nil
        }
        //Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.descriptionText = pageDescriptions[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if  let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: - Page View Controller Delegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController{
                currentIndex = contentViewController.index
                
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    
}
