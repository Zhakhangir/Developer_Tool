//
//  UiViewController+Extensions.swift
//  Developer Tool
//
//  Created by &&TairoV on 22.05.2023.
//

import UIKit

extension UIViewController {
    
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if case .motionShake = motion {
            present(DeveloperToolManager.shared.menuController, animated: true)
        }
    }
}
