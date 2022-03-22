//
//  SelectedCarViewController.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 22/03/22.
//

import UIKit

class SelectedCarViewController: UIViewController, PresenterToViewSelectedCarProtocol {
    
    var presenter: ViewToPresenterSelectedCarProtocol?


    @IBOutlet weak var selectedCarImageView: UIImageView!

    @IBOutlet weak var videoBarButtonItem: UIBarButtonItem!

    @IBOutlet weak var locationBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
