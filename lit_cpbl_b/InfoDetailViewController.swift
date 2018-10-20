//
//  InfoDetailViewController.swift
//  lit_cpbl_b
//
//  Created by 小神寛晴 on 2018/10/20.
//  Copyright © 2018年 Kansei Kogami. All rights reserved.
//

import UIKit

class InfoDetailViewController: UIViewController {
    
    @IBOutlet weak var CommentTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        CommentTableView.delegate = self
        CommentTableView.dataSource = self
        
        let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        CommentTableView.register(nib, forCellReuseIdentifier: "CommentTableViewCell")
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

extension InfoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
