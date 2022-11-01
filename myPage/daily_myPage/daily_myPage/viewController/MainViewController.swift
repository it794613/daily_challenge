//
//  ViewController.swift
//  daily_myPage
//
//  Created by 최진용 on 2022/10/26.
//





import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var currentAppVersionLable: UILabel!
    
    var version: String? {
        guard let dictionary = Bundle.main.infoDictionary,
            let version = dictionary["CFBundleShortVersionString"] as? String
            else {return nil}
        let versionAndBuild: String = "\(version)"
        return versionAndBuild
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        currentAppVersionLable.text = version
    }
    

    @IBAction func pressProfileButton(_ sender: UIButton)
    {
        if let identifier = sender.accessibilityIdentifier{
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: identifier)
            self.navigationController?.pushViewController(pushVC!, animated: true)
        }
    }
    
}

