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
    @IBOutlet weak var scroll_view: UIScrollView!
    
    
    var array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let h = 140
        let w = self.list_view.frame.width
        self.scroll_view.contentSize.height = CGFloat((h + 10)*array.count)
        self.scroll_view.updateConstraints()
        self.list_view.updateConstraints()
        
        for i in array {
            let newview = result_view(frame: CGRect(x: 0, y: (h+10)*(i-1), width: Int(w), height: h))
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
