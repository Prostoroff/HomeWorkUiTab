//
//  AlarmViewController.swift
//  HomeWorkUiTab
//
//  Created by Иван Осипов on 15/8/22.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingButton.layer.cornerRadius = settingButton.bounds.height * 0.5
        settingButton.clipsToBounds = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsFocus = false
        
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
}

extension AlarmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AlarmTableViewCell
        
        return cell
    }
}

extension AlarmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

