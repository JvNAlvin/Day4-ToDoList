//
//  AlertController.swift
//  Day4
//
//  Created by Jovan A on 16/06/22.
//

import Foundation
import UIKit

extension UIViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
}
