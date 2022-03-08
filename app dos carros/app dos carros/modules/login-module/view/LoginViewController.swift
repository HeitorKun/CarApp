//
//  LoginViewController.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var carrosTitleView: UIView!
    @IBOutlet weak var bigLoginView: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

    }

    func setUpUI() {
        backgroundImage.image = UIImage(named: "backLoginImage")
        bigLoginView.layer.cornerRadius = 20
        bigLoginView.clipsToBounds = true
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
