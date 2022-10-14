//
//  AlertViewController.swift
//  tabbar
//
//  Created by 최진용 on 2022/10/13.
//

import UIKit

protocol AlertDelegate{
    func pressLogin()
    func pressCancel()
}


class AlertViewController: UIViewController{
    
    
    var delegate: AlertDelegate?
    
    
    @IBOutlet weak var alertLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertLabel.setTextWithLineHeight(text: alertLabel?.text, lineHeight: 19)
    }
    
    
    @IBAction func pressCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: -UILabel lineSpacing extension
// 라벨 줄 사이에 공간 넣어주는 코드.
extension UILabel{
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4
            ]
            
            let attrString = NSAttributedString(string: text, attributes: attributes)
            self.attributedText = attrString
        }
    }
}
