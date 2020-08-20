//
//  ViewController.swift
//  memo
//
//  Created by swuad_16 on 14/08/2020.
//  Copyright © 2020 swuad_16. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var Text: UILabel! // 이전 화면에서 저장 옵션을 클릭하면 다음 화면으로 텍스트를 넘겨 주는 걸로 생각. 넘겨받은 텍스트.
    
    
    
    @IBAction func Font1(_ sender: UIButton) {
        Text.font = UIFont(name: "Cafe24Oneprettynight", size: 15)
    } // 폰트 설정 1, 임의로 일단 세 개를 넣었음.
    
    
    @IBAction func Font2(_ sender: UIButton) {
        Text.font = UIFont(name: "GmarketSansTTFMedium", size: 15)
    } // 폰트 설정 2
    
    
    @IBAction func Font3(_ sender: UIButton) {
        Text.font = UIFont(name: "Jalnan", size: 15)
    } // 폰트 설정 3

    @IBOutlet weak var btn: UIButton!
    
    @IBAction func btn(_ sender: Any) {
        
        let screenshot = self.view.takeScreenshot()
        
        UIImageWriteToSavedPhotosAlbum(screenshot, self, #selector(saveImage(_:didFinishSavingWithError:contextInfo:)), nil) // 카메라롤에 저장
        
        
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
