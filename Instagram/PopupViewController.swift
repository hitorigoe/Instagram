//
//  PopupViewController.swift
//  Instagram
//
//  Created by new torigoe on 2019/03/14.
//  Copyright © 2019 鳥越洋之. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class PopupViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentField: UITextField!
    var name: String?
    var uid: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func goButton(_ sender: Any) {
        let time = Date.timeIntervalSinceReferenceDate
        let name = Auth.auth().currentUser?.displayName
        
        let postRef = Database.database().reference().child(Const.PostCommentPath)
        let postDic = ["comment": commentField.text!, "time": String(time), "name": name!]
        postRef.childByAutoId().setValue(postDic)
        SVProgressHUD.showSuccess(withStatus: "コメント投稿しました")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func cancelButton(_ sender: Any) {
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
