//
//  HomeViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import UIKit
import MapKit

class HomeViewController: BaseViewController {
    
    
    //MARK:- Vars
    private let runButton : UIButton = {
        let button =  UIButton()
        button.setTitle("Start Run ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight : .bold)
        button.layer.borderWidth = 10.0
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor =   #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 50
        button.layer.shadowRadius = 0.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapRunButton), for: .touchUpInside)
        return button
    }()
    
    private let topLabel : UILabel = {
        let label = UILabel()
        label.text = "Run Awesome"
        label.alpha = 1
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let titleView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.alpha = 0.7
        return view
    }()
    
    private let mapView : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.alpha = 0.6
        
        
        return map
    }()
    
    private var locationManager = LocationManager()
    
   
    
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.checkLocationAuthorization()
        setupViews()
        configureConstraint()
        
        mapView.delegate = self
    }
    
    
    //MARK:- Setuo Views
    private func setupViews(){
        view.addSubview(titleView)
      
       
        view.addSubview(mapView)
        view.addSubview(topLabel)
        view.addSubview(runButton)
        
        
    }
    //MARK:- Configure Constraints
    private func configureConstraint(){
        NSLayoutConstraint.activate([
            
       

            
            // Title Lable Constraints
            titleView.topAnchor.constraint(equalTo: view.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 100),
            
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.topAnchor, constant: 8),
          //  topLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            
            // mapView Constraints
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Run Button Constraints
            runButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            runButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            runButton.widthAnchor.constraint(equalToConstant: 100),
            runButton.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    
    //MARK:- Did tap Run Button
    @objc func didTapRunButton () {
        let currentRunVc = CurrentRunViewController()
        present(currentRunVc, animated: true, completion: nil)
        
        
        
    }
}


//MARK:- Extension for MapView Delegate
extension HomeViewController : MKMapViewDelegate {
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}
