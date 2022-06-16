//
//  AddViewController.swift
//  Day4
//
//  Created by Jovan A on 16/06/22.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputSubTitle: UITextField!
    @IBOutlet weak var inputContent: UITextField!
    var isDismissed: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnConfirm(_ sender: Any) {
        if inputTitle.text == "" || inputSubTitle.text == ""{
            self.showAlert(title: "Empty Field", message: "Please fill in all the required field")
        }
        else {
            saveData(title: inputTitle.text ?? "", subTitle: inputSubTitle.text ?? "", content: inputSubTitle.text ?? "")
            self.isDismissed?()
            self.dismiss(animated: true)
        }
    }
}
