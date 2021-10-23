//
//  Button.swift
//  NoteApp
//
//  Created by Egemen on 23.10.2021.
//

import UIKit

extension UIViewController{
    func alertSection(
        _ title: String,_ message: String) -> ()  {
        let alert = UIAlertController(title: "Alert", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Click", style: UIAlertAction.Style.default, handler: nil))
    }
}
class UIButton:UIViewController{
    
}

