//
//  ListView.swift
//  iNotes-Watch WatchKit Extension
//
//  Created by Sumesh Vs on 13/07/21.
//

import SwiftUI

struct ListView: View {
    let leftText : String
    let rightText : String
    var body: some View {
        
        HStack {
            Text(leftText).multilineTextAlignment(.leading)
            Spacer()
            Text(rightText).multilineTextAlignment(.trailing)
        }.font(.footnote)
        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(leftText: "Left", rightText: "Right")
    }
}
