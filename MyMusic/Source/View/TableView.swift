//
//  TableView.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

protocol CellTapDelegate: class {
    func didSelectAt(index: Int)
}

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private enum Constants {
      static let CellIdentifier = "Cell"
    }
    
    var songs = [Song]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        songs = LibraryAPI.shared.getSongs()
        
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier, for: indexPath)
        let song = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    
    
}


