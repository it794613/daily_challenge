//
//  ViewController.swift
//  Daily_AvPlayerController
//
//  Created by 최진용 on 2022/12/30.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let titleLabel = UILabel()
    let textField = UITextField()
    let tableLabel = UILabel()
    
    let disposeBag = DisposeBag()
//    var users: [User]?
    var userNameList: [String] = ["최진용", "이상민", "sdf", "sadhfia", "adfjijfd", "ajdfioadf", "adfindf", "wweke", "xjidn", "ninxonwe", "dnfone", "dnfine", "dnfinvb", "dnfowe", "Nidnfowe", "dvni", "nenvinsi", "neifnww", "iieown", "nxp0eifnm", "epppks"]
    
    var userOriginal: [String] = ["최진용", "이상민", "sdf", "sadhfia", "adfjijfd", "ajdfioadf", "adfindf", "wweke", "xjidn", "ninxonwe", "dnfone", "dnfine", "dnfinvb", "dnfowe", "Nidnfowe", "dvni", "nenvinsi", "neifnww", "iieown", "nxp0eifnm", "epppks"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print(userNameList)
        createUI(titleLable: titleLabel, textField: textField, tableView: tableView, tableLabel: tableLabel)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
        inputUsers()
        
    }

    
    
    
//MARK: - UI관련 코드
    func createUI(titleLable: UILabel, textField: UITextField, tableView: UITableView, tableLabel: UILabel) {
        
        //타이틀 추가
        view.addSubview(titleLabel)
        titleLabel.text = "깃허브 사용자 검색"
        titleLabel.font = titleLabel.font.withSize(24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        //서치바 추가
        
        view.addSubview(textField)
        textField.placeholder = "깃허브 사용자를 검색해 보세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 21),
            textField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
        textField.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        textField.layer.borderColor = CGColor(gray: 1, alpha: 1)
        textField.layer.borderWidth = CGFloat(1)
        textField.addLeftPadding()
        textField.addRadious(8)
        // 인풋값을 무조건 lowercase로
        textField.autocapitalizationType = .none

        
        //테이블뷰 서브 타이틀 추가
        
        view.addSubview(tableLabel)
        tableLabel.text = "깃허브 사용자 목록"
        tableLabel.font = tableLabel.font.withSize(16)
        tableLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 24),
            tableLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor)
        ])
        
        //테이블뷰 추가
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: tableLabel.bottomAnchor, constant: 17),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }

}
//MARK: - RxSwift
extension ViewController {
    
    func inputUsers() {
        textField.rx.text.orEmpty
            .distinctUntilChanged()
            .subscribe { [unowned self] textInput in
                if textInput == "" {
                    userNameList = userOriginal
                }
                else {
                    self.userNameList = self.userOriginal.filter({ $0.hasPrefix(textInput)
                    })
                }
                self.tableView.reloadData()
            }
            .disposed(by: disposeBag)
    }

    
    
    
//MARK: - github api 사용하는부분 선언
//    func getAllUsers() {
//        if let url = URL(string: "https://api.github.com/users") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                if let safeData = data {
//                    self.fetchData(data: safeData)
//                }
//            }
//            task.resume()
//        }
//    }
//
//    func fetchData(data: Data) {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(Users.self, from: data)
//            self.users = decodedData.users
//        } catch {
//            print(error)
//        }
//    }
//
//    func getList() {
//        if let userList = users {
//            for i in userList {
//                self.userNameList.append(i.login)
//            }
//        }
//    }
    

}


//MARK: - TableViewDelegate, TableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        cell.githubUserId.text = userNameList[indexPath.row]
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}







#if DEBUG
import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewControllerPresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif

