//
//  ViewController.swift
//  AnimatorDismiss
//
//  Created by 朱　冰一 on 2018/03/01.
//  Copyright © 2018年 zhu.bingyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var presentButton: UIButton!
    
    var transAnimator = CustomAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func presentAction(_ sender: Any) {
        let vc = BViewController()
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIViewControllerInteractiveTransitioning {
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = CustomAnimator()
        animator.interactionController = InteractiveAnimator(viewController: dismissed)
        animator.presenting = false
        return animator
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = CustomAnimator()
        animator.presenting = true
        return animator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return InteractiveAnimator(viewController: self)
    }
}
