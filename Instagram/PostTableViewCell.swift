//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by new torigoe on 2019/03/13.
//  Copyright © 2019 鳥越洋之. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        print(postData.comments)
        print("eeeeeedd")
        if(postData.comments.count > 0) {
            var str:String = "コメント一覧\n"
            
            for num in postData.comments {
                print(num[1])
                print("tick")
                
                str.append("\(num[0]) : \(num[1])\n")
            }
            print(str)
            self.commentLabel.text = str
        }
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        print("showshow1")
        for come in postData.comments {
            // ステートメント
            dump(come)
        }
        print("showshow2")
        //self.commentLabel.text = "\(postData.name!) : \(postData.comments.)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
    func setCommentPostData(_ :String) {
        //self.commentLabel.text = "\(postCommentData.name!) : \(postCommentData.comments!)"
    }
    
}
