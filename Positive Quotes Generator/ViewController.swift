//
//  ViewController.swift
//  Positive Quotes Generator
//
//  Created by Dan Radchuk on 1/24/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var carrentJoke :Joke!
    let arrayOfQuotes = ["Seize the moment. Remember all those women on the ‘Titanic’ who waved off the dessert cart",
                         "People often say that motivation doesn’t last. Well, neither does bathing—that’s why we recommend it daily",
                         "If you’re going through hell, keep going",
                         "My advice is not to wait to be struck by an idea. If you’re a writer, you sit down and damn well decide to have an idea. That’s the way to get an idea",
                         "Do or do not. There is no try",
                         "Creativity is a wild mind and a disciplined eye",
                         "You can’t wait for inspiration. You have to go after it with a club",
                         "A peacock that rests on his tail feathers is just another turkey",
                         "Bla bla bla"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main Title"
        givemeCarrentJoke()
    }
    func givemeCarrentJoke(){
        let request = NSMutableURLRequest(url: NSURL(string: "https://zenquotes.io/api/random")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                if let data = data{
                    do{
                        let joke = try JSONDecoder().decode([Joke].self, from: data)[0]
                        DispatchQueue.main.async {
                            self.label.text = joke.q
                            self.carrentJoke = joke
                        }
                    }catch{
                        print(error)
                    }
                    
                }
            }
            
        })
        
        dataTask.resume()
        /*let randoNumber = Int.random(in: 0...(arrayOfQuotes.count-1))
         label.text = arrayOfQuotes[randoNumber]*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let secondVC = segue.destination as? DetailViewController else {
            return
        }
       /* givemeCarrentJoke()*/
        secondVC.joke = carrentJoke
        
        secondVC.title = carrentJoke.a
        /*   guard let DetVC = segue.destination as? DetailViewController else {return}
         DetVC.newD = i*/
        
        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        givemeCarrentJoke()
        
        
    }
    
    
}
