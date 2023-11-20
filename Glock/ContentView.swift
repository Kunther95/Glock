//
//  ContentView.swift
//  Glock
//
//  Created by Fabio Attianese on 14/11/23.
//

import SwiftUI
import SwiftData
import UIKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query  var items: [Item]
    @State private var showToggle = false
    @State private var date = Date()
    @State var dateString: String = ""
    var index: Int = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                HStack{
                    Image(systemName: "bed.double.fill")
                    Text("Sleep Wake up ")
                        .font(.title3)
                        .bold()
                }
                HStack{
                    Text("No Alarm")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.secondary)
                        
                    
                    Spacer()
                    
                    Button("SET UP") {
                        updateCheckedValue(items: items)
                    }
                    
                }
                    Spacer()
                    HStack{
                        Text("Other")
                            .font(.title3)
                            .bold()
                    }
                
               
                    ForEach(items){ item in
                        HStack{
                            Text(item.time.formatted(date: .omitted, time: .shortened))
                                .font(.title3)
                                .foregroundStyle(.secondary)
                            
                            Toggle("", isOn: Bindable(item).ischecked)
                            DatePicker("", selection: Bindable(item).time, displayedComponents: .hourAndMinute)
                        }
                       
                        
                        
                    }
                }
                
            }
            .navigationTitle("Alarms")
            
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                        
                    }
                
            }
        }
        }
            
          
        
    }
    
    
    private func updateCheckedValue(items: [Item]){
        
    }
    private func addItem() {
        withAnimation {
            
            let newItem = Item(time: Date(), ischecked: false)
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
