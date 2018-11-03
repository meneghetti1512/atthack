//
//  result_view.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class result_view: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var type_icon: UIImageView!
    @IBOutlet weak var time_distance: UILabel!
    @IBOutlet weak var total_price: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.view = (Bundle.main.loadNibNamed("result_view", owner: self, options: nil)?.first as! UIView)
        self.addSubview(self.view)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
