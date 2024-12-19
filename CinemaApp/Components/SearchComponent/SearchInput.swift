//
//  SearchInput.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 19/12/24.
//

import SwiftUI

struct SearchInput: View {
  @Binding private var text: String
  @FocusState private var focusedField: FocusedField?
  @State private var isTextFieldFocused = false
  private var placeholder: String
  private var focusChanged: (_ focus: Bool) -> Void
  private var onChangeText: (_ value: String) -> Void
  
  init(text: Binding<String>, placeholder: String = "", focusChanged: @escaping (_ focus: Bool) -> Void = { _ in }, onChangeText: @escaping (_ value: String) -> Void) {
    self._text = text
    self.placeholder = placeholder
    self.focusChanged = focusChanged
    self.onChangeText = onChangeText
  }
  
  var hideCloseButton: Bool {
    text.isEmpty || !isTextFieldFocused
  }
  
  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .resizable()
        .scaledToFill()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
      //        .foregroundColor(Color.cleaer)
        .padding(.horizontal)
        .onTapGesture {
          focusedField = .search
        }
      TextField(placeholder, text: $text) { status in
        withAnimation(.easeIn) {
          if isTextFieldFocused != status {
            self.focusChanged(status)
          }
          isTextFieldFocused = status
        }
      } onCommit: {
        withAnimation(.easeOut) {
          isTextFieldFocused = false
          self.focusChanged(false)
        }
      }
      .onChange(of: text) { _ , newValue in
        onChangeText(newValue)
      }
      .focused($focusedField, equals: .search)
      .font(Font.title3)
      .autocapitalization(.none)
      .disableAutocorrection(true)
      .foregroundColor(Color.black)
      .frame(maxWidth: .infinity, alignment: .leading)
      Button {
        text = ""
      } label: {
        HStack {
          Image(systemName: "xmark")
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.black)
            .frame(width: 15, height: 15)
        }
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.clear)
        )
        .padding(.horizontal)
      }
      .isHidden(hideCloseButton)
    }
    .onTapGesture {
      focusedField = .search
    }
    .frame(height: 42.0)
    .background(
      RoundedRectangle(cornerRadius: 10.0, style: .continuous)
        .fill(Color.clear)
    )
    .overlay(
      RoundedRectangle(cornerRadius: 10.0, style: .continuous)
        .stroke(Color.black, lineWidth: 1.0)
    )
    .padding([.leading, .trailing], 35)
    .padding([.top, .bottom], 15)
  }
}
