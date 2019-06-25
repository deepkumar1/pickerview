//
//  ViewController.swift
//  Json1
//
//  Created by DEEP KUMAR on 26/06/19.
//  Copyright © 2019 DEEP KUMAR. All rights reserved.
//

import UIKit
struct JsonData: Decodable {
    let name: String
    let capital: String
    let alpha3Code: String
    let region: String
    let subregion:String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var countres=[JsonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        main()
    }
    func main(){
        let url = "https://restcountries.eu/rest/v2/all"
        let jsonObj=URL(string: url)
        URLSession.shared.dataTask(with:jsonObj!){(data,response,error)in
            do{if error == nil{
                self.countres=try JSONDecoder().decode([JsonData].self, from: data!)
                for json in self.countres{
                    print(json.name,json.capital,json.alpha3Code)
                    DispatchQueue.main.sync
                        {
                            self.tableView.reloadData()
                        }
                }
                }
            }
            catch{
                print("we got error")
            }
            
            }.resume()
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countres.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deep:Cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as!Cell
        deep.lbl1.text=countres[indexPath.row].name
        deep.lbl2.text=countres[indexPath.row].capital
        deep.lbl1.textColor = .red
        deep.lbl2.textColor = .purple
        deep.lbl1.font=UIFont.boldSystemFont(ofSize: 25)
        deep.lbl1.font=UIFont.boldSystemFont(ofSize: 25)
//        deep.lbl1.backgroundColor=UIColor.green
//        deep.lbl2.backgroundColor=UIColor.green
        return deep
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:SecondVc=storyboard?.instantiateViewController(withIdentifier: "detail1")as! SecondVc
        detail.name1 = countres[indexPath.row].name
        detail.country1 = countres[indexPath.row].capital
        detail.alpha3code1 = countres[indexPath.row].alpha3Code
        detail.region1 = countres[indexPath.row].region
        detail.subregion1 = countres[indexPath.row].subregion
        self.navigationController?.pushViewController(detail, animated: true)
    }

    @IBOutlet weak var tableView: UITableView!
    
}

