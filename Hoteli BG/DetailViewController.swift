//
//  DetailViewController.swift
//  TNation Zadatak
//
//  Created by Mac on 4/3/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var ime: UILabel!
    @IBOutlet weak var adresa: UILabel!
    @IBOutlet weak var grad: UILabel!
    @IBOutlet weak var opis: UILabel!
    @IBOutlet weak var radnoVreme: UILabel!
    
    
    
    private var detail: Opis!
    
    var detaljniOpis: Opis {
        get {
            return detail
        }
        set {
            detail = newValue
        }
    }
    
  
    
   
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
     ime.text = detaljniOpis.name
     adresa.text = detaljniOpis.address
     grad.text = detaljniOpis.city.rawValue
     adjustLabel()
     radnoVreme.text = detaljniOpis.workingHour.fri.rawValue
        
        
     
    }
    

    
    
    
    
    
    func adjustLabel() {
        opis.frame = CGRect(x: opis.frame.origin.x, y: opis.frame.origin.y, width: opis.frame.width, height: opis.frame.height)
        opis.numberOfLines = 0
        opis.text = detaljniOpis.description
    }
    
    
    
    @IBOutlet weak var viewLeading: NSLayoutConstraint!
    
    var brojac = 0
    @IBAction func barButton(_ sender: Any) {
        brojac += 1
        if brojac == 1 {
            viewLeading.constant = 0
        } else {
            viewLeading.constant = -100
        if brojac == 2 {
            brojac = 0
        }
    }
}

    
    }
