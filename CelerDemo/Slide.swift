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

class Slide: UIView {

//    @IBOutlet weak var labelTitle: UITextView!
    @IBOutlet weak var view: UIView!
    
    private let labelTitle: UILabel = .create {
        $0.font = Style.Font.h3Heavy
        $0.textColor = .black
        $0.textAlignment = .center
    }
//    private let view = UIView(frame: .zero)
    
    func configure(str: String){
        labelTitle.text = str
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            
        }
        
//        addSubview(view)
//        view.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().inset(30)
//            make.left.equalToSuperview().inset(10)
//            make.right.equalToSuperview().inset(10)
//        }
        
    }
    
    
    func playVideo(urlStr: String){
        
        let videoURL = URL(string: urlStr)
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        view.layer.addSublayer(playerLayer)

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
