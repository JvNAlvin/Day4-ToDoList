//
//  DetailViewController.swift
//  Day4
//
//  Created by Jovan A on 16/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubTitle: UILabel!
    @IBOutlet weak var txtContent: UILabel!
    
    var judul: String = ""
    var subjudul:String = ""
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtTitle.text = judul
        txtSubTitle.text = subjudul
        txtContent.text = content
    }
    
}
