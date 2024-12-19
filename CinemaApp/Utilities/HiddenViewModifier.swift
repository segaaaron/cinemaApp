//
//  HiddenViewModifier.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI

struct HiddenViewModifier: ViewModifier {
 let isHidden: Bool
  
  func body(content: Content) -> some View {
    if !isHidden {
      content
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.25), value: isHidden)
    }
  }
}
