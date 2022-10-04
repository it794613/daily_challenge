//
//  alarmViewController.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

class alarmViewController : UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    var pickerViewIsHidden : Bool = false
    
    let pickerData : [String] = ["전체", "핫딜", "프로필", "디테일"]
    
    let models : [Model] = [
        Model(type : "detail" ,text1: "hi", text2: "hellow", text3: "what's up"),
        Model(type : "hotdeal" , text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        

    }
    
    @IBAction func showPickerView(_ sender: Any) {
        pickerViewIsHidden.toggle()
        if pickerViewIsHidden == true {
            pickerView.isHidden = false
        }
        else{
            pickerView.isHidden = true
        }
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

//MARK: -PickerViewDelegate
extension alarmViewController : UIPickerViewDelegate{
    
}

//MARK: -PickerViewDataSource
extension alarmViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 선택되면, cell 에 데이터 타입에서 해당 픽과 동일한 정보만 정렬해서 리로드 하고
        // endediting true 하기
    }
    
    
    
}
