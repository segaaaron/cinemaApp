//
//  extension+color.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI

extension Color {
  init(hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xff) / 255,
      green: Double((hex >> 08) & 0xff) / 255,
      blue: Double((hex >> 00) & 0xff) / 255,
      opacity: alpha
    )
  }
}

extension Color {
  enum grey {
    static let c1 = Color(hex: 0xECEEF1)
    static let c2 = Color(hex: 0x455875)
  }
  enum customBlue {
    static let b1 = Color(hex: 0x4781FF)
    static let b2 = Color(hex: 0xDAE6FF)
  }
  enum neutral {
    static let n1 = Color(hex: 0x070D1A)
    static let n2 = Color(hex: 0x13213F)
  }
  enum shadows {
    static let image = Color(hex: 0x000000, alpha: 0.16)
  }
}
