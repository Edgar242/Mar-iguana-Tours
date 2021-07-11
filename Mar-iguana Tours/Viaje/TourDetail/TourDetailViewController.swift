//
//  TourDetailViewController.swift
//  Mar-iguana Tours
//
//  Created by Diana Morales on 27/06/21.
//

import UIKit
import MaterialComponents.MaterialButtons

class TourDetailViewController:UITabBarController{
    
    var sliderCollectionView:UICollectionView!
    var pageView: UIPageControl!
    var arrImagesTour = [UIImage]()
    var timer = Timer()
    var counter = 0
    
    //variable contains info about selected tour in table view
    var tourSelected:Tour?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 250)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let lframe = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
        sliderCollectionView = UICollectionView(frame: lframe, collectionViewLayout: layout)
        sliderCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        sliderCollectionView?.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#39985E")
        sliderCollectionView?.dataSource = self
        sliderCollectionView?.delegate = self
        
        view.addSubview(sliderCollectionView ?? UICollectionView())

        //Get images and fill image array
        let imagesTour:[String] = tourSelected?.images ?? [""]
        for image in imagesTour {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            arrImagesTour.append(UIImage(data: data!)!)
        }
        
        //Page control
        let dframe = CGRect(x: 20, y: 220, width: sliderCollectionView.frame.width - 40, height: 20)
        pageView = UIPageControl(frame: dframe)
        
        view.addSubview(pageView)
        pageView.numberOfPages = arrImagesTour.count
        pageView.currentPage = 0
        
        //Change image
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        //Tab bar item font size
        let fontAtt = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.bold )]
        UITabBarItem.appearance().setTitleTextAttributes(fontAtt, for: .normal)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Pass info to view controller in the tabbar
        let infoTourController = self.viewControllers![0] as! TourInfoViewController
        let itineraryController = self.viewControllers![1] as! TourItineraryViewController
        
        infoTourController.tourSelected = tourSelected
        itineraryController.itinerary = tourSelected!.itinerary
        
        setFloatingButton()
        
        //Share button
        let btnShare = UIBarButtonItem(barButtonSystemItem:.action, target: self, action: #selector(btnShare_clicked))
        
        self.navigationItem.rightBarButtonItem = btnShare
    }
    
    @objc func btnShare_clicked(){
        let textToShare = tourSelected?.title

        if let myWebsite = NSURL(string:tourSelected!.urlInfoWeb) {
            let objectsToShare: [Any] = [textToShare!, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    //Tab bar item
    override func viewDidLayoutSubviews() {
        tabBar.frame = CGRect(x: 0, y: 250, width: tabBar.frame.size.width, height:50)
        tabBar.tintColor = ColorUtils.hexStringToUIColor(hex: "#39985E")
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   @objc func changeImage() {
        if counter < arrImagesTour.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
    }
    
    func setFloatingButton() {
        let floatingButton = MDCFloatingButton()
        let image = UIImage(systemName: "cart.fill.badge.plus")
        floatingButton.sizeToFit()
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.setImage(image, for: .normal)
        floatingButton.setImageTintColor(.white, for: .normal)
        floatingButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#39985E")
        floatingButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(floatingButton)
        view.addConstraint(NSLayoutConstraint(item: floatingButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -85))
        view.addConstraint(NSLayoutConstraint(item: floatingButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -32))
    }
        
    @objc func tap(_ sender: Any) {
        performSegue(withIdentifier: "steperSegue", sender: "")
    }
        
    //Prepare segue to pass selected tour info to DetailTourControllerView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "steperSegue") {
            let td = segue.destination as! ViewControllerBookStep
            td.tourSelected = tourSelected
        }
    }
}

extension TourDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImagesTour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //Add imageView to cell
        let imageView = UIImageView(image: arrImagesTour[indexPath.row])
        cell.backgroundView  = imageView
        return cell
    }
}

