//
//  File.swift
//  
//
//  Created by Victor Rodriguez on 2/6/24.
//

import SwiftUI 
import Starscream


struct ContentView: View {
    @State private var message = ""
    @StateObject private var socket = WebSocketManger()
    
    var body: some View {
        VStack {
            TextField("Enter message", text: $message)
                .padding()
            Button("Send") {
                socket.send(message)
                message = ""
            }
            .padding()
            Text(socket.response)
        }
        .padding()
    }
}

class WebSocketManger: ObservableObject, WebSocketDelegate {
    private var socket: Starscream.WebSocket!
    
    @Published var response = ""
    
    init() {
        setupWebSocket()
    }
    
    func setupWebSocket() {
        let url = URL(string: "ws://localhost:8080/chat")!
        socket = WebSocket(request: URLRequest(url: url))
        socket.delegate = self
        socket.connect()
    }
    func send(_ message: String) {
        socket.write(string: message)
    }
    
    func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
        switch event {
        case .text(let text):
            DispatchQueue.main.async {
                self.response = text
            }
        default:
            break
        }
    }
}

