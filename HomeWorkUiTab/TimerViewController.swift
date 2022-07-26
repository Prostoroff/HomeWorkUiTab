//
//  TimerViewController.swift
//  HomeWorkUiTab
//
//  Created by Иван Осипов on 23/7/22.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerPicker: UIPickerView!
    
    @IBOutlet weak var startButtonView: UIView!
    @IBOutlet weak var stopButtonView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var hour: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.timerPicker.dataSource = self
        self.timerPicker.delegate = self
        
        startButtonView.layer.cornerRadius = startButtonView.bounds.size.width * 0.5
        startButtonView.clipsToBounds = true
        
        stopButtonView.layer.cornerRadius = stopButtonView.bounds.size.width * 0.5
        stopButtonView.clipsToBounds = true
        
        startButton.layer.cornerRadius = startButton.bounds.size.width * 0.5
        startButton.clipsToBounds = true
        startButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        startButton.layer.borderWidth = 2
        
        stopButton.layer.cornerRadius = stopButton.bounds.size.width * 0.5
        stopButton.clipsToBounds = true
        stopButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        stopButton.layer.borderWidth = 2
        
        labelPicker()
        
    }
    
    private func labelPicker() {
        let hourLabel = UILabel()
        hourLabel.text = "ч"
        hourLabel.font = UIFont.boldSystemFont(ofSize: 16)
        hourLabel.sizeToFit()
        hourLabel.frame = CGRect(x: timerPicker.frame.width * 0.23,
                                 y: timerPicker.frame.height * 0.5 - (hourLabel.frame.height / 2),
                                 width: hourLabel.frame.width,
                                 height: hourLabel.frame.height)
        timerPicker.addSubview(hourLabel)
        
        let minLabel = UILabel()
        minLabel.text = "мин"
        minLabel.font = UIFont.boldSystemFont(ofSize: 16)
        minLabel.sizeToFit()
        minLabel.frame = CGRect(x: timerPicker.frame.width * 0.57,
                                 y: timerPicker.frame.height * 0.5 - (minLabel.frame.height / 2),
                                 width: minLabel.frame.width,
                                 height: minLabel.frame.height)
        timerPicker.addSubview(minLabel)
        
        let secLabel = UILabel()
        secLabel.text = "с"
        secLabel.font = UIFont.boldSystemFont(ofSize: 16)
        secLabel.sizeToFit()
        secLabel.frame = CGRect(x: timerPicker.frame.width * 0.90,
                                 y: timerPicker.frame.height * 0.5 - (secLabel.frame.height / 2),
                                 width: secLabel.frame.width,
                                 height: secLabel.frame.height)
        timerPicker.addSubview(secLabel)
    }
    
}

extension TimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
            return 60
        default:
            return 0
        }
    }
    
}

extension TimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return timerPicker.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        case 2:
            return "\(row)"
        default:
            return ""
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break
        }
    }
    
}
