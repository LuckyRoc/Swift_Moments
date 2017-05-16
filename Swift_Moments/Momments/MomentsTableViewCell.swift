//
//  MomentsTableViewCell.swift
//  SiYear
//
//  Created by 程瑞朋 on 16/9/17.
//  Copyright © 2016年 程瑞朋. All rights reserved.
//

import UIKit


class MomentsTableViewCell: UITableViewCell {
    
    var iconView: UIImageView!
    var nameLabel: UILabel!
    var dayLabel: UILabel!
    // var timeLabel: UILabel!
    var lineView: UIView!
    var schoolLabel: UILabel!
    var contentLabel: UILabel!
    var picturesView: [UIImageView] = [UIImageView]()
    var replayLabels: [UILabel] = [UILabel]()
    var picCampusFrame: PicCampusFrame!
    var zanButton: UIButton!
    var zanLabel: UILabel!
    var replayTextField: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        let iconView: UIImageView = UIImageView()
        
        iconView.layer.borderWidth =  0
        iconView.layer.masksToBounds = false
        iconView.layer.cornerRadius = 20
        iconView.clipsToBounds = true 
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userImageTapped(tapGestureRecognizer:)))
        iconView.isUserInteractionEnabled = true
        iconView.addGestureRecognizer(tapGestureRecognizer)

        self.contentView.addSubview(iconView)
        self.iconView = iconView
        
        //创建昵称
        let nameLabel = UILabel()
        nameLabel.font = nameLabel.font.withSize(12)
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        self.contentView.addSubview(nameLabel)
        self.nameLabel = nameLabel
        
        let dayLabel = UILabel()
        dayLabel.font = dayLabel.font.withSize(12)
        dayLabel.textColor = UIColor.black
        dayLabel.textAlignment = .center
        self.contentView.addSubview(dayLabel)
        self.dayLabel = dayLabel
        
        /*
        let timeLabel = UILabel()
        timeLabel.font = dayLabel.font.fontWithSize(13)
        timeLabel.textColor = UIColor.blackColor()
        self.contentView.addSubview(timeLabel)
        self.timeLabel = timeLabel
        */
        
        //创建正文
        let contentLabel = UILabel()
        contentLabel.font = contentLabel.font.withSize(16)
        contentLabel.textColor = UIColor.black
        // shuoshuotextLabel.backgroundColor = UIColor.redColor()
        contentLabel.numberOfLines = 0
        self.contentView.addSubview(contentLabel)
        self.contentLabel = contentLabel
        
        let schoolLabel = UILabel()
        schoolLabel.font = schoolLabel.font.withSize(10)
        schoolLabel.textColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        schoolLabel.textAlignment = .right
        self.contentView.addSubview(schoolLabel)
        self.schoolLabel = schoolLabel
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.red
        self.contentView.addSubview(lineView)
        self.lineView = lineView
        
        let zanButton = UIButton()
        zanButton.setImage(UIImage(named: "zan"), for: UIControlState())
        zanButton.addTarget(self, action: #selector(zanAction(_:)), for: .touchUpInside)
        self.contentView.addSubview(zanButton)
        self.zanButton = zanButton
        
        let zanLabel = UILabel()
        zanLabel.font = zanLabel.font.withSize(13)
        zanLabel.textColor = UIColor.gray
        self.contentView.addSubview(zanLabel)
        self.zanLabel = zanLabel
        
        let replayTextField = UITextField()
        replayTextField.placeholder = "评论一下"
        replayTextField.font = replayTextField.font!.withSize(13)
        replayTextField.tag = 1000
        
        replayTextField.layer.borderWidth =  1
        replayTextField.layer.masksToBounds = false
        replayTextField.layer.cornerRadius = 4
        replayTextField.returnKeyType = .send
        replayTextField.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        replayTextField.clipsToBounds = true
        
        replayTextField.leftViewMode = .always
        replayTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: replayTextField.frame.height))
        
        self.contentView.addSubview(replayTextField)
        self.replayTextField = replayTextField
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let imageView = tapGestureRecognizer.view
        let cell: MomentsTableViewCell = imageView!.superview?.superview as! MomentsTableViewCell
        let table: UITableView = cell.superview?.superview as! UITableView
        let indexPath = table.indexPath(for: cell)
//        self.imageClickCallBack!((indexPath?.row)!, (imageView?.tag)!)
    }
    
    func userImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
