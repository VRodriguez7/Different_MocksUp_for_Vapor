//
//  WebSocketManager.swift
//  Testing WebSocket with App
//
//  Created by Victor Rodriguez on 2/9/24.
//

import Starscream
import SwiftUI

class WebSocketManager: ObservableObject, WebSocketDelegate {
    private var socket: WebSocket!
    @Published var recivedMessage: String = ""
    var messageSentCallback: (() -> Void)?
    
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
        messageSentCallback?()
    }
    
    func didReceive(event: WebSocketEvent, client: WebSocketClient) {
        switch event {
        case .text(let text):
            recivedMessage = text
        default:
            break
        }
    }
}
