//
//  MovieDetailSwiftController.swift
//  wycode
//
//  Created by wangyu on 16/3/31.
//  Copyright © 2016年 wangyu. All rights reserved.
//

import UIKit

@objc
class MovieDetailSwiftController: UIViewController {

    @IBOutlet weak var height: NSLayoutConstraint!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
  
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var ratingView: RatingControl!
    @IBOutlet weak var labelActors: UILabel!
    @IBOutlet weak var labelYear: UILabel!
//    @objc
    var entity: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "电影详情"
        
        
        
        setViews()
        
        initView()
        
    }
    
    func initView(){
        let attrString = NSAttributedString(string: labelDesc.text!)
        
        let fitLabelSize = CGSizeMake(UIScreen.mainScreen().bounds.width, CGFloat.max)
        
        let labelSize = attrString.boundingRectWithSize(fitLabelSize, options: .UsesLineFragmentOrigin, context: nil)
        
        
        print(labelSize)
        
//        let contentHeight = UIScreen.mainScreen().bounds.height - 64
//        let descShowHeight = contentHeight - 216
//        let descOffHeight = labelSize.height - descShowHeight
//        
//        
//        
//        print(descOffHeight)
//        
//        if descOffHeight > 0{
//            height.constant = contentHeight + descOffHeight
//        }else{
//            height.constant = contentHeight
//        }
        
        let contentHeight = labelSize.height+216+90;
       print(contentHeight)
        height.constant = contentHeight
        
    }

    func setViews(){
        if let url = NSURL(string: SERVER_URL.stringByAppendingString((entity.image)!)){
            image.setImageWithURL(url)
        }
        

        labelTitle.text = entity.name
        labelDesc.text = entity.desc
        ratingView.rating = Int(round(entity.rating / 2))
        labelActors.text = "主演：" + entity.actors
        labelYear.text = "年代：" + entity.year.description
        
        
        
    }

}
