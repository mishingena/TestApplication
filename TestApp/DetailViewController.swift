//
//  DetailViewController.swift
//  TestApp
//
//  Created by Gennadiy Mishin on 01/12/2018.
//  Copyright © 2018 Gennadiy Mishin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: Item?

    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = item?.title
        doneButton.addTarget(self, action: #selector(doneAction(sender:)), for: .touchUpInside)
        doneButton.accessibilityIdentifier = "DoneButton"
    }

    // MARK: - Actions
    
    @objc private func doneAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
