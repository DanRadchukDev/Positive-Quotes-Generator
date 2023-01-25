//
//  ViewController.swift
//  Positive Quotes Generator
//
//  Created by Dan Radchuk on 1/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    let arrayOfQuotes = ["Seize the moment. Remember all those women on the ‘Titanic’ who waved off the dessert cart",
                         "People often say that motivation doesn’t last. Well, neither does bathing—that’s why we recommend it daily",
    "If you’re going through hell, keep going",
    "My advice is not to wait to be struck by an idea. If you’re a writer, you sit down and damn well decide to have an idea. That’s the way to get an idea",
    "Do or do not. There is no try",
    "Creativity is a wild mind and a disciplined eye",
    "You can’t wait for inspiration. You have to go after it with a club",
    "A peacock that rests on his tail feathers is just another turkey"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let randoNumber = Int.random(in: 0...(arrayOfQuotes.count-1))
        label.text = arrayOfQuotes[randoNumber]
        
    }
    
}

