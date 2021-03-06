//
//  Asset.swift
//  IdealInvestor
//
//  Created by Алексей Папин on 27.11.2020.
//

import UIKit

class Asset {
    static func image<Enum: RawRepresentable>(_ value: Enum) -> UIImage where Enum.RawValue == String {
        UIImage(imageLiteralResourceName: value.rawValue)
    }

    enum Logo: String {
        case h_blackOnWhite = "horizontal_black_on_white_by_logaster"
        case h_onCorporate = "horizontal_on_corporate_by_logaster"
        case h_onNegative = "horizontal_on_negative_by_logaster"
        case h_onTransparent = "horizontal_on_transparent_by_logaster"
        case h_onWhite = "horizontal_on_white_by_logaster"
        case v_blackOnWhite = "vertical_black_on_white_by_logaster"
        case v_onCorporate = "vertical_on_corporate_by_logaster"
        case v_onNegative = "vertical_on_negative_by_logaster"
        case v_onTransparent = "vertical_on_transparent_by_logaster"
        case v_onWhite = "vertical_on_white_by_logaster"
        
        var image: UIImage? {
            return Asset.image(self)
        }
    }
}