//        self.userImgaeCallBack?(tappedImage.tag)
    }
    
    func settingtData(indexRow: Int) {
        let MomentsModel: MomentsModel = self.picCampusFrame.MomentsModel!
        
//        iconView.kf.setImage(with: MomentsModel.userImageUrl)
        
        nameLabel.text = MomentsModel.nickName
        //创建昵称
        dayLabel.text = MomentsModel.publishTime
        
        // timeLabel.text = MomentsModel.publishTime

        //创建正文
        contentLabel.text = String(MomentsModel.content!)
        zanLabel.text = "\(MomentsModel.zanCount!)人已赞"
        
        zanButton.tag = indexRow
        iconView.tag = indexRow
        schoolLabel.text = MomentsModel.publisherSchool!
        
        //创建配图
        for (index, item) in MomentsModel.pictures!.enumerated() {
            let pictureView = UIImageView()
//            pictureView.kf.setImage(with: item)
            pictureView.tag = index
            let imageClickGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            
            pictureView.isUserInteractionEnabled = true
            pictureView.addGestureRecognizer(imageClickGestureRecognizer)
            self.contentView.addSubview(pictureView)
            picturesView.append(pictureView)
        }
        
        // 回复的文字
        for index in MomentsModel.commentModel! {
            let replyLabel = UILabel()
            replyLabel.numberOfLines = 0
            replyLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
            replyLabel.font = UIFont(name: (replyLabel.font?.fontName)!, size: 13)
            
            let labelString = index.nickName! + ":" + index.commentText! as NSString
            
            let rang = labelString.range(of: ":")
            let firstRang = NSMakeRange(0, rang.location)
            let labelText = NSMutableAttributedString(string: labelString as String)
            labelText.addAttributes([NSForegroundColorAttributeName:UIColor(red: 16/255, green: 16/255, blue: 16/255, alpha: 1), NSFontAttributeName:UIFont.systemFont(ofSize: 13)], range: firstRang)
            
            replyLabel.attributedText = labelText
            
            replyLabel.isUserInteractionEnabled = true // Remember to do this
            replyLabel.tag = index.commenterId!
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self, action: #selector(self.didTapLabelDemo(_:)))
            replyLabel.addGestureRecognizer(tap)
            
            self.contentView.addSubview(replyLabel)
            replayLabels.append(replyLabel)
        }
    }
    
    func didTapLabelDemo(_ tapGestureRecognizer: UITapGestureRecognizer) {
        
        let imageView = tapGestureRecognizer.view
        let cell: MomentsTableViewCell = imageView!.superview?.superview as! MomentsTableViewCell
        let table: UITableView = cell.superview?.superview as! UITableView
        let indexPath = table.indexPath(for: cell)
//        self.userNameClickCallBack!((indexPath?.row)!, (imageView?.tag)!)
        
    }
    
    func settingFrame() {
        iconView.frame = self.picCampusFrame.iconViewFrame!
        nameLabel.frame = self.picCampusFrame.nameLabelFrame!
        dayLabel.frame = self.picCampusFrame.dayLabelFrame!
        contentLabel.frame = self.picCampusFrame.contentLabelFrame!
        zanLabel.frame = self.picCampusFrame.zanLabelFrame!
        zanButton.frame = self.picCampusFrame.zanButtonFrame!
        replayTextField.frame = self.picCampusFrame.replayButtonFrame!
        schoolLabel.frame = picCampusFrame.schoolFrame!
        lineView.frame = self.picCampusFrame.lineViewFrame!
        
        for (index, element) in picCampusFrame.picturesViewFrame.enumerated() {
            picturesView[index].frame = element
        }
        
        for (index, element) in picCampusFrame.replyFrames.enumerated() {
            replayLabels[index].frame = element
        }
    }
    
    func setFamilyGroupFrame(_ picCampusFrame: PicCampusFrame, indexRow: Int) {
        self.picCampusFrame = picCampusFrame
        
        for index in self.picturesView {
            let oicVIew = index
            if ((oicVIew.superview) != nil) {
                oicVIew.removeFromSuperview()
            }
        }
        
        for index in self.replayLabels {
            let oicVIew = index
            if ((oicVIew.superview) != nil) {
                oicVIew.removeFromSuperview()
            }
        }
 
        self.picturesView.removeAll()
        self.replayLabels.removeAll()
        
        settingtData(indexRow: indexRow)
        settingFrame()
    }
    
    func zanAction(_ button: UIButton) {
//        self.zanCallBack?(button.tag)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
