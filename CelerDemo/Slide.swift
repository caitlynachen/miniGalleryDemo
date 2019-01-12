//
//  Slide.swift
//  CelerDemo
//
//  Created by Caitlyn Chen on 1/11/19.
//  Copyright © 2019 Caitlyn Chen. All rights reserved.
//

import UIKit
import AVKit

class Slide: UIView {

    @IBOutlet weak var labelTitle: UITextView!
    @IBOutlet weak var view: UIView!
    
    
    
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
