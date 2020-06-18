//
//  TableView.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

protocol ListTapDelegate: class {
    func didSelectAt(index: Int, songs: [Song])
}

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
        
    var songs = [Song]()
    weak var listTapDelegate: ListTapDelegate?
    
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
        let cell = dequeCell(cellId: Constants.CellIds.listCellId, indexPath: indexPath)
        let song = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        
        listTapDelegate?.didSelectAt(index: indexPath.row, songs: songs)
    }
}



