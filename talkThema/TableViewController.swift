//
//  ViewController.swift
//  talkThema
//
//  Created by 小西星七 on 2021/02/28.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let cellIdentifier = "UITableViewCell"
    //ユーザーデフォルトの宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //TableViewを宣言
    @IBOutlet var table: UITableView!
    
    //配列を宣言
    var allArray:[String] = ["メンターになった理由は？",
                             "中2の黒歴史ってある？",
                             "好きなタイプは？",
                             "これまでで一番甘酸っぱい思い出は？",
                             "これまで一番思い出に残ってるキャンプは？",
                             "この子は紹介したい！ってメンバー、いる？",
                             "キャンプ・スクールでのトラブルこんなの大変だった！",
                             "好きな社員さんは？",
                             "大学でなんの勉強してる？",
                             "次につくりたいものは？",
                             "一番得意な料理は何？",
                             "大学生活で一番思い出に残ってることはなに？",
                            "リーダーズの講師、優しかった？"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.delegate = self
        
        saveData.setValue(allArray, forKey: "all")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //画面が呼び出された時に行いたい処理
        allArray = saveData.object(forKey: "all") as! [String]
        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //"Cell"というIDのセルを取得
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        cell?.textLabel?.text = allArray[indexPath.row]
        print(indexPath.row)
        
        //このreturnの意味は？→関数自体が「どんなセル？」と聞いているのに対して、こんなセル！と返す意味のreturn
        return cell!
           
       }
    
    @IBAction func toAddThema(){
        
        //画面遷移
           performSegue(withIdentifier: "toAddThema", sender: nil)
        
    }
    
    @IBAction func toShuffle(){
        
        //画面遷移
           performSegue(withIdentifier: "toShuffle", sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAddThema"{
          
          //画面遷移を変数に入れる
            let viewController = segue.destination as! AddThemaViewController
          
          //遷移先のsaveDataにこっちのsavedateを代入する
              viewController.saveData = self.saveData
            
        }else if segue.identifier == "toShuffle"{
            
            //画面遷移を変数に入れる
              let viewController = segue.destination as! ShuffleThemaViewController
            
            //遷移先のsaveDataにこっちのsavedateを代入する
                viewController.saveData = self.saveData
            
        }
        
    }


}

