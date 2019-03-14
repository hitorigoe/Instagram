//
//  PopupViewController.swift
//  Instagram
//
//  Created by new torigoe on 2019/03/14.
//  Copyright © 2019 鳥越洋之. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        let popupWidth = (screenWidth * 3)/4
        let popupHeight = (screenWidth * 4)/5
        
        // uiviewの作成　ポップアップ
        let testUIView = UIView()
        testUIView.frame = CGRect(
            x:screenWidth/8,
            y:screenHeight/5,
            width:popupWidth,
            height:popupHeight
        )
        testUIView.backgroundColor = UIColor.white
        testUIView.layer.cornerRadius = 10
        
        self.view.addSubview(testUIView)
        
        // 画面のどこかがタップされたらポップアップを消す処理
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.tapped(_:)))
        
        // デリゲートをセット
        tapGesture.delegate = self as? UIGestureRecognizerDelegate
        
        self.view.addGestureRecognizer(tapGesture)
        
        // ポップアップ以外のところを半透明のグレーに。
        self.view.backgroundColor = UIColor(
            red: 150/255,
            green: 150/255,
            blue: 150/255,
            alpha: 0.6
        )
    }
    
    // どこかタップされたときポップアップを消し去る関数
    @objc func tapped(_ sender: UITapGestureRecognizer){
        self.view.removeFromSuperview()
    
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
