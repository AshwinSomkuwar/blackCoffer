//
//  ExploreViewController.swift
//  Blackcoffer Assignment
//
//  Created by akshay.somkuwar on 25/04/23.
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var menuBar: UIBarButtonItem!
    @IBOutlet weak var bellBar: UIBarButtonItem!

    // Instances of Segmented Controls
    let groupVC = GroupViewController()
    let workVC = WorkViewController()
    let shopVC = ShopViewController()
        
    private var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.backgroundColor = UIColor(red: 12/255, green: 81/255, blue: 84/255, alpha: 1)
        
        return navBar
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Howdy Ashwin Somkuwar !!"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private var locationLogoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "locationLogo")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        
        return image
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "location"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        
        return label
    }()
    
    private var barView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 12/255, green: 81/255, blue: 84/255, alpha: 0.4)
        
        return view
    }()
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 12/255, green: 81/255, blue: 84/255, alpha: 0.6)
        
        return view
    }()
    
    private var segmentedControl: UISegmentedControl = {
        let segControl = UISegmentedControl(items: ["Group", "Work", "Shop"])
        segControl.translatesAutoresizingMaskIntoConstraints = false
        segControl.selectedSegmentIndex = 0
        segControl.backgroundColor = UIColor(red: 12/255, green: 81/255, blue: 84/255, alpha: 0.6)
        segControl.setImage(UIImage(named: "group"), forSegmentAt: 0)
        segControl.setImage(UIImage(named: "work"), forSegmentAt: 1)
        segControl.setImage(UIImage(named: "shop"), forSegmentAt: 2)
        segControl.addTarget(self, action: #selector(didTapSegment(segment: )), for: .valueChanged)
        
        return segControl
    }()
        
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        
        self.menuBar.tintColor = .white
        self.bellBar.tintColor = .white
        
        addChild(groupVC)
        addChild(workVC)
        addChild(shopVC)
        
        self.view.addSubview(groupVC.view)
        self.view.addSubview(workVC.view)
        self.view.addSubview(shopVC.view)
        
        groupVC.didMove(toParent: self)
        workVC.didMove(toParent: self)
        shopVC.didMove(toParent: self)
        
        groupVC.view.frame = self.view.bounds
        workVC.view.frame = self.view.bounds
        shopVC.view.frame = self.view.bounds
        
        // Initially WorkVC and ShopVC are hidden
        workVC.view.isHidden = true
        shopVC.view.isHidden = true
        
        view.addSubview(navBar)
        navBar.addSubview(titleLabel)
        navBar.addSubview(locationLogoImage)
        navBar.addSubview(subTitleLabel)
        view.addSubview(barView)
        view.addSubview(backgroundView)
        backgroundView.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            
            // navBar constraints
            navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            navBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            navBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11),
            
            // titleLabel constraints
            titleLabel.bottomAnchor.constraint(equalTo: locationLogoImage.topAnchor, constant: -5),
            titleLabel.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 70),
            
            // locationLogoImage constraints
            locationLogoImage.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 70),
            locationLogoImage.heightAnchor.constraint(equalToConstant: 20),
            locationLogoImage.widthAnchor.constraint(equalToConstant: 20),
            
            // subTitleLabel constraints
            subTitleLabel.centerYAnchor.constraint(equalTo: locationLogoImage.centerYAnchor, constant: 0),
            subTitleLabel.leftAnchor.constraint(equalTo: locationLogoImage.rightAnchor, constant: 2),
            subTitleLabel.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -10),
            
            // barView constraints
            barView.heightAnchor.constraint(equalToConstant: 2),
            barView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 0),
            barView.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 0),
            barView.rightAnchor.constraint(equalTo: navBar.rightAnchor, constant: 0),
            
            // backgroundView constraints
            backgroundView.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 0),
            backgroundView.heightAnchor.constraint(equalTo: navBar.heightAnchor, multiplier: 0.4),
            backgroundView.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 0),
            backgroundView.rightAnchor.constraint(equalTo: navBar.rightAnchor, constant: 0),
            
            // segmentedControl constraints
            segmentedControl.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 0),
            segmentedControl.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 0),
            segmentedControl.rightAnchor.constraint(equalTo: navBar.rightAnchor, constant: 0),
            segmentedControl.heightAnchor.constraint(equalTo: navBar.heightAnchor, multiplier: 0.4)
        ])
    }
    
    // MARK: Actions
    @objc func didTapSegment(segment: UISegmentedControl) {
        
        groupVC.view.isHidden = true
        workVC.view.isHidden = true
        shopVC.view.isHidden = true
        
        if segment.selectedSegmentIndex == 0 {
            groupVC.view.isHidden = false
            
        } else if segment.selectedSegmentIndex == 1 {
            workVC.view.isHidden = false
            
        } else  {
            shopVC.view.isHidden = false
        }
    }
}
