//
//  InfoView.swift
//  iNotes-Watch WatchKit Extension
//
//  Created by Sumesh Vs on 13/07/21.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack (spacing: 8){
            
            HeaderView(heading: "")
            
        List{
            HStack {
                Spacer()
                Image("sumesh").resizable().scaledToFit().frame(width: 64, height: 64, alignment: .center)
                Spacer()
            }.listRowBackground(Color.clear)
        ListView(leftText: "App Name", rightText: "Notes")
        ListView(leftText: "Version", rightText: "1.0.0")
        ListView(leftText: "Developer", rightText: "Sumesh VS")
        ListView(leftText: "Designer", rightText: "Anirudha S")
        ListView(leftText: "Copyright", rightText: "© 2021")
      
        }.listStyle(CarouselListStyle())
    }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
