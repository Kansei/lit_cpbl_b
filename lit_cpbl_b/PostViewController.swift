//
//  PostViewController.swift
//  lit_cpbl_b
//
//  Created by 小神寛晴 on 2018/10/20.
//  Copyright © 2018年 Kansei Kogami. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var photoView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    // カメラの撮影開始
    @IBAction func camera(_ sender : Any) {
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
//            label.text = "error"
            
        }
       
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
        
    //　撮影が完了時した時に呼ばれる
    private func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let pickedImage = info[.originalImage] as Optional {
            
            photoView.contentMode = .scaleAspectFit
            photoView.image = pickedImage as? UIImage
            
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
//            label.text = "Tap the [Save] to save a picture"
        
    }
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
//            label.text = "Canceled"
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func tapSubmitButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
