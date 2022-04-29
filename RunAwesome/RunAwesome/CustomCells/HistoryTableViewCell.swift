//
//  HistoryTableViewCell.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 27/04/2022.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    
    
    //MARK:- Vars
    static let identifier = "HistoryTableViewCell"
    
    private let milesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.textColor = .label
        label.font = .systemFont(ofSize: 24,weight: .bold)
        
        return label
    }()
    
    private let timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00.00"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18,weight: .regular)
        
        return label
    }()
    private let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00.00"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18,weight: .regular)
        
        return label
    }()
    
    
    var totalMiles : Double = 0.0 {
        didSet {
            milesLabel.text = String(format: "%0.1f", totalMiles)
        }
    }
    
    var totalTime : String = "00:02:12" {
        didSet {
            timeLabel.text = totalTime
            layoutIfNeeded()
        }
    }
    
    var entryDate : String = "28:04:2022" {
        didSet {
            dateLabel.text = entryDate
            layoutIfNeeded()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        configureConstraint()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = UIColor.black.withAlphaComponent(0.1)
        contentView.addSubview(milesLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(dateLabel)
    }
    
    func configureConstraint(){
        NSLayoutConstraint.activate([
        
            milesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            milesLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            
            
           timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            timeLabel.topAnchor.constraint(equalTo: milesLabel.bottomAnchor,constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -16),

            
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            dateLabel.centerYAnchor.constraint(equalTo: milesLabel.centerYAnchor)

        
        
        ])
    }
    
    
    
    
    
}
