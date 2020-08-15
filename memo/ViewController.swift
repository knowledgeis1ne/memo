//
//  ViewController.swift
//  memo
//
//  Created by swuad_16 on 14/08/2020.
//  Copyright © 2020 swuad_16. All rights reserved.
//

import UIKit

class Memo: UIView {
    private let xibName = "memo"

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
} // uiview 생성

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var Text: UILabel! // 이전 화면에서 저장 옵션을 클릭하면 다음 화면으로 텍스트를 넘겨 주는 걸로 생각. 넘겨받은 텍스트.
    
    @IBAction func Font1(_ sender: UIButton) {
        Text.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
    } // 폰트 설정 1, 임의로 일단 세 개를 넣었음.
    
    
    @IBAction func Font2(_ sender: UIButton) {
        Text.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
    } // 폰트 설정 2
    
    
    @IBAction func Font3(_ sender: UIButton) {
        Text.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
    } // 폰트 설정 3
    
    
    // 일단은 uiview를 캡처하는 방식으로 이미지 내보내기를 하는 것으로 생각함.
    @IBAction func Save(_ sender: UIButton) {
        let screenshot = self.view.takeScreenshot()
    }

}

extension UIView {
    func takeScreenshot() -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            return image!
        }
        return UIImage()
    }
}
