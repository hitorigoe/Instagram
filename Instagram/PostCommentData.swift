//
//  PostCommentData.swift
//  Instagram
//
//  Created by new torigoe on 2019/03/14.
//  Copyright © 2019 鳥越洋之. All rights reserved.
//

import Firebase
import FirebaseDatabase

class PostCommentData: NSObject {
    var id: String? // nilの可能性があるから「?」 print出力するとnilでも「?」は大丈夫
    var name: String?
    var comment: [String]?
    var date: Date?
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        self.name = valueDictionary["name"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let comments = valueDictionary["comment"] as? [String] {
            self.comment = comments
        }
        
    }
}


