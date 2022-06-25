//
//  SignUpViewController.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var nameTF : UITextField!
    @IBOutlet weak var idTF : UITextField!
    @IBOutlet weak var pwTF : UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - UI
        signUpBtn.layer.cornerRadius = 20
        signUpBtn.roundUI()
        
        nameTF.roundUI()
        nameTF.addLeftPadding()
        nameTF.borderBlack()
        
        idTF.roundUI()
        idTF.addLeftPadding()
        idTF.borderBlack()
        
        pwTF.roundUI()
        pwTF.addLeftPadding()
        pwTF.borderBlack()
        
        
        // Do any additional setup after loading the view.
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
