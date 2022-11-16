//
//  alarmViewController.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

// 1. 전체 클릭 -> 피커뷰 나옴
// 2. 툴바에 확인 클릭 -> 카테고리 선택됨
// 3. 선택된 카테고리 라벨 변경
// 4. 테이블 뷰를 리로드 해서 해당 카테고리 리스트만 보여주기
// 4-1. 선택된 카테고리에 해당하는 데이터로 변경

class AlarmViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var labelForSeting: UILabel!
    
    @IBOutlet weak var pickView: UIView!
    
    var textForSet : String = ""
    
    
    @IBOutlet weak var alarmNumber: UILabel!
    
    // 임시 선택된 카테고리
    var tempSelectedCategory : Model.Category = .all
    
    var pickerViewIsHidden : Bool = true
    
    //    let pickerData : [String] = ["전체", "핫딜", "프로필", "디테일"]
    let pickerData : [Model.Category] = Model.Category.allCases
    
    let models : [Model] = [
        Model(type: .detail, text1: "hi", text2: "hellow", text3: "what's up"),
        Model(type: .hotdeal, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3"),
        Model(type: .profile, text1: "1", text2: "2", text3: "3")
    ]
    
    // 임시 배열
    var tempList : [Model] = []
    
    var selectedCategory : Model.Category = .all {
        didSet {
            self.tempSelectedCategory = selectedCategory
        }
    }
    
    
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
        
        self.tempList = self.models
        
    }
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
    
    
    
    //    @objc func pickerDone(){
    //        pickerView.endEditing(true)
    //
    //    }
    
    
    
    // 선택된 카테고리에 대한 부분
    @IBAction func pickDone(_ sender: UIButton) {
        pickerViewIsHidden.toggle()
        pickView.isHidden = pickerViewIsHidden
        pickerView.isHidden = pickerViewIsHidden
        //        labelForSeting.text = self.textForSet
        
        
        self.selectedCategory = self.tempSelectedCategory
        
        
        labelForSeting.text = self.selectedCategory.title
        
#warning("TODO : - 선택된 카테고리로 테이블뷰 - 데이터소스에 연결되어 있는 리스트를 변경")
        self.tempList = self.models.filter{ selectedCategory == .all || $0.type == selectedCategory }
        alarmNumber.text = "\(tempList.count)개의 알림"
        
        
        
        tableView.reloadData()
        
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
//        return models.count
        return tempList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let findIdentifier = tempList[indexPath.row].type
        switch findIdentifier {
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile") as! ProfileCell
            return cell
        case .hotdeal:
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
        return Model.Category.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textForSet = pickerData[row].title
        
        self.tempSelectedCategory = pickerData[row]
    }
}
