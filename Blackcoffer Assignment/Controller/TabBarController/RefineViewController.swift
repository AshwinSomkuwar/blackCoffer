//
//  RefineViewController.swift
//  Blackcoffer Assignment
//
//  Created by akshay.somkuwar on 25/04/23.
//

import UIKit

class RefineViewController: UIViewController {
        
    // MARK: Properties
    @IBOutlet weak var bellBar: UIBarButtonItem!
    @IBOutlet weak var menuBar: UIBarButtonItem!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        self.menuBar.tintColor = .white
        self.bellBar.tintColor = .white
    }
}
