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
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        
        /*let headers = [
            "X-RapidAPI-Key": "25cfa9b20emsh7da0403d3812e35p16c5b4jsn4a9324c71aa7",
            "X-RapidAPI-Host": "webknox-jokes.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://webknox-jokes.p.rapidapi.com/jokes/random?minRating=8&maxLength=100")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers*/

        
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
                
                /* let Example = "{"id":4160,"joke":"Chuck Norris can compare apples to oranges."}"*/
               struct JokeArr:Codable{
                    let a: String
                    let h: String
                    let q: String
                }
                if let data = data{
                           do{
                               let tasks = try JSONDecoder().decode([JokeArr].self, from: data)
                               tasks.forEach{ i in
                                   DispatchQueue.main.async {
                                       self.label.text = i.q}
                               }
                           }catch{
                               print(error)
                           }
                       }
                }
                
                /*if let data = data{
                 let json = try? JSONSerialization.jsonObject(with:data,options: [])
                 print(json)
                 if let dictionary = json as? [String:Any] {
                 if let result = dictionary["q"] as? String {
                 // access individual value in di[]ctionary
                 print(result)
                 DispatchQueue.main.async {
                 self.label.text = result
                 }}}}*/
            
        })
        
        dataTask.resume()
        
        
        /*let randoNumber = Int.random(in: 0...(arrayOfQuotes.count-1))
        label.text = arrayOfQuotes[randoNumber]*/
        
    }
    
}


