//
//  ViewController.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        let url = URL(string: "https://demo2205443.mockable.io/locations-list")!
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            getData()
            setBackground()
        }
        
        
        func getData() {
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                
                if let data = data {
                    let decoder = JSONDecoder()
                    if let podaci = try? decoder.decode(Model.self, from: data) {
                        model = podaci
                        
                        
                    }
                }
            }.resume()
        }


    
    @IBOutlet weak var viewLeading: NSLayoutConstraint!
    
    var brojac = 0
    @IBAction func barButton(_ sender: Any) {
        brojac += 1
        if brojac == 1 {
            viewLeading.constant = 0
        } else {
            viewLeading.constant = -100
        }
        if brojac == 2 {
            brojac = 0
        }
        
        
    }
    
    func setBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    

}

