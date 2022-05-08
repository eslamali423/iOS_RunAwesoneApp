//
//  MyRunsViewController.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import UIKit

class RunHistoryViewController: BaseViewController {

    //MARK:- Vars
  
    
    private let titleView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.alpha = 0.7
        return view
    }()
    
    
    private let topLabel : UILabel = {
        let label = UILabel()
        label.text = "History"
        label.alpha = 1
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
    
        
        return label
    }()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        table.backgroundColor = .clear
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.separatorColor = .white
        
        
        return table
        
        
    }()
    
    
  
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setLayout()
        configureConstraints()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK:- Set Layouts
    private func setLayout(){
        titleView.addSubview(topLabel)
        view.addSubview(titleView)
        view.addSubview(tableView)
    
    }
    //MARK:- Configure Constraints
    private func configureConstraints(){
        
        NSLayoutConstraint.activate([
        
            // Title Lable Constraints
            titleView.topAnchor.constraint(equalTo: view.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 100),
            
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: titleView.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            
            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    


}

//MARK:- Extension For tableView
extension RunHistoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Run.getAllRuns()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell,
              let run =  Run.getAllRuns()?[indexPath.row] else {
            return UITableViewCell()
        }
       
        cell.configureCell(model: run)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        guard let run = Run.getAllRuns()?[indexPath.row] else {
            return
        }
        
        let vc = RunViewController(run: run)
        present(vc, animated: true, completion: nil)
//        
//        print(run.distance.metersToMiles().toString(palces: 2))
    }
   
}
