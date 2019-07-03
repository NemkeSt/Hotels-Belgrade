//
//  ListaViewController.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController {

    override func viewDidLoad() {
        setBackground()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var viewLeading: NSLayoutConstraint!
    
    var brojac = 0
    @IBAction func barButton(_ sender: UIBarButtonItem) {
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

extension ListaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model == nil {
            return 0
        } else {
            return (model?.data.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celija = tableView.dequeueReusableCell(withIdentifier: "celija", for: indexPath) as! CellData
        celija.naziv.text = model?.data[indexPath.row].name
        celija.adresa.text = model?.data[indexPath.row].address
        
        return celija
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let polje = model?.data[indexPath.row]
         performSegue(withIdentifier: "detalji", sender: polje)
        
        
      
     
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            if let sender = sender as? Opis {
                destination.detaljniOpis = sender
            }
        }
    }
    
    
}

