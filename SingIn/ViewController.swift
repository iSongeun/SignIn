//
//  ViewController.swift
//  SingIn
//
//  Created by 이송은 on 2023/03/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var emailLB: UILabel!
    @IBOutlet weak var passLB: UILabel!
    
    var emailErrorHeight : NSLayoutConstraint!
    var passErrorHeight : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.addTarget(self, action: #selector(textfieldChanged), for: .editingChanged)
        passTF.addTarget(self, action: #selector(textfieldChanged), for: .editingChanged)
        
        emailErrorHeight = emailLB.heightAnchor.constraint(equalToConstant: 0)
        passErrorHeight = passLB.heightAnchor.constraint(equalToConstant: 0)
    }

    @objc func textfieldChanged(textField : UITextField){
        if textField == emailTF {
            if isValidEmail(emailTF.text ?? "") {
                emailErrorHeight.isActive = true
            }
            else {
                emailErrorHeight.isActive = false
            }
        }
        else if textField == passTF {
            if isValidPassword(passTF.text ?? "") {
                passErrorHeight.isActive = true
            }
            else {
                passErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded() //wow!!
        }
    }
    
    //정규식
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword (_ password : String) -> Bool {
        if password.count < 8 {
            return false
        }
        return true
    }
}
