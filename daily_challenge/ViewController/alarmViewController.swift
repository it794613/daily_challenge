//
//  alarmViewController.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

class alarmViewController : UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    
    let models : [Model] = [
        Model(type : "detail" ,text1: "hi", text2: "hellow", text3: "what's up"),
        Model(type : "hotdeal" , text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    
    
}

//MARK: - UIdatasource
extension alarmViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! myTableCellController
        return cell
    }
    

}

//MARK: -UItableViewDelegate
extension alarmViewController : UITableViewDelegate{

}

