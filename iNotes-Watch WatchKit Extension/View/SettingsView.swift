//
//  SettingsView.swift
//  iNotes-Watch WatchKit Extension
//
//  Created by Sumesh Vs on 13/07/21.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("sizeChange") var sizeChange: Double = 0.0

 //   @State private var slidingValue : Float = 0.0
    var body: some View {
        VStack {
            Text("SETTING").font(.headline)
            HeaderView(heading: "")
            Slider(value: $sizeChange, in: 1...4, step: 1)
            Text("Customized to \n\(Int(sizeChange)) Lines").font(.footnote).multilineTextAlignment(.center).foregroundColor(.accentColor)
        }.onChange(of: sizeChange, perform: { value in
            sizeChange = value
        })
        
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
