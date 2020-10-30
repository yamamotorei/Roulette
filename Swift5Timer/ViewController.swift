//
//  ViewController.swift
//  Swift5Timer
//
//  Created by 山本怜 on 2020/10/30.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var StopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
     //stopボタン無効化
        StopButton.isEnabled = false
        
        for i in 0..<5{
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer() {
        //タイマーを回す　0.2秒毎にtimerupdateメソッドを呼ぶ
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerupdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerupdate(){
        count += 1
        
        if count > 4 {
            count = 0
        }
        
        imageView.image = imageArray[count]
        
    }

    @IBAction func start(_ sender: Any) {
        
        startTimer()
        
        //startボタン無効化
        StartButton.isEnabled = false
        StopButton.isEnabled = true
        
    }
    
    
    @IBAction func stop(_ sender: Any) {
        StartButton.isEnabled = true
        StopButton.isEnabled = false
        
        timer.invalidate()
        
        count = 0
    }
    
    
    
    

}

