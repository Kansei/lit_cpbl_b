
//  ViewController.swift
//  lit_cpbl_b
//
//  Created by 小神寛晴 on 2018/10/20.
//  Copyright © 2018年 Kansei Kogami. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var iizukaMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        iizukaMapView.delegate = self
        
        let x = 130.686901 //経度
        let y = 33.635911  //緯度
        
        //中心座標
        let center = CLLocationCoordinate2DMake(y, x)
        
        //表示範囲
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        
        //中心座標と表示範囲をマップに登録する。
        let region = MKCoordinateRegion(center: center, span: span)
        iizukaMapView.setRegion(region, animated:true)
        
        //中心にピンを立てる。
        
        let annotation = iizukaMKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(y, x)
        annotation.title = "飯塚市役所"
        annotation.subtitle = "CPBLやってるよー"
        annotation.pinImage = "rank3.png"
        iizukaMapView.addAnnotation(annotation)
        
        //左下のピン
        let annotation1 = iizukaMKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2DMake(y-0.2, x-0.2)
        annotation1.title = "かんせい"
        annotation1.pinImage = "rank2.png"
        iizukaMapView.addAnnotation(annotation1)
        
        //右下のピン
        let annotation2 = iizukaMKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2DMake(y-0.2, x+0.2)
        annotation2.title = "こがみ"
        annotation2.pinImage = "rank1.png"
        iizukaMapView.addAnnotation(annotation2)
        
        //左上のピン
        let annotation3 = iizukaMKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2DMake(y+0.2, x-0.2)
        annotation3.title = "おかちゃん"
        annotation3.pinImage = "rank1.png"
        iizukaMapView.addAnnotation(annotation3)
        
        //右上のピン
        let annotation4 = iizukaMKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2DMake(y+0.2, x+0.2)
        annotation4.title = "おかむら"
        annotation4.pinImage = "rank2.png"
        iizukaMapView.addAnnotation(annotation4)
        
        
        
    }
    
    //アノテーションビューを返すメソッド
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let test = annotation as? iizukaMKPointAnnotation {
            if(test.pinColor != nil) {
                
                print("色の設定")
                //色が設定されている場合
                let testPinView = MKPinAnnotationView()
                testPinView.annotation = annotation
                testPinView.pinTintColor = test.pinColor
                testPinView.canShowCallout = true
                
                return testPinView
                
            } else if(test.pinImage != nil) {
                
                print("画像の設定")
                //画像が設定されている場合
                let testPinView = MKAnnotationView()
                testPinView.annotation = annotation
                testPinView.image = UIImage(named:test.pinImage)
                testPinView.canShowCallout = true
                
                return testPinView
            }
        }
        
        //色も画像も設定されていない場合
        let testPinView = MKPinAnnotationView()
        testPinView.canShowCallout = true
        testPinView.annotation = annotation
        
        return testPinView
    }


}

