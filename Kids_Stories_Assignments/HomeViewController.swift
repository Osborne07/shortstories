//
//  HomeViewController.swift
//  Kids_Stories_Assignments
//
//  Created by Snehal Shrikant Patil on 03/04/23.
//

import UIKit
var post_id: Int = 0
var category_id: String = ""
var category_name = ""
struct CategoyJson:Codable {
    var category_id : String
    var category_name : String
    var category_image : String
    
}
var categoyJsonArr = [CategoyJson]()
class HomeViewController: UIViewController {
    @IBOutlet weak var myCV: UICollectionView!
    
    @IBOutlet weak var searchView: UIView!
    
    
    @IBOutlet weak var pngView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        searchView.layer.cornerRadius = 8.0
        searchView.layer.borderWidth = 1.0
        searchView.layer.borderColor = UIColor.black.cgColor

        api1()
    }
    
    func api1(){
        URLSession.shared.dataTask(with: URL(string: "https://mapi.trycatchtech.com/v3/stories/category_list")!,completionHandler: {
            
            //Web Data recieved from URL requset
       
                        
           data,response,error in
             
            guard let jsonResult = data, error == nil
            else
            {
                return
            }
          
            do
            {
            categoyJsonArr = try JSONDecoder().decode([CategoyJson].self,from: jsonResult)
                                                         }
                    catch{
                    print(error)
                    }
            
            
            DispatchQueue.main.async {
                
                self.myCV.reloadData()
            }
        }).resume()
    }
}
 

    
    extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return categoyJsonArr.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CustomCVCell
           cell.storyLBL.text = categoyJsonArr[indexPath.row].category_name
           cell.layer.cornerRadius = 14.0
           cell.layer.borderWidth = 1.0
           cell.layer.borderColor = UIColor.black.cgColor
           cell.storyIMG.downloadImage(from: URL(string: categoyJsonArr[indexPath.row].category_image)!)
           return cell
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: (collectionView.frame.width-20)/2, height: (collectionView.frame.height-20)/3)
       }
     
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            category_id = categoyJsonArr[indexPath.row].category_id
            category_name = categoyJsonArr[indexPath.row].category_name
            print(category_id)
            
            let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "storyVC") as? StoryViewController
            self.navigationController?.pushViewController(vc3!, animated: true)
        
        }
   }

   


