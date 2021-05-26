//
//  ViewExtenstions.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 25/05/2021.
//

import SwiftUI

extension View {
  @ViewBuilder
  func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }

  @ViewBuilder
  func ifLet<V, Transform: View>(_ value: V?, transform: (Self, V) -> Transform) -> some View {
    if let value = value {
      transform(self, value)
    } else {
      self
    }
  }
}
