//
//  LoginViewController.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import UIKit

class LoginViewController: UIViewController, PresenterToViewLoginProtocol {

    var presenter: ViewToPresenterMovieProtocol?

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

    @IBAction func didTouchLoginButton(_ sender: UIButton) {
        if loginTextField.text == "" || loginTextField.text == nil || passwordTextField.text == "" || passwordTextField.text == nil {
            presenter?.loginRequest(loginUser: "", password: "")

        } else {
            presenter?.loginRequest(loginUser: loginTextField.text!, password: passwordTextField.text!)
        }
    }

    func loginSuccessEventDone() {

    }

    func loginFailureEventDone() {
        
    }

    func pleaseCompleteFieldsUIAlert() {

    }

}
