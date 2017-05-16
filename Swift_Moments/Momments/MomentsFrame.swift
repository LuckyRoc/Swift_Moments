//
//  PicCampusFrame.swift
//  SiYear
//
//  Created by 程瑞朋 on 16/9/17.
//  Copyright © 2016年 程瑞朋. All rights reserved.
//

import UIKit

class PicCampusFrame: NSObject {
    
    var iconViewFrame: CGRect?
    var nameLabelFrame: CGRect?
    var dayLabelFrame: CGRect?
    
    var contentLabelFrame: CGRect?
    var cellHeight: CGFloat?
    var picturesViewFrame: [CGRect] = [CGRect]()
    
    var lineViewFrame: CGRect?
    
    var zanButtonFrame: CGRect?
    var zanLabelFrame: CGRect?
    
    var schoolFrame: CGRect?
    var MomentsModel: MomentsModel?
    var replyFrames: [CGRect] = [CGRect]()
    
    var replayButtonFrame: CGRect?
    
    override init() { }
    
    init(MomentsModel: MomentsModel) {
        super.init() 
        self.MomentsModel = MomentsModel
        
        let schoolFrameWidth: CGFloat = 120
        let schoolFrameX: CGFloat = SCREENW - schoolFrameWidth - 20
        let schoolFrameY: CGFloat = 5
        let schoolFrameHeight: CGFloat = 20
        schoolFrame = CGRect(x: schoolFrameX, y: schoolFrameY, width: schoolFrameWidth, height: schoolFrameHeight)
        
        
        let iconViewX: CGFloat = padding
        let iconViewY: CGFloat = schoolFrame!.maxY + 5
        let iconViewWidth: CGFloat = 40
        let iconViewHeight: CGFloat = 40
        
        iconViewFrame = CGRect(x: iconViewX, y: iconViewY, width: iconViewWidth, height: iconViewHeight)
        
        let contentLabelX: CGFloat = iconViewFrame!.maxX + padding
        let contentLabelY: CGFloat = iconViewY
        let att = [NSFontAttributeName:UIFont.systemFont(ofSize: 16)]
        let contentLabelWidth: CGFloat = SCREENW - contentLabelX - padding
        let contentLabelHeight = MomentsModel.content?.boundingRect(with: CGSize(width: 300, height: 0), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: att, context: nil)
        contentLabelFrame = CGRect(x: contentLabelX, y: contentLabelY, width: contentLabelWidth, height: (contentLabelHeight?.height)!)
        
        let nameLabelX: CGFloat = 0
        let nameLabelY: CGFloat = iconViewFrame!.maxY + padding/2
        let nameLabelWidth: CGFloat = contentLabelX
        let nameLabelHeight: CGFloat = 20
        nameLabelFrame = CGRect(x: nameLabelX, y: nameLabelY, width: nameLabelWidth, height: nameLabelHeight)
        
        let dayLabelX: CGFloat = 0
        let dayLabelY: CGFloat = nameLabelFrame!.maxY
        let dayLabelWidth: CGFloat = contentLabelX
        let dayLabelHeight: CGFloat = 20
        dayLabelFrame = CGRect(x: dayLabelX, y: dayLabelY, width: dayLabelWidth, height: dayLabelHeight)
        
        if MomentsModel.pictures?.count != 0{
            var picturesViewWidth: CGFloat!
            var picturesViewHeight: CGFloat!
            if MomentsModel.pictures?.count == 1 {   //图片会大点
                picturesViewWidth = 120
                picturesViewHeight = 120
            } else {
                picturesViewWidth = 70
                picturesViewHeight = 70
            }
            
            for i in 0...(MomentsModel.pictures?.count)!-1 {
                let picturesViewX = contentLabelX + CGFloat((i%3))*(picturesViewWidth + padding)
                let picturesViewY = contentLabelFrame!.maxY + padding + (padding + picturesViewHeight)*CGFloat((i/3))
                let pictureF = CGRect(x: picturesViewX, y: picturesViewY, width: picturesViewWidth, height: picturesViewHeight)
                picturesViewFrame.append(pictureF)
            }
            cellHeight = (picturesViewFrame.last!).maxY + padding
        }else {
            cellHeight = (contentLabelFrame?.height)! + (contentLabelFrame?.height)!
        }
        
        let zanButtonFrameWidth: CGFloat = 40
        let zanButtonFrameX: CGFloat = SCREENW - zanButtonFrameWidth - 20
        let zanButtonFrameY: CGFloat = cellHeight! + padding
        let zanButtonFrameHeight: CGFloat = 26
        zanButtonFrame = CGRect(x: zanButtonFrameX, y: zanButtonFrameY, width: zanButtonFrameWidth, height: zanButtonFrameHeight)
        
        let zanlabelFrameWidth: CGFloat = 120
        let zanLabelFrameX: CGFloat = contentLabelX
        let zanLabelFrameY: CGFloat = cellHeight! + padding
        let zanLabelFrameHeight: CGFloat = 30
        
        lineViewFrame = CGRect(x: zanLabelFrameX, y: (zanButtonFrame?.maxY)! + 5, width: SCREENW - contentLabelX - padding, height: 1)
        
        zanLabelFrame = CGRect(x: zanLabelFrameX, y: zanLabelFrameY, width: zanlabelFrameWidth, height: zanLabelFrameHeight)
        
        cellHeight = cellHeight! + zanButtonFrameHeight + padding*2 
        
        for index in MomentsModel.commentModel! {
            let replayContent = index.nickName! + ":" + index.commentText!
            let replyX: CGFloat = contentLabelX
            let att = [NSFontAttributeName:UIFont.systemFont(ofSize: 14)]
            let replyWidth: CGFloat = SCREENW - replyX - padding
            let replyHeight = replayContent.boundingRect(with: CGSize(width: 300, height: 0), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: att, context: nil)
            let replyY = cellHeight
            cellHeight = self.cellHeight! + padding + replyHeight.height
            let replyF = CGRect(x: replyX, y: replyY!, width: replyWidth, height: replyHeight.height)
            replyFrames.append(replyF)
        }
        
        let replayButtonX: CGFloat = contentLabelX
        let replayButtonY: CGFloat = cellHeight!
        let replayButtonWidth: CGFloat = SCREENW - replayButtonX - padding
        let replayButtonHeight: CGFloat = 26
        
        replayButtonFrame = CGRect(x: replayButtonX, y: replayButtonY, width: replayButtonWidth, height: replayButtonHeight)
        
        cellHeight = cellHeight! + padding + replayButtonHeight
        
    }
    
}
