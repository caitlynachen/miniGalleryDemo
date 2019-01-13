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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var collectionView: UICollectionView?

//    @IBOutlet weak var collectionView: UICollectionView!
    //    @IBOutlet weak var iCarouselView: iCarousel!
    
    var iCarouselView: iCarousel!
    
    var movieNames = ["Joe", "Man On a Ledge", "The Hunted", "Igor", "Teeth", "The Town That Dreaded Sundown"]
    var urlStr = ["https://media.giphy.com/media/l0ExncehJzexFpRHq/giphy.mp4",
                  "https://media.giphy.com/media/26gsqQxPQXHBiBEUU/giphy.mp4",
                  "https://media.giphy.com/media/oqLgjAahmDPvG/giphy.mp4",
                  "https://media.giphy.com/media/d1E1szXDsHUs3WvK/giphy.mp4",
                  "https://media.giphy.com/media/OiJjUsdAb11aE/giphy.mp4",
                  "https://media.giphy.com/media/4My4Bdf4cakLu/giphy.mp4"]
    
    
    private var isfirstTimeTransform = false
    var images: [UIImage] = [#imageLiteral(resourceName: "image"), #imageLiteral(resourceName: "animal_number_2"), #imageLiteral(resourceName: "animal_number_3"), #imageLiteral(resourceName: "animal_number_4"), #imageLiteral(resourceName: "animal_number_5"),#imageLiteral(resourceName: "animal_number_6 (1)")]
    
    //    var scrollView = UIScrollView(frame: .zero)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Slide
        
        cell.playVideo(urlStr: urlStr[indexPath.row])
        cell.labelTitle.text = movieNames[indexPath.row]
        
        return cell
    }
    
    /*
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
    */

    
    func carouselDidScroll(_ carousel: iCarousel) {
        self.collectionView!.setContentOffset(CGPoint(x: collectionView!.frame.width * CGFloat(iCarouselView.currentItemIndex), y: 0), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = self.collectionView!.contentOffset.x
        let offset = x / self.collectionView!.frame.width
        
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
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 300)
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
        iCarouselView = iCarousel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        self.view.addSubview(iCarouselView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        flowLayout.itemSize = CGSize(width: 375, height: 300)
        flowLayout.scrollDirection = .horizontal
        
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
        collectionView?.backgroundColor = .white
        collectionView!.isPagingEnabled = true

        collectionView?.showsHorizontalScrollIndicator = false
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView?.register(Slide.self, forCellWithReuseIdentifier: "cell")

        
        self.view.addSubview(collectionView!)

        isfirstTimeTransform = true
        
        iCarouselView.delegate = self
        iCarouselView.dataSource = self
        
        
        iCarouselView.type = .coverFlow
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        
        
        iCarouselView.reloadData()
        
        collectionView!.reloadData()
        
        collectionView!.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
            
        }
        
        iCarouselView.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView!.snp.bottom).offset(100)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(10)
            make.height.equalTo(128)
            
        }
        
        
        
    }
    
    
    
}
