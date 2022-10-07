//
//  alarmViewController.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

class AlarmViewController : UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var labelForSeting: UILabel!
    
    @IBOutlet weak var pickView: UIView!
    
    var textForSet : String = ""
 
    @IBOutlet weak var alarmNumber: UILabel!
    
    
    //    var floatingButton = CustomButton()
    
    var pickerViewIsHidden : Bool = true
    
    let pickerData : [String] = ["전체", "핫딜", "프로필", "디테일"]
    
    let models : [Model] = [
        Model(type : "detail", text1: "hi", text2: "hellow", text3: "what's up"),
        Model(type : "hotdeal", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        pickView.isHidden = true
        
        alarmNumber.text = "\(models.count)개의 알림"
        self.navigationController?.navigationBar.shadowImage = nil
        

        
        
        
//        view.addSubview(floatingButton)
//        floatingButton.translatesAutoresizingMaskIntoConstraints = false
//        floatingButton.layer.masksToBounds = true
//        NSLayoutConstraint.activate([
//            floatingButton.widthAnchor.constraint(equalToConstant: 44),
//            floatingButton.heightAnchor.constraint(equalToConstant: 44),
//            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -77),
//            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//        ])
//        view.bringSubviewToFront(floatingButton)
//
        // 문제 floating button 이 위로 안올라옴.
        
        

    }
    
//    @objc func pickerDone(){
//        pickerView.endEditing(true)
//
//    }
    
    @IBAction func pickDone(_ sender: UIButton) {
        pickerViewIsHidden.toggle()
        pickView.isHidden = pickerViewIsHidden
        pickerView.isHidden = pickerViewIsHidden
        labelForSeting.text = self.textForSet
    }
    
    @IBAction func showPickerView(_ sender: Any) {
        pickerViewIsHidden.toggle()
        pickView.isHidden = pickerViewIsHidden
        pickerView.isHidden = pickerViewIsHidden
    }
    
    func scrollToFirstRow() {
      let indexPath = IndexPath(row: 0, section: 0)
      self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    @IBAction func pressScrollButton(_ sender: UIButton) {
        scrollToFirstRow()
    }
    
}

//MARK: - UIdatasource
extension AlarmViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let findIdentifier = models[indexPath.row].type
        switch findIdentifier {
        case "profile":
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile") as! ProfileCell
            return cell
        case "hotdeal":
            let cell = tableView.dequeueReusableCell(withIdentifier: "hotdeal") as! HotdealCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detail") as! DetailCell
            return cell
        }
    }
    

}

//MARK: -UItableViewDelegate
extension AlarmViewController : UITableViewDelegate{

}

//MARK: -PickerViewDelegate
extension AlarmViewController : UIPickerViewDelegate{
    
}

//MARK: -PickerViewDataSource
extension AlarmViewController : UIPickerViewDataSource{
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
        
        self.textForSet = pickerData[row]
    }
    
    
    
    
}
