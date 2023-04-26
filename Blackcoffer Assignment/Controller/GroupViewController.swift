//
//  GroupViewController.swift
//  Blackcoffer Assignment
//
//  Created by akshay.somkuwar on 25/04/23.
//

import UIKit

class GroupViewController: UIViewController {
    
    // MARK: Properties
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"

        return searchBar
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .systemTeal
        return button
    }()
    
    private var locationImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "locationImage")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Need your location"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sorry!! Location permission is mandatory, Please allow location permission!"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private let allowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Allow", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 12/255, green: 81/255, blue: 84/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plusButton"), for: .normal)
        button.layer.cornerRadius = 30
        button.tintColor = .systemTeal
        
        return button
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        
        view.addSubview(searchBar)
        view.addSubview(filterButton)
        view.addSubview(locationImage)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(allowButton)
        view.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            
            // searchBar constraints
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            // filterButton constraints
            filterButton.topAnchor.constraint(equalTo: searchBar.topAnchor, constant: 0),
            filterButton.leftAnchor.constraint(equalTo: searchBar.rightAnchor, constant: 10),
            filterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            filterButton.heightAnchor.constraint(equalToConstant: 40),
            filterButton.widthAnchor.constraint(equalToConstant: 30),
            
            // locationImage constraints
            locationImage.heightAnchor.constraint(equalToConstant: 90),
            locationImage.widthAnchor.constraint(equalToConstant: 90),
            locationImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            locationImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            
            // titleLabel constraints
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            // subTitleLabel constraints
            subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            subTitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 0),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            // allowButton constraints
            allowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            allowButton.heightAnchor.constraint(equalToConstant: 40),
            allowButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            allowButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            
            // plusButton constraints
            plusButton.heightAnchor.constraint(equalToConstant: 60),
            plusButton.widthAnchor.constraint(equalToConstant: 60),
            plusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            plusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}
