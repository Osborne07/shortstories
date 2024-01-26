//
//  ViewController.swift
//  Kids_Stories_Assignments
//
//  Created by Snehal Shrikant Patil on 03/04/23.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var startBTNLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBTNLBL.layer.cornerRadius = 10.0
        startBTNLBL.layer.masksToBounds = true

    }
    
    @IBAction func startBTNPressed(_ sender: Any) {
//        let StoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as? HomeViewController
//        self.navigationController?.pushViewController(StoryViewController!, animated: true)
//
        let vc = storyboard?.instantiateViewController(withIdentifier: "VC2")
        self.navigationController?.viewControllers = [vc!]
        
        
    }
    
}
