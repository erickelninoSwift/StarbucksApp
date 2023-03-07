//
//  Extension.swift
//  StarbucksApp
//
//  Created by Erick El nino on 2023/03/07.
//  Copyright © 2023 Erick El nino. All rights reserved.
//

import UIKit

extension UIFont
{
    func withtraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont
    {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont
    {
        return withtraits(traits: .traitBold)
    }
}
