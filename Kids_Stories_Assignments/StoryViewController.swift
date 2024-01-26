//
//  StoryViewController.swift
//  Kids_Stories_Assignments
//
//  Created by Snehal Shrikant Patil on 03/04/23.
//

import UIKit


var post_name = ""
struct StoryNameJason:Codable{
    var post_id: String
var category_id: String
var post_name: String
    var post_desc: String
    var story_image: String
}

var storiesInCategoryArr = [StoryNameJason]()

class StoryViewController: UIViewController {

    @IBOutlet weak var myCV2: UICollectionView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = "\(category_name) Stories"
        api2()
    }
    
    func api2(){
        URLSession.shared.dataTask(with: URL(string: "https://mapi.trycatchtech.com/v3/stories/post_list?category_id=\(category_id)&page=1")!,completionHandler: {
            
            //Web Data recieved from URL requset
       
                        
           data,response,error in
                        
            
            guard let jsonResult = data, error==nil
            else
            {
                return
            }
          
            
             
            
            do
            {
                storiesInCategoryArr = try JSONDecoder().decode([StoryNameJason].self,from: jsonResult)
                                                         }
                    catch{
                    print(error)
                    }
            
            
            DispatchQueue.main.async {
                
                self.myCV2.reloadData()
            }
        }).resume()
    }
}
 
extension StoryViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesInCategoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryNameCell", for: indexPath) as! StoryNameCVCellFileCollectionViewCell
        cell.storynameLBL.text = storiesInCategoryArr[indexPath.row].post_name
        cell.layer.cornerRadius = 14.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        post_id = indexPath.row
        post_name = storiesInCategoryArr[indexPath.row].post_name
    
        
        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "StoryPostViewController") as? StoryPostViewController
        self.navigationController?.pushViewController(vc4!, animated: true)
        
        
        
    }
    
}

extension UIImageView {
    func downloadImage(from url: URL){
        
        contentMode = .scaleToFill
        
        
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200, let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data , error == nil ,
                  let image = UIImage(data: data)
                    
            else{
                return
            }
            
            DispatchQueue.main.async {
                self.image  = image
            }
            
            
            
        }).resume()
        
    }
}

