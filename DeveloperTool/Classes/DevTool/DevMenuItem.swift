//
//  DevMenuItem.swift
//  Developer Tool
//
//  Created by &&TairoV on 22.05.2023.
//

import UIKit

public protocol IDevMenuItem {
    var title: String { get }
    var action: () -> UIViewController { get }
}


public struct DevMenuItem: IDevMenuItem {
    
    public var title: String
    
    public var action: () -> UIViewController
    
    public init(title: String, action: @escaping () -> UIViewController) {
        self.title = title
        self.action = action
    }
}
