//
//  FirstViewController.swift
//  Latihan-2
//
//  Created by MacBook Pro on 20/03/23.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var onboardingList: [Onboarding] = []
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadOnboardingList()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {
            [weak self] _ in
            guard let `self` = self else {return}
            
            let currentPage = Int(self.collectionView.contentOffset.x / self.collectionView.frame.width)
            let nextPage = currentPage + 1 >= self.onboardingList.count ? 0 : currentPage + 1
            let indexPath = IndexPath(item: nextPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage = nextPage
        })
    }
    
    deinit {
        timer?.invalidate()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        showCreatePinViewController()
    }
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboarding_cell", for: indexPath) as! OnboardingViewCell
        
        let onboarding = onboardingList[indexPath.item]
        cell.imageView.image = UIImage(named: onboarding.image)
        cell.titleLabel.text = onboarding.title
        cell.subtitleLabel.text = onboarding.subtitle
        
        return cell
    }
    
    // MARKL - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 500)
    }
    // MARK: UICollectionViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
    
    // MARK: - Action
    
    @IBAction func pageControlValueChanged(_ sender: Any) {
        let page = pageControl.currentPage
        collectionView.scrollToItem(at: IndexPath(item: page, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    
    // MARK: - Helpers
    
    func loadOnboardingList() {
        onboardingList = [
            Onboarding(image: "img_onboarding1", title: "Gain total control of your money", subtitle: "Become your own money manager and make every cent count"),
            Onboarding(image: "img_onboarding2", title: "Know where your money goes", subtitle: "Track your transaction easily, with categories and financial report"),
            Onboarding(image: "img_onboarding3", title: "Planning ahead", subtitle: "Setup your budget for each category so you in control")
        ]
        pageControl.numberOfPages = onboardingList.count
    }
    
}
