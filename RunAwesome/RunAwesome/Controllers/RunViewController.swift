//
//  RunViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 03/05/2022.
//

import UIKit
import MapKit

class RunViewController: BaseViewController {
    
    //MARK:- Vars
    
    var run : Run
    
    private var map : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.alpha = 0.6
        //map.delegate = self
        return map
    }()
    
    
    private let topHandelBackground : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        return view
    }()
    
    private let topHandel : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    
    
    init(run : Run) {
        super.init(nibName: nil, bundle: nil)
        self.run = run
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        configureConstraints()
        
    }
    
    //MARK:- layout and constraints
    private func setupLayouts() {
        view.addSubview(map)
        view.addSubview(topHandelBackground)
        topHandelBackground.addSubview(topHandel)
    }
    private func  configureConstraints() {
        
        NSLayoutConstraint.activate([
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topHandelBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topHandelBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topHandelBackground.topAnchor.constraint(equalTo: view.topAnchor),
            topHandelBackground.heightAnchor.constraint(equalToConstant: 20),
            
            topHandel.widthAnchor.constraint(equalToConstant: 100 ),
            topHandel.heightAnchor.constraint(equalToConstant: 6),
            topHandel.centerYAnchor.constraint(equalTo: topHandelBackground.centerYAnchor),
            topHandel.centerXAnchor.constraint(equalTo: topHandelBackground.centerXAnchor),
            
            
            
            
            
            
            
            
        
        ])
        
        
    }
    
}
