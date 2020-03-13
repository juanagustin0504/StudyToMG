//
//  FillOutReceiptViewController.swift
//  StudyToMG
//
//  Created by Webcash on 2020/03/13.
//  Copyright © 2020 Moonift. All rights reserved.
//

import UIKit

class FillOutReceiptViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    

}

//MARK: - extension -
//MARK: - delegate -
extension FillOutReceiptViewController : UITableViewDelegate {
    
}

//MARK: - dataSource -
extension FillOutReceiptViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

