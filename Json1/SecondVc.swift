//
//  SecondVc.swift
//  Json1
//
//  Created by DEEP KUMAR on 26/06/19.
//  Copyright © 2019 DEEP KUMAR. All rights reserved.
//

import UIKit

class SecondVc: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var Country: UILabel!
    
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subregion: UILabel!
    
    @IBOutlet weak var alpha3code: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text=name1
        Country.text=country1
        region.text=region1
        subregion.text=subregion1
        alpha3code.text=alpha3code1
        

        // Do any additional setup after loading the view.
    }
var name1=""
var country1=""
var region1=""
var subregion1=""
var alpha3code1=""

}
