//
//  MomentsModel.swift
//  SiYear
//
//  Created by 程瑞朋 on 16/9/17.
//  Copyright © 2016年 程瑞朋. All rights reserved.
//

import UIKit

class MomentsModel: NSObject {
    
    var picCampusId: Int?
    var publisherId: Int?
    var content: NSString?
    var publisherSchool: String?
    var zanCount: Int?
    var campus: String?
    var publishTime: String?
    var pictures: [URL]?
    var origin_pictures: [URL]?
    var nickName: String?
    var commentModel: [CommentModel]?
    var userImageUrl: URL?
    
    init(picCampusId: Int, publisherId:Int, zanCount: Int, content: NSString,publisherSchool: String, campus: String, nickName: String, publishTime: String, pictures: [URL],origin_pictures: [URL], commentModel: [CommentModel], userImageUrl: URL) {
        self.picCampusId = picCampusId
        self.publisherId = publisherId
        self.zanCount = zanCount
        self.content = content
        self.nickName = nickName
        self.publisherSchool = publisherSchool
        self.campus = campus
        self.publishTime = publishTime 
        self.pictures = pictures
        self.origin_pictures = origin_pictures
        self.commentModel = commentModel
        self.userImageUrl = userImageUrl
    }
    
}
