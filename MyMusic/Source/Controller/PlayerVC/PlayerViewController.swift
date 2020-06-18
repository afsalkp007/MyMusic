//
//  PlayerViewController.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    public var songs: [Song]?
    var position: Int = 0
    
    @IBOutlet weak var holder: HolderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let songs = songs else {
            return
        }
        holder.totalSongs = songs.count
        holder.position = position
        holder.songs = songs
        holder.bindViews()
    }

}
