//
//  ResultsController.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit
import WARangeSlider

class ResultsController: UIViewController {

    @IBOutlet weak var parking_lot: UIButton!
    @IBOutlet weak var private_parking: UIButton!
    @IBOutlet weak var list_view: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var slider: RangeSlider!
    @IBOutlet weak var time_range_text: UILabel!
    
    var array  = [parking_spot]()
    var min_time = Int()
    var max_time = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for park in parking_spot.MOCK_DATA {
            array.append(park)
        }
        
        
        display_spots()
        
        let tap_cancel = UITapGestureRecognizer(target: self, action: #selector(result_selected(sender:)))
        tap_cancel.cancelsTouchesInView = false
        self.scroll_view.addGestureRecognizer(tap_cancel)
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
            if private_parking.isSelected && spot.type == 2 {
                let newview = result_view(frame: CGRect(x: 0, y: (h+10)*(i), width: Int(w), height: h))
                //let a = newview.time_distance
                
                newview.type_icon.image = UIImage(named: "house")
                newview.time_distance.text = "5 min"
                newview.total_price.text = "U$" + String(format: "%.2f", spot.min_price_hour)
                
                // Add Gesture Recognizer
                let tap = UITapGestureRecognizer(target: self, action: #selector(result_selected(sender:)))
                newview.addGestureRecognizer(tap)
                newview.isUserInteractionEnabled = true
                
                self.list_view.addSubview(newview)
                i = i+1
            }
                
            else if parking_lot.isSelected && spot.type == 1 {
                let newview = result_view(frame: CGRect(x: 0, y: (h+10)*(i), width: Int(w), height: h))
                
                newview.type_icon.image = UIImage(named: "parking_lot")
                newview.time_distance.text = "5 min"
                newview.total_price.text = "U$" + String(format: "%.2f", spot.min_price_hour)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(result_selected(sender:)))
                newview.addGestureRecognizer(tap)
                newview.isUserInteractionEnabled = true
                
                self.list_view.addSubview(newview)
                
                i = i+1
            }
        }
    }
    
    
    @objc func result_selected(sender: UITapGestureRecognizer) {
        print("clicked")
        self.performSegue(withIdentifier: "result_segue", sender: nil)
    }

    @IBAction func range_slider_changed(_ sender: Any) {
//        self.slider.lowerValue = Double(Int(self.slider.lowerValue))
//        self.slider.upperValue = Double(Int(self.slider.upperValue))
        self.min_time = 100*Int(floor(self.slider.lowerValue/2)) + 30*(Int(self.slider.lowerValue) % 2)
        self.max_time = 100*Int(floor(self.slider.upperValue/2)) + 30*(Int(self.slider.upperValue) % 2)
        self.time_range_text.text = format_time(num: self.min_time) + " - " + format_time(num: self.max_time)
    }
    
    func format_time (num: Int) -> String {
        let str1 = String(Int(floor(Double(num)/100)))
        var str2 = String(num % 100)
        if str2 == "0" {
            str2 = "00"
        }
        return str1 + ":" + str2
    }
}
