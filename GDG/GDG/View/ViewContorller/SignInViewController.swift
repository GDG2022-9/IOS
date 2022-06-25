//
//  SingInViewController.swift
//  GDG
//
//  Created by 강민규 on 2022/06/25.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signUpBtn : UIButton!
    @IBOutlet weak var signInBtn : UIButton!
    @IBOutlet weak var idTF : UITextField!
    @IBOutlet weak var pwTF : UITextField!

    
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.gray,
        .underlineStyle: NSUnderlineStyle.single.rawValue

    ] // .double.rawValue, .thick.rawValue
         
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - UI
        let attributeString = NSMutableAttributedString(
                string: "회원가입",
                attributes: yourAttributes
             )
        signUpBtn.setAttributedTitle(attributeString, for: .normal)
        signUpBtn.roundUI()
        signInBtn.roundUI()
        signInBtn.tintColor = UIColor.black
        
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
    
    
    //MARK: - touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
}
