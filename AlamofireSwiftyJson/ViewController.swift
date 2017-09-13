//
//  ViewController.swift
//  AlamofireSwiftyJson
//
//  Created by Jorge MR on 12/09/17.
//  Copyright © 2017 Jorge MR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Using AlamoFire
        Alamofire.request("http://blog.lascomidasdecu.com/wp-json/wp/v2/posts/14").responseJSON {
            response in
            /*print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            */
            if let value = response.result.value {
                //Using SwiftyJSON
                let json = JSON(value)
                //print("JSON: \(json)") // serialized json response
                print("REAL POST:: \(json["excerpt"]["rendered"])")
                print("POST WITH IMAGES:: \(json["content"]["rendered"])")
            }
            
           /* 
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
           */
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

