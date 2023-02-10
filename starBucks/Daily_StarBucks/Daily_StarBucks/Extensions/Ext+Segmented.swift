//
//  Ext+Segmented.swift
//  Daily_StarBucks
//
//  Created by 최진용 on 2023/01/20.
//

import UIKit




extension UISegmentedControl{
    func removeBorder(){
         let backgroundImage = UIImage()
         self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
         self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
         self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage()
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)
     }
    
    
    func addUnderlineForSelectedSegment(){
        removeBorder()
        let backgroundLineWidth: CGFloat = self.bounds.width + 45
        let backgroundLineHeight: CGFloat = 2.0
        let backgroundLineYPosition = self.bounds.size.height + 38
        let backgroundLineFrame = CGRect(x: 0, y: backgroundLineYPosition, width: backgroundLineWidth, height: backgroundLineHeight)
        let backgroundLine = UIView(frame: backgroundLineFrame)
        backgroundLine.backgroundColor = UIColor(cgColor: CGColor.gray)
        
        let underlineWidth: CGFloat = self.bounds.size.width / 1.79
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth) - 12)
        let underLineYPosition = self.bounds.size.height + 38
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor.black
        underline.tag = 1
        self.addSubview(backgroundLine)
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition - 12
        })
    }
}
