//
//  PicCampusViewController.swift
//  SiYear
//
//  Created by 程瑞朋 on 16/9/17.
//  Copyright © 2016年 程瑞朋. All rights reserved.
//

import UIKit

let momentsTableViewCell = "MomentsTableViewCell"

class PicCampusViewController: UIViewController {

    let buttonBack: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
    var tableView: UITableView = UITableView(frame: CGRect(x: 0, y: 44, width: SCREENW, height: SCREENH-64-44-44))
    
    lazy var picCampusFrames = [PicCampusFrame]()
    var pinglunButton = UIButton()
    var pinglunLabel = UILabel()
    var pageIndex: Int = 1
    var isSearch: Bool = false
    var searchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    
    
    
    func initTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        tableView.register(MomentsTableViewCell.self, forCellReuseIdentifier:momentsTableViewCell)
        
        self.view.addSubview(tableView)
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func commentPicCampus(picCampusId: String, commentText: String) {
        
    }
    
    // index: index, indexRow: indexRow
    func praisePic(billId: String, index: Int, indexRow: Int) {
        
        
    }
}

extension PicCampusViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let indexRow = textField.tag
        
        let bb = textField.text!
        if bb == "" {
//            let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
//            hud?.mode = MBProgressHUDMode.text
//            hud?.labelText = "评论不能为空"
//            hud?.hide(true, afterDelay: 1.0)
//            self.view.endEditing(true)
        } else {
            let familyGroupFrameNeedChanged = self.picCampusFrames[indexRow]
            
            let picCampusId = familyGroupFrameNeedChanged.MomentsModel?.picCampusId!
            
            let newFamilyGroup = familyGroupFrameNeedChanged.MomentsModel
            
            let userName: String = "name"
            let commenterId: Int = 1 // 评论的id
            
            let commentModel = CommentModel(commentText: bb, commenterId: commenterId, nickName: userName, picCampusId: picCampusId!)
            newFamilyGroup?.commentModel?.append(commentModel)
            
            familyGroupFrameNeedChanged.MomentsModel = newFamilyGroup
            
            self.picCampusFrames[indexRow] = PicCampusFrame.init(MomentsModel: newFamilyGroup!)
            let indexPathChanged = IndexPath(row: indexRow, section: 0)
            self.tableView.reloadRows(at: [indexPathChanged], with: UITableViewRowAnimation.automatic)
            textField.text = ""
            
            commentPicCampus(picCampusId: "\(picCampusId!)", commentText: bb)
        }
        return true
    }
}

extension PicCampusViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - tableview delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return picCampusFrames[indexPath.row].cellHeight!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picCampusFrames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexRow = indexPath.row
        
        var cell:MomentsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: momentsTableViewCell) as? MomentsTableViewCell
        
        if (cell == nil) {
            cell = MomentsTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: momentsTableViewCell)
        }
        
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        
        /*
        cell!.zanCallBack = ({(index: Int)->Void in
            
            let id: Int = (self.picCampusFrames[index].MomentsModel?.picCampusId!)!
            self.praisePic(billId: String(describing: id), index: index, indexRow: indexRow)
            
        })
        cell?.userNameClickCallBack = ({(indexRow: Int, owenerId: Int)-> Void in
            
            let otherUserInfoViewController = OtherUserInfoViewController()
            otherUserInfoViewController.userId = owenerId
            otherUserInfoViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(otherUserInfoViewController, animated: true)
        })

        cell!.userImgaeCallBack = ({(index: Int)-> Void in
            let owenerId = self.picCampusFrames[index].MomentsModel?.publisherId
            let otherUserInfoViewController = OtherUserInfoViewController()
            otherUserInfoViewController.userId = owenerId
            otherUserInfoViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(otherUserInfoViewController, animated: true)
        })
        
        cell!.imageClickCallBack = ({(indexRow: Int, index: Int)->Void in
            
            var images = [SKPhoto]()
            for index in (self.picCampusFrames[indexRow].MomentsModel?.origin_pictures)! {
                let photo = SKPhoto.photoWithImageURL(index.absoluteString)
                photo.shouldCachePhotoURLImage = true // you can use image cache by true(NSCache)
                images.append(photo)
            }
            
            // 2. create PhotoBrowser Instance, and present.
            let browser = SKPhotoBrowser(photos: images)
            browser.initializePageIndex(index)
            self.present(browser, animated: true, completion: {})
        })
        */
        cell?.replayTextField.delegate = self
        cell?.replayTextField.tag = indexRow
        
        cell!.setFamilyGroupFrame(picCampusFrames[indexRow], indexRow: indexRow)
        
        return cell!
    }
    
    
    func keyboardWillAppear(_ notification: Notification) {
        // 获取键盘信息
        let keyboardinfo = notification.userInfo![UIKeyboardFrameBeginUserInfoKey]
        let keyboardheight:CGFloat = ((keyboardinfo as AnyObject).cgRectValue.size.height)
        print(keyboardheight)
    }
    
    func keyboardWillDisappear(_ notification:Notification){
        
        
    }
}
