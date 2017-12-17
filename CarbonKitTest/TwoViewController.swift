//
//  TwoViewController.swift
//  CarbonKitTest
//
//  Created by Raksmey on 12/17/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import CarbonKit

class TwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dataTableView: UITableView!
    var refresh: CarbonSwipeRefresh = CarbonSwipeRefresh()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataTableView.delegate = self
        self.dataTableView.dataSource = self
        refresh = CarbonSwipeRefresh(scrollView: self.dataTableView)
        
        refresh.setMarginTop(0)
        refresh.colors = [UIColor.blue, UIColor.red, UIColor.orange, UIColor.green]
        self.view.addSubview(refresh)
        refresh.addTarget(self, action: "refresh:", for: .valueChanged)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel!.text = "Cell \(Int(indexPath.row))"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("row have been selected")
        var viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerThree") as! ThreeViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    func refresh(sender: AnyObject) {
       
//        let delayTime = DispatchTime(uptimeNanoseconds: 50)
//        dispatch_after(delayTime) {
//            self.endRefreshing()
//        }
    }
    
    func endRefreshing() {
        refresh.endRefreshing()
    }




}
