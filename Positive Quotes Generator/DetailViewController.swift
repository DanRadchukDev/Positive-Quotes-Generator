//
//  DetailViewController.swift
//  Positive Quotes Generator
//
//  Created by Dan Radchuk on 2/6/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet var label1: UILabel!
    
    var joke: Joke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = joke?.q
        label.text = joke?.a
    }
    

}
