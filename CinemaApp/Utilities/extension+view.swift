//
//  extension+view.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI

extension View {
  func isHidden(_ isHidden: Bool) -> some View {
    modifier(HiddenViewModifier(isHidden: isHidden))
  }
}
