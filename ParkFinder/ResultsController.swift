//
//  ResultsController.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {

    @IBOutlet weak var parking_lot: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func parking_lot_button(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
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
