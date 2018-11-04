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
    @IBOutlet var total_price: UILabel!
    var spot:parking_spot?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed("result_view", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
