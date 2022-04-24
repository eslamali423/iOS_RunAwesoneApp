//
//  BaseViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import UIKit

class BaseViewController: UIViewController {

    private lazy var backgroundLayer : GradientView = {
        
        let view =  GradientView(colors: [#colorLiteral(red: 1, green: 0.9125576615, blue: 0.7229182124, alpha: 1),#colorLiteral(red: 1, green: 0.788628161, blue: 0.6327922344, alpha: 1),#colorLiteral(red: 1, green: 0.7911657095, blue: 0.5118403435, alpha: 1), #colorLiteral(red: 1, green: 0.8234727979, blue: 0.3423871994, alpha: 1)])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupViews()
    configureConstraints()
        
    }
    
    private func setupViews(){
        
        view.addSubview(backgroundLayer)
    }
    
    private func configureConstraints(){
       
        NSLayoutConstraint.activate([
        
            backgroundLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundLayer.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        
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
