//
//  CommentModel.swift
//  Swift_Moments
//
//  Created by 程瑞朋 on 2016/12/24.
//  Copyright © 2016年 程瑞朋. All rights reserved.
//

import UIKit

// 评论的Model
class CommentModel: NSObject {
    
    var commentText: String?
    var commenterId: Int?
    var nickName: String?
    var picCampusId: Int?
    
    init(commentText:String, commenterId: Int, nickName: String,picCampusId: Int) {
        self.commentText = commentText
        self.commenterId = commenterId
        self.nickName = nickName
        self.picCampusId = picCampusId
    }
    
}
