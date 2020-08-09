//
//  AccountInfoViewController.swift
//  Grrind Fitness
//
//  Created by Simranjeet Aulakh on 22/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var AccountInfoTableView: UITableView!
    
    //MARK:- Variables
    let viewObj = AccountInfoVM()
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AccountInfoTableView.delegate = self
        AccountInfoTableView.dataSource = self
        
        AccountInfoTableView.tableFooterView = UIView()
    }

    //MARK:- IBActions
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.popVC()
    }
    
    
}
