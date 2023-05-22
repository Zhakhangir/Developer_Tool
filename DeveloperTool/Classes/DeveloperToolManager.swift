//
//  DebugMenuStarter.swift
//  DigitalBank
//
//  Created by &&TairoV on 26.04.2023.
//  Copyright © 2023 iosDeveloper. All rights reserved.s
//

import UIKit

public class DeveloperToolManager {

    var menuController: DeveloperMenuViewController!
    
    static let shared = DeveloperToolManager()
  
    private init() { }

    func start(items: [IDevMenuItem]) {
        menuController = DeveloperMenuViewController(items: items)
        
        guard let _ = UserDefaults.standard.string(forKey: serverKey) else {
            UserDefaults.standard.set(AppServer.omicron.rawValue, forKey: serverKey)
            return
        }
    }
}
