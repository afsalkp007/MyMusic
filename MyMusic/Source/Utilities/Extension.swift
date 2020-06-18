//
//  Extension.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit


extension UITableView {
    
    func dequeCell<Cell: UITableViewCell>(cellId:String, indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: String(describing: cellId), for: indexPath) as! Cell
    }
    
    func registerCell(cellType: UITableViewCell.Type, cellId: String) {
        register(cellType, forCellReuseIdentifier: String(describing: cellId))
    }
}

