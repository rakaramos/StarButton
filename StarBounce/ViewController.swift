//
//  ViewController.swift
//  FavoriteStart
//
//  Created by Rafael Machado on 14/11/14.
//  Copyright (c) 2014 Rafael Machado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func favorite(_ sender: StarButton!) {
        sender.isFavorite = !sender.isFavorite
    }
}
