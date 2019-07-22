//
//  ViewController.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fetchTable = ListaViewController().table
    

        let url = URL(string: "https://demo2205443.mockable.io/locations-list")!
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            checkInternet()
            setBackground()
            
        }
    
    func checkInternet() {
        
        if ReachabilityTest.isConnectedToNetwork() == false{
            if let path = Bundle.main.path(forResource: "location-list", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    if let podaci = try? decoder.decode(Model.self, from: data) {
                        model = podaci
                        
                       
                     
                    }
                } catch {
                    print("Not successful")
                }
            }
            
            let alert = UIAlertController(title: "No Internet Connection", message: "Check Internt Connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
                
            
        } else {
            getData()
        }
        
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

