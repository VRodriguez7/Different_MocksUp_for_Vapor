//import SwiftUI
//
//struct ChatView: View {
//    @ObservedObject var webSocketManger: WebSocketManager
//    @State private var messageText = ""
//    
//    var body: some View {
//        VStack {
//            ScrollView {
//                ForEach(WebSocketManager.messages, id:\.self) { message in
//                    MessageRow(message:message)
//                }
//            }
//        
//        MessageInputView(messageText: $messageText, sendMessage: sendMessage)
//    }
//}
//
//func sendMessage() {
//    if !messageText.isEmpty {
//        webSocketManger.send(message: messageText)
//        messageText = ""
//        }
//    }
//}
//
//struct MessageRow: View {
//    let message: String
//    
//    var body: some View {
//        HStack {
//            Text(message)
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct MessageInputView: View {
//    @Binding var messageText: String
//    let sendMessage: () -> Void
//    
//    var body: some View {
//        HStack {
//            TextField("type a message", text: $messageText)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            Button("Send") {
//                sendMessage()
//            }
//            .padding()
//        }
//    }
//}
