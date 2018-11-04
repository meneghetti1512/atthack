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
    @IBOutlet weak var private_parking: UIButton!
    @IBOutlet weak var list_view: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    
    var array  = [parking_spot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for park in parking_spot.MOCK_DATA {
            array.append(park)
        }
        
        display_spots()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func parking_lot_button(_ sender: UIButton) {
        for v in self.list_view.subviews {
            v.removeFromSuperview()
        }
        self.array.removeAll()
        
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
        display_spots()
        self.viewDidLoad()
    }
    
    func display_spots() {
        let h = 140
        let w = self.list_view.frame.width
        self.scroll_view.contentSize.height = CGFloat((h + 10)*array.count)
        self.scroll_view.updateConstraints()
        self.list_view.updateConstraints()
        
        var i = 0
        
        for spot in array {
            if private_parking.isSelected && spot.type == 1 {
                let newview = result_view(frame: CGRect(x: 0, y: (h+10)*(i), width: Int(w), height: h))
                //let a = newview.time_distance
                
                newview.type_icon.image = UIImage(named: "house")
                newview.time_distance.text = "5 min"
                newview.total_price.text = "U$" + String(format: "%.2f", spot.min_price_hour)
                
                self.list_view.addSubview(newview)
                i = i+1
            }
                
            else if parking_lot.isSelected && spot.type == 2 {
                let newview = result_view(frame: CGRect(x: 0, y: (h+10)*(i), width: Int(w), height: h))
                //let a = newview.time_distance
                
                newview.type_icon.image = UIImage(named: "parking_lot")
                newview.time_distance.text = "5 min"
                newview.total_price.text = "U$" + String(format: "%.2f", spot.min_price_hour)
                
                self.list_view.addSubview(newview)
                i = i+1
            }
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
