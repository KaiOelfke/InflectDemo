//
//  ContentView.swift
//  InflectDemo
//
//  Created by Kai Oelfke on 16.09.23.
//

import SwiftUI

struct ContentView: View {
  let options: [String] = [
    String(localized: "car"),
    String(localized: "apple"),
    String(localized: "banana"),
    String(localized: "man")
  ]
  @State private var counter = 0
  var body: some View {
    VStack {
      let option = options.randomElement()!
      
      // This doesn't work in German and French.
      Text(AttributedString(localized: "The \(option)"))
      // From the session and documentation it's not clear to me,
      // if the key or the translation or both need to have ^[](inflect: true) syntax.
      // But it seems the key must include the syntax from this sample at least.

      // This works in French, but not German.
      Text(AttributedString(localized: "^[The \(option)](inflect: true)"))

      Text("The \(option)")
      Text("This \(option)")
      
      // This works in French, but not German
      Text("^[This \(option)](inflect: true)")
      Text(String(localized: "^[This \(option)](inflect: true)"))
      
      // This works in French, but not German
      Text(AttributedString(localized: "^[This \(option)](inflect: true)"))

      Button("Change \(counter)") {
        counter += 1
        // Just to confirm German inflection works
        print(InflectionRule.canInflectPreferredLocalization)
        print(InflectionRule.canInflect(language: "de"))
      }
      // This works as expected in German: 0 Äpfel, 1 Apfel, 2 Äpfel
      Text("^[\(counter) apple](inflect: true)")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
