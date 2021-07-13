//
//  HeaderView.swift
//  iNotes-Watch WatchKit Extension
//
//  Created by Sumesh Vs on 13/07/21.
//

import SwiftUI

struct HeaderView: View {
  let heading : String
    
    var body: some View {
        VStack {
        HStack {
            Capsule()
                .frame(height: 2)
            Image("squarelogo").resizable().font(.title3).frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Capsule()
                .frame(height: 2)
            
        }.foregroundColor(.accentColor)

        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(heading: "")
    }
}
