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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
