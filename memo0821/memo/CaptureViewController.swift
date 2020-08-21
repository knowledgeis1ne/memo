//
//  CaptureViewController.swift
//  memo
//
//  Created by swuad_28 on 20/08/2020.
//  Copyright © 2020 swuad_16. All rights reserved.
//

import UIKit
import Photos

var image:UIImage = UIImage()

class CaptureViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImage.image = image
    }
    
        }



