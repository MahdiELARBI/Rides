//
//  ThemeProtocol.swift
//  Rides
//
//  Created by Mahdi Elarbi on 2024-09-18.
//

import SwiftUI
/**
 Protocol for themes
 */
protocol ThemeProtocol {
    var largeTitleFont: Font { get }
    var textTitleFont: Font { get }
    var normalBtnTitleFont: Font { get }
    var boldBtnTitleFont: Font { get }
    var bodyTextFont: Font { get }
    var captionTxtFont: Font { get }
    
    var primaryThemeColor: Color { get }
    var secondoryThemeColor: Color { get }
    var affirmBtnTitleColor: Color { get }
    var negativeBtnTitleColor: Color { get }
    var bodyTextColor: Color { get }
    var textBoxColor: Color { get }
}
