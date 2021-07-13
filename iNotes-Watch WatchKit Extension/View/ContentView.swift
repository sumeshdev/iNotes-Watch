//
//  ContentView.swift
//  iNotes-Watch WatchKit Extension
//
//  Created by Sumesh Vs on 11/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [Notes]()
    @State private var textBind = ""
    @AppStorage("sizeChange") var sizeChange: Double = 0.0
    
    func getInternalStorage () -> URL {
        let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urlPath[0]
    }

    func saveItem() {
        let encoder = JSONEncoder()
        do {
            // Encode notes array with json encoder
            let data = try encoder.encode(notes)
            // new url to save the file in internal storage
            let url = getInternalStorage().appendingPathComponent("notes")
            // save the data using write
            try data.write(to: url)

        }catch {
            print("No need to catch any error")
        }
    }

    func loadItem() {
        DispatchQueue.main.async {
            do {
                let decoder = JSONDecoder()
                // get the url using getinternalstorage function
                let url = getInternalStorage().appendingPathComponent("notes")
                //create a new property for the data
                let data = try Data(contentsOf: url)
                // decode the data using json decoder
                notes = try decoder.decode([Notes].self, from: data)


            }catch {
                print("Error Fetching data from local storage")
            }
        }
    }

    func deleteItem(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            saveItem()
            }

    }
    
    var body: some View {
        VStack (spacing: 8){
            HStack {
                TextField("Notes here", text: $textBind)
                Button(action: {
                    
                    guard textBind.isEmpty == false else {
                        return
                    }
                    let entry = Notes(id: UUID(), text: textBind)
                    notes.append(entry)
                    
                    textBind = ""
                 
                    saveItem()
                    
                }, label: {
                    Image(systemName: "plus.circle").font(.title)
                }).fixedSize()
                .buttonStyle(PlainButtonStyle())
                .clipShape(Circle())
                .foregroundColor(.accentColor)
            }
            Spacer()
            if notes.count > 0 {
                
                VStack (spacing: 8){
                    //  Text("\(notes.count)")
                    List {
                        ForEach (0..<notes.count, id: \.self) {
                            i in
                            NavigationLink(destination: DetailView(notes: notes[i], count: notes.count, indexSet: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                      .lineLimit(Int(sizeChange))
                                }
                            }
                        }.onDelete(perform: { indexSet in
                            deleteItem(offsets: indexSet)
                        })
                    }.listStyle(CarouselListStyle()).padding(.top, 8)
                }
            } else {
                VStack (spacing: 8) {
                    Image(systemName: "note.text.badge.plus").font(.system(size: 70))
                }.padding(.top, 10).foregroundColor(.secondary).opacity(0.6)
            }
        }
        .navigationTitle("Notes")
        .onAppear(perform: {
           loadItem()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
