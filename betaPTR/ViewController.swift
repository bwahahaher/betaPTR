//
//  ViewController.swift
//  betaPTR
//
//  Created by UNIFORM on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadIMG()
        let urlString = "https://api.bm-app.com/search"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) {
            data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString)
            }
            
        }
        task.resume()
//            POST /search HTTP/1.1Host: api.bm-app.com
//            BM-ApiKey: a33e0b59-a707-4741-9d71-6a5e99da747dContent-Type: application/json
//            Content-Length: 24
//            {"search": 9024462435
//            }
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var name: UILabel!
    
    @IBAction func qrCodeButton(_ sender: UIButton) {
    }
    
    @IBAction func openPTR(_ sender: UIButton ){
        UIApplication.shared.open(URL(string:"http://www.putin-team.com")! as URL, options: [:], completionHandler: nil)
    }
    @IBOutlet weak var imageV: UIImageView!
    func loadIMG(){
        let API = "https://api.qrserver.com/v1/create-qr-code/?data=89024462435&amp;size=100x100"
        guard let apiURL = URL(string: API) else {
            fatalError("SOme error")
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL){ (data, response, error) in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.imageV.image = UIImage(data: data)
            }
        }
        task.resume()
        
    }
    @IBAction func back1(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

