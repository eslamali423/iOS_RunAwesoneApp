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
        button.backgroundColor =   #colorLiteral(red: 1, green: 0.808304131, blue: 0, alpha: 1)
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
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        view.addSubview(topLabel)
        view.addSubview(mapView)
        view.addSubview(runButton)
    }
    //MARK:- Configure Constraints
    private func configureConstraint(){
        NSLayoutConstraint.activate([
        // Title Lable Constraints
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // mapView Constraints
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topLabel.bottomAnchor,constant: 8),
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
