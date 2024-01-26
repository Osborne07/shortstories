//
//  StoryPostViewController.swift
//  Kids_Stories_Assignments
//
//  Created by Snehal Shrikant Patil on 03/04/23.
//

import UIKit

class StoryPostViewController: UIViewController {

    @IBOutlet weak var storyImage: UIImageView!
    
    @IBOutlet weak var storyTitlelabel: UILabel!
    
    @IBOutlet weak var storyText: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.storyImage.image = storiesInCategoryArr[post_id].story_image
        // Do any additional setup after loading the view.
        self.storyText.text = storiesInCategoryArr[post_id].post_desc
       // storiesInCategoryArr[post_id].story_image
        storyTitlelabel.text = post_name
        self.storyImage.downloadImage(from: URL(string: storiesInCategoryArr[post_id].story_image)!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
