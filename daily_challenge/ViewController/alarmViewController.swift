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
    
    @IBOutlet weak var labelForSeting: UILabel!
    
    
 
    
    
    var floatingButton = CustomButton()
    
    static var pickerViewIsHidden : Bool = true
    
    let pickerData : [String] = ["전체", "핫딜", "프로필", "디테일"]
    
    let models : [Model] = [
        Model(type : "detail", text1: "hi", text2: "hellow", text3: "what's up"),
        Model(type : "hotdeal", text1: "1", text2: "2", text3: "3"),
        Model(type: "profile", text1: "1", text2: "2", text3: "3")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        
        //MARK: -toolbar 만들기
//        let doneButton = UIBarButtonItem()
//         doneButton.title = "완료"
//         doneButton.target = self
//         doneButton.action = #selector(pickerDone)
//
//        let toolbar = UIToolbar()
//        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
//        toolbar.backgroundColor = UIColor(red: 192, green: 192, blue: 192, alpha: 1)
//        toolbar.tintColor = .systemBlue
//        toolbar.setItems([doneButton], animated: true)
//
//        pickerView.inputAccessoryView = toolbar
        
        // tool바 적용 안됨.
        

        
        
        
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            floatingButton.widthAnchor.constraint(equalToConstant: 44),
            floatingButton.heightAnchor.constraint(equalToConstant: 44),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -77),
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        view.bringSubviewToFront(floatingButton)
        
        // 문제 floating button 이 위로 안올라옴.
        
        

    }
    
//    @objc func pickerDone(){
//        pickerView.endEditing(true)
//
//    }
    
    
    @IBAction func showPickerView(_ sender: Any) {
        alarmViewController.pickerViewIsHidden.toggle()
        pickerView.isHidden = alarmViewController.pickerViewIsHidden
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
        
        let textforSetting = self.pickerData[row]
        labelForSeting.text = textforSetting
        
        pickerView.endEditing(true)
        alarmViewController.pickerViewIsHidden.toggle()
        pickerView.isHidden = alarmViewController.pickerViewIsHidden
    }
    
    
    
}
