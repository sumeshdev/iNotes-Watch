//
//  DetailView.swift
//  iNotes-Watch WatchKit Extension
//
//  Created by Sumesh Vs on 13/07/21.
//

import SwiftUI

struct DetailView: View {
    let notes : Notes
    let count : Int
    let indexSet : Int
    @State private var isPresentedSetting = false
    @State private var isPresentedInfo = false
    var body: some View {
       VStack(alignment: .center, spacing: 8){
            HeaderView(heading: "Note")
                ScrollView(.vertical, showsIndicators: true) {
                    VStack{
                       
                        Text(notes.text).font(.title3).multilineTextAlignment(.center)
                }
                }
            Spacer()
       
                HStack {
                    Button(action: {
                        isPresentedSetting.toggle()
                    }, label: {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }).buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isPresentedSetting, content: {
                        SettingsView()
                    })

                    Spacer()
                    Text("\(count) / \(indexSet + 1)")
                    Spacer()
                    Button(action: {
                        isPresentedInfo.toggle()
                        
                    }, label: {
                        Image(systemName: "info.circle")
                            .imageScale(.large)
                    }).buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isPresentedInfo, content: {
                       InfoView()
                    })
                }
            }
            }
    }

struct DetailView_Previews: PreviewProvider {
    static var exampleData: Notes = Notes(id: UUID(), text: "Hello")
    static var previews: some View {
        DetailView(notes: exampleData, count: 6, indexSet: 1)
    }
}
