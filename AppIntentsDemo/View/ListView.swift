//
//  ContentView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 30/05/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
                HStack{
                    ItemListRowView(items: item)
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                listViewModel.updateItem(item:item)
                            }
                        }
                }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("Your Items")
        .navigationBarItems(leading: EditButton(), trailing:
                                NavigationLink("Add", destination: AddView()))
    }
}


#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}
