//
//  ViewController.swift
//  WhatFlower
//
//  Created by 洋蔥胖 on 2018/5/1.
//  Copyright © 2018年 ChrisYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    //建立一個imagePickController
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定delegate
        imagePicker.delegate = self
    }
    
    //取得圖片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = userPickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        /*
         設定圖片來源：
         (1).camera 相機
         (2).photoLibrary 相冊
         (3).savedPhotosAlbum 保存的圖片，範圍比相簿大
         */
        imagePicker.sourceType = .savedPhotosAlbum
        //設定圖片是否編輯
        imagePicker.allowsEditing = false
        //顯示圖片
        present(imagePicker, animated: true, completion: nil)
    }
    
}

