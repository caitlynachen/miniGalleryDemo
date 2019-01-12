//
//  Slide.swift
//  CelerDemo
//
//  Created by Caitlyn Chen on 1/11/19.
//  Copyright © 2019 Caitlyn Chen. All rights reserved.
//

import UIKit
import AVKit
import SnapKit

class Slide: UICollectionViewCell {

//    @IBOutlet weak var labelTitle: UITextView!
//    @IBOutlet weak var view: UIView!
    
    let labelTitle: UILabel = .create {
        $0.font = Style.Font.h3Heavy
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            
        }
        
        
    }
    
    
    func playVideo(urlStr: String){
        var vidview: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 200))
        
        addSubview(vidview)
        vidview.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(40)
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        let videoURL = URL(string: urlStr)
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = vidview.bounds
        vidview.layer.addSublayer(playerLayer)

        player.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
    player.seek(to: CMTime.zero)
            player.play()
        }


    }
    

    /*
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
