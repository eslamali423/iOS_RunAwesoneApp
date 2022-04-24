//
//  HomeViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import UIKit

class HomeViewController: BaseViewController {

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
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureConstraint()
       
    }
    
    private func setupViews(){
        view.addSubview(runButton)
    }
    
    private func configureConstraint(){
        NSLayoutConstraint.activate([
        
            runButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            runButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            runButton.widthAnchor.constraint(equalToConstant: 100),
            runButton.heightAnchor.constraint(equalToConstant: 100)
        
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
