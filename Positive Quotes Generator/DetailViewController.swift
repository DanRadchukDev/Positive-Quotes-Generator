//
//  DetailViewController.swift
//  Positive Quotes Generator
//
//  Created by Dan Radchuk on 2/6/23.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBAction func back(){
        
        dismiss(animated: true)
        
    }
    
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainView") as! ViewController
        vc.completionHandler = { text in
            self.label.text = text
        }
        // Do any additional setup after loading the view.
    }
    

}
