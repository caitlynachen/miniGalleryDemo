//
//  ViewController.swift
//  CelerDemo
//
//  Created by Caitlyn Chen on 1/10/19.
//  Copyright © 2019 Caitlyn Chen. All rights reserved.
//

import UIKit
import AVKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    //    @IBOutlet weak var iCarouselView: iCarousel!
    
    var iCarouselView: iCarousel!
    
    
    private var isfirstTimeTransform = false
    var images: [UIImage] = [#imageLiteral(resourceName: "image"), #imageLiteral(resourceName: "animal_number_2"), #imageLiteral(resourceName: "animal_number_3"), #imageLiteral(resourceName: "animal_number_4"), #imageLiteral(resourceName: "animal_number_5"),#imageLiteral(resourceName: "animal_number_6 (1)")]
    
    //    var scrollView = UIScrollView(frame: .zero)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        iCarouselView = iCarousel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        //        self.view.addSubview(scrollView)
        self.view.addSubview(iCarouselView)
        configure()
        
        // Do any additional setup after loading the view, typically from a nib.
        isfirstTimeTransform = true
        
        iCarouselView.delegate = self
        iCarouselView.dataSource = self
        
        
        iCarouselView.type = .coverFlow
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        
        
        iCarouselView.reloadData()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.configure(str: "Joe")
        slide1.playVideo(urlStr: "https://media.giphy.com/media/l0ExncehJzexFpRHq/giphy.mp4")
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.configure(str: "Man On A Ledge")

        slide2.playVideo(urlStr: "https://media.giphy.com/media/26gsqQxPQXHBiBEUU/giphy.mp4")
//        slide2.labelTitle.text = "Man On A Ledge"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.configure(str: "The Hunted")

        slide3.playVideo(urlStr: "https://media.giphy.com/media/oqLgjAahmDPvG/giphy.mp4")
//        slide3.labelTitle.text = "The Hunted"
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.configure(str: "Igor")

        slide4.playVideo(urlStr: "https://media.giphy.com/media/d1E1szXDsHUs3WvK/giphy.mp4")
//        slide4.labelTitle.text = "Igor"
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.configure(str: "Teeth")

        slide5.playVideo(urlStr: "https://media.giphy.com/media/OiJjUsdAb11aE/giphy.mp4")
//        slide5.labelTitle.text = "Teeth"
        
        let slide6:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.configure(str: "The Town That Dreaded Sundown")

        slide6.playVideo(urlStr: "https://media.giphy.com/media/4My4Bdf4cakLu/giphy.mp4")
//        slide6.labelTitle.text = "The Town That Dreaded Sundown"
        
        
        return [slide1, slide2, slide3, slide4, slide5, slide6]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(slides.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(slides[i])
        }
        
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        self.scrollView.setContentOffset(CGPoint(x: scrollView.frame.width * CGFloat(iCarouselView.currentItemIndex), y: 0), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = self.scrollView.contentOffset.x
        let offset = x / self.scrollView.frame.width
        
        if offset == 0{
            iCarouselView.scrollToItem(at: 0, duration: 0)
        } else if offset == 1 {
            iCarouselView.scrollToItem(at: 1, duration: 0)
        } else if offset == 2{
            iCarouselView.scrollToItem(at: 2, duration: 0)
        } else if offset == 3{
            iCarouselView.scrollToItem(at: 3, duration: 0)
        } else if offset == 4{
            iCarouselView.scrollToItem(at: 4, duration: 0)
        } else if offset == 5{
            iCarouselView.scrollToItem(at: 5, duration: 0)
        }
    }
    
}

extension ViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 300))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        
        imageView.image = images[index]
        return imageView
    }
    
    func configure(){
        //        scrollView.snp.makeConstraints { (make) in
        //            make.top.equalToSuperview().inset(10)
        //            make.left.equalToSuperview().inset(10)
        //            make.right.equalToSuperview().inset(10)
        //            make.height.equalTo(250)
        //
        //        }
        iCarouselView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(30)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(10)
            make.height.equalTo(128)
            
        }
        
        
        
    }
    
    
    
}
