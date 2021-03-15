//
//  AddThemaViewController.swift
//  talkThema
//
//  Created by 小西星七 on 2021/02/28.
//

import UIKit

class AddThemaViewController: UIViewController,UITextFieldDelegate {
    
    //テキストフィールドの宣言
    @IBOutlet var addThemaTextField: UITextField!
    
    var allArray:[String] = []
    
    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //allArrayにユーザーデフォルトのallArrayを代入
        allArray = saveData.object(forKey: "all") as! [String]
        
        addThemaTextField.delegate = self
        
        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func save() {
        
        let addThemaTextFieldContent = addThemaTextField.text
        if addThemaTextFieldContent == ""{
            let alert: UIAlertController = UIAlertController(title: "タスクが何かわかりません", message: "タイトルを入れてから保存してください", preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler:{
                  // ボタンが押された時の処理を書く（クロージャ実装）
                  (action: UIAlertAction!) -> Void in
                  print("Cancel")
              })
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }
        else if let nonOptionalCheck: String = addThemaTextFieldContent{
            
            allArray.append(nonOptionalCheck)
            saveData.setValue(allArray, forKey: "all")
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func buck(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        addThemaTextField.resignFirstResponder()
        return true
        
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
