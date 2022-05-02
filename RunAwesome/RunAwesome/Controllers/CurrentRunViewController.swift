//
//  CurrentRunViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 25/04/2022.
//

import UIKit
import CoreLocation
import RealmSwift


class CurrentRunViewController: BaseViewController   {
    
    //MARK:- Vars
    private let topLabel : UILabel = {
        let label = UILabel()
        label.text = "Running..."
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private let distanceLabel : UILabel = {
        let label = UILabel()
        label.text = "0:00"
        label.font = .systemFont(ofSize: 80, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let distanceSubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Miles "
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let distanceStackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    private let timeLabel : UILabel = {
        let label = UILabel()
       label.text = "00:00"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let timeSubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Duration"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    
    
    private let timeStackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let paceLabel : UILabel = {
        let label = UILabel()
       label.text = "00:00"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let paceSubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "avg.Pace"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let paceStackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let detailsStackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 30
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    
    
    private let stopRunButton : UIButton = {
        let button =  UIButton()
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight : .bold)
        
        button.layer.borderWidth = 10.0
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor =   #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 70
        button.layer.shadowRadius = 0.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self, action: #selector(didTapStopButton), for: .touchUpInside)
        return button
    }()
    
    private let cameraButton : UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(systemName: "camera",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight : .bold)
        
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 35
        
        button.translatesAutoresizingMaskIntoConstraints = false
        // button.addTarget(self, action: #selector(didTapRunButton), for: .touchUpInside)
        return button
    }()
    
    private let settingsButton : UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(systemName: "gear",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight : .bold)
        button.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.black.cgColor
        
        button.layer.cornerRadius = 35
        
        button.translatesAutoresizingMaskIntoConstraints = false
        // button.addTarget(self, action: #selector(didTapRunButton), for: .touchUpInside)
        return button
    }()
    
    
    private let buttonsStackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 30
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    private var startLocation : CLLocation!
    private var endLocation : CLLocation!
    
    private var runDistance = 0.0
    private var timeElapsed = 0
    private var pace = 0
    fileprivate var cooredLocation = List<Location>()
    private var timer = Timer()
    
    
    
    private var locationManager = LocationManager()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        cinfigureConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.manager.delegate = self
        startRun()
    }
    
    //MARK:- Setup Layouts
    private func setupLayouts(){
        
        
        distanceStackView.addArrangedSubview(distanceLabel)
        distanceStackView.addArrangedSubview(distanceSubTitleLabel)
        
        timeStackView.addArrangedSubview(timeLabel)
        timeStackView.addArrangedSubview(timeSubTitleLabel)
        
        paceStackView.addArrangedSubview(paceLabel)
        paceStackView.addArrangedSubview(paceSubTitleLabel)
        
        detailsStackView.addArrangedSubview(timeStackView)
        detailsStackView.addArrangedSubview(paceStackView)
        
        buttonsStackView.addArrangedSubview(cameraButton)
        buttonsStackView.addArrangedSubview(stopRunButton)
        buttonsStackView.addArrangedSubview(settingsButton)
        
        
        view.addSubview(topLabel)
        view.addSubview(distanceStackView)
        view.addSubview(detailsStackView)
        view.addSubview(buttonsStackView)
        
        
        
    }
    
    //MARK:- Configure Constraints
    private func cinfigureConstraints(){
        NSLayoutConstraint.activate([
            
            // Title Lable Constraints
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            
//                        distanceStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30),
//                        distanceStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            
            distanceStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30),
            distanceStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            detailsStackView.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 100),
            detailsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Run Button Constraints
            
            stopRunButton.widthAnchor.constraint(equalToConstant: 140),
            stopRunButton.heightAnchor.constraint(equalToConstant: 140),
            
            cameraButton.widthAnchor.constraint(equalToConstant: 70),
            cameraButton.heightAnchor.constraint(equalToConstant: 70),
            
            settingsButton.widthAnchor.constraint(equalToConstant: 70),
            settingsButton.heightAnchor.constraint(equalToConstant: 70),
            
            
            buttonsStackView.topAnchor.constraint(equalTo: detailsStackView.bottomAnchor, constant: 100),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }
    
    
    //MARK:- Start Running Function
    func startRun(){
        locationManager.manager.startUpdatingLocation()
        startTimer()
    }
    
    //MARK:- Stop Running Function
    func stopRuN()  {
        locationManager.manager.stopUpdatingLocation()
        stopTimer()
    }
    
    //MARK:- Timer Functions
    func startTimer() {
        timeLabel.text = timeElapsed.formatTimeString()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        
    }
    
    @objc private func updateTimer(){
        timeElapsed += 1
        timeLabel.text = timeElapsed.formatTimeString()
    }
    
    //MARK:- Pace Function
    private func computePace(seconds : Int, miles: Double) -> String {
     pace = Int(Double(seconds) / miles)
        return pace.formatTimeString()
    }
    
    //MARK:- Stop Running Button Action
    @objc private func didTapStopButton() {
        
        stopRuN()
        Run.addRunToRealmpace(pace: pace, distance: runDistance, duration: timeElapsed, locations: cooredLocation)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
//MARK:- extension for location manager delegate

extension CurrentRunViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else if let location  = locations.last {
           
             runDistance += endLocation.distance(from: location)
           
            let newLocation = Location(lat: Double(endLocation.coordinate.latitude), long: Double(endLocation.coordinate.longitude))
            cooredLocation.insert(newLocation, at: 0)
            
            self.distanceLabel.text = "\(self.runDistance.metersToMiles().toString(palces: 2))"
            
            if timeElapsed > 0 && runDistance > 0.0 {
                paceLabel.text = computePace(seconds: timeElapsed, miles: runDistance.metersToMiles())
            }
            
        }
        endLocation = locations.last
        
    }
    
    
}
