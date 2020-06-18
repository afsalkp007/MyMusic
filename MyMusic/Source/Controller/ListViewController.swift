//
//  ListViewController.swift.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListTapDelegate {
    
    @IBOutlet weak var tableView: TableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.listTapDelegate = self
    }
    
    
    /// Cell Selection Action
    /// - Parameters:
    ///   - index: tapped cell index
    ///   - songs: collection of songs
    func didSelectAt(index: Int, songs: [Song]) {
        guard let vc = storyboard?.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else {
            return
        }
        
        vc.position = index
        vc.songs = songs
        present(vc, animated: true, completion: nil)
    }
}

