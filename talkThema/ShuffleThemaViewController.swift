//
//  ShuffleThemaViewController.swift
//  talkThema
//
//  Created by 小西星七 on 2021/02/28.
//

import UIKit

class ShuffleThemaViewController: UIViewController {
    
    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    var allArray:[String] = []
    
    @IBOutlet var themaTextView: UITextView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //allArrayにユーザーデフォルトのallArrayを代入
        allArray = saveData.object(forKey: "all") as! [String]
        


        // Do any additional setup after loading the view.
    }
    
    @IBAction func shuffle(){
        
        let index = allArray.count - 1
        let rand = Int.random(in: 0...index)
        
        themaTextView.text = allArray[rand]
        
    }
    
    @IBAction func buck(){
        
        self.dismiss(animated: true, completion: nil)
        
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
