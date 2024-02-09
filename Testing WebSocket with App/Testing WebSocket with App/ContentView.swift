//
//  ContentView.swift
//  Testing WebSocket with App
//
//  Created by Victor Rodriguez on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var socketManager = WebSocketManager()
    @State private var message = ""
    
    
    var body: some View {
        VStack {
           Text("WebSocket Chat")
                .font(.title)
                .padding()
            
            Divider()
            
            ScrollView{
                Text(socketManager.recivedMessage)
                    .padding()
            }
            
            Divider()
            
            HStack{
                TextField("Enter Message", text: $message)
                    .padding()
                
                Button("Send") {
                    socketManager.send(message)
                    message = ""
                }
                .padding()
            }
        }
        .padding()
        .onReceive(socketManager.$recivedMessage) { _ in
            print ("User Said: \(message)")
        }
    }
}

#Preview {
    ContentView()
}
