//
//  RootPageViewController.swift
//  MedicalApp
//
//  Created by Justin  Powell on 11/28/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let patInfo = sb.instantiateViewController(withIdentifier: "Patient Information") as! PatientInfo
        patInfo.patient = patient
        let medHis = sb.instantiateViewController(withIdentifier: "Medical History") as! MedicalHistory
        medHis.patient = patient
        let scripts = sb.instantiateViewController(withIdentifier: "Prescriptions") as! Prescriptions
        scripts.patient = patient
//        let appoints = sb.instantiateViewController(withIdentifier: "Appointments") as! Appointments
//        appoints.patient = patient
        return[patInfo, medHis, scripts]
    }()
    
    var myString: String = ""
    var patient: Patient!
    
    var pageControl = UIPageControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.title = patient.firstName + " " + patient.lastName
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        configurePageControl()
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 85, width: UIScreen.main.bounds.width, height:50))
        pageControl.numberOfPages = viewControllerList.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.gray
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    
    
    //get previous view controller in the page view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex =  viewControllerList.index(of: viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard viewControllerList.count > previousIndex else {return nil}
        return viewControllerList[previousIndex]
    }
    
    //get next view controller in the page view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else {return nil}
        guard viewControllerList.count > nextIndex else {return nil}
        return viewControllerList[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = viewControllerList.index(of: pageContentViewController)!
    }
    
}
