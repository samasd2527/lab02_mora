//
//  ViewController.swift
//  lab02_mora
//
//  Created by 莊善傑 on 2024/3/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var mySelectLabel: UILabel!
    @IBOutlet var pcSelectLabel: UILabel!
    @IBOutlet var userSelectSegment: UISegmentedControl!
    
    func getSelectBy(index : Int) -> String {
        return userSelectSegment.titleForSegment(at: index)!
    }
    func showWinner(myIndex : Int , pcIndex : Int )  {
        if(myIndex == pcIndex)
        {
            textLabel.text = " 平手再試一次"
            winnerLabel.text = "勝利者\n平手"
        }
        else if( (myIndex == 0 && pcIndex == 2) ||
                 (myIndex == 1 && pcIndex == 0) ||
                 (myIndex == 2 && pcIndex == 1)){
            textLabel.text = " 恭喜勝利"
            winnerLabel.text = "勝利者\n\(nameField.text!)"
        }
        else{
            textLabel.text = " 可惜電腦贏了"
            winnerLabel.text = "勝利者\n電腦"
        }
    }
    
    @IBAction func startBtn(_ sender: Any) {
        if(nameField.text != "")
        {
            userName.text = "名字\n\(nameField.text!)"
            let myIndex   = userSelectSegment.selectedSegmentIndex
            let mySelect  = getSelectBy(index: myIndex)
            mySelectLabel.text = "我方出拳\n\(mySelect)"
            
            let pcIndex   = Int.random(in: 0...2)
            let pcSelect  = getSelectBy(index: pcIndex)
            pcSelectLabel.text = "電腦出拳\n\(pcSelect)"
            
            showWinner (myIndex:myIndex,pcIndex: pcIndex)
        }
        else
        {
            textLabel.text = "請輸入玩家姓名"
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

