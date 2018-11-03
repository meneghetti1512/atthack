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
    @IBOutlet weak var list_view: UIView!
    
    var array = [1, 2, 3, 4, 5, 6]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let w = self.list_view.frame.width
        
        for i in array {
            let newview = result_view(frame: CGRect(x: 0, y: 110*i, width: Int(w), height: 100))
            newview.backgroundColor = .red
            //let a = newview.time_distance
            newview.type_icon.image = UIImage(named: "house")
            self.list_view.addSubview(newview)

            
        }
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
