//
//  ProjectorPageViewController.swift
//  Carousel
//
//  Created by Mospeng Research Lab Philippines on 5/24/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class ProjectorPageViewController: UIPageViewController {
    
    let imageNames = ["shirt0","shirt1","shirt2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        view.backgroundColor = .black
        let frameViewController = FrameViewController()
        frameViewController.imageName = imageNames.first
        let viewControllers = [frameViewController]
        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
    }
    
}

extension ProjectorPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           
        let currentImageName = (viewController as! FrameViewController).imageName
        let currentIndex = imageNames.firstIndex(of: currentImageName!)!
        
        if currentIndex < imageNames.count - 1 {
            let frameViewController = FrameViewController()
            frameViewController.imageName = imageNames[currentIndex + 1]
            return frameViewController
        }
           
        return nil
    }
   
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentImageName = (viewController as! FrameViewController).imageName
        let currentIndex = imageNames.firstIndex(of: currentImageName!)!
        
        if currentIndex > 0 {
            let frameViewController = FrameViewController()
            frameViewController.imageName = imageNames[currentIndex - 1]
            return frameViewController
        }
        
        return nil
    }
    
}
