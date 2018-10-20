//
//  InfoListViewController.swift
//  lit_cpbl_b
//
//  Created by 小神寛晴 on 2018/10/20.
//  Copyright © 2018年 Kansei Kogami. All rights reserved.
//

import UIKit

class InfoListViewController: UIViewController {

    @IBOutlet weak var InfoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfoListTableView.delegate = self
        InfoListTableView.dataSource = self
        
        let nib = UINib(nibName: "InfoListTableViewCell", bundle: nil)
        InfoListTableView.register(nib, forCellReuseIdentifier: "InfoListTableViewCell")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InfoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoListTableViewCell") as! InfoListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toInfoDetailViewController", sender: nil)
        
    }
}
