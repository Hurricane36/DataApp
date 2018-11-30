//
//  DataViewControllerTableViewCell.swift
//  DataApp
//
//  Created by Tolman, Caiden on 11/30/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController{
    lazy var bucketList : [BucketItem] = {
       return loadBucketListFromFile()
    }()
    private func loadBucketListFromFile() -> [BucketItem] {
        var items = [BucketItem]()
        do {
            if let filePath = Bundle.main.url(forResource: "bucket18", withExtension: "csv") {
                let input = try String(contentsOf: filePath)
                let bucketLines = input.components(separatedBy: "\n")
                for line in bucketLines {
                    let item = line.components(separatedBy: ",")
                    items.append(BucketItem(contents: item[0], author: item[1]))
                }
            }
        }
        catch {
            print("file load Error")
        }
        return items
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int{
            return bucketList.count
        }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier", for: indexPath) as! BucketItemCell
        cell.currentBucketItem = bucketList[indexPath.row]
        return cell
    }

}
