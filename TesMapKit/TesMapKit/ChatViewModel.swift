//
//  ChatViewModel.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 24/05/23.
//

import Foundation
import Supabase

class ChatViewModel: ObservableObject {
    
    lazy var client = SupabaseClient(supabaseURL:Constants.supabaseURL, supabaseKey: Constants.supabaseKey)
    @Published var messages: [Message] = []
    
    func newMessage(withID id: Int, andDate created_at: String, andString textChat: String) {
        
        let message = Message(id: id, created_at: created_at, textChat: textChat)
        
        let query = client
            .database
            .from("onWhatDay")
            .insert(values: message)
        
//        let query = client.database
//                    .from("onWhatDay")
//                    .insert(values: message,
//                            returning: .representation)
//                    .select(columns: "")
//                    .single() // specify you want to return a single value.
        
        Task {

            _ = try? await query.execute()

            DispatchQueue.main.async {
                self.messages.append(message)
            }

        }
        
//        Task {
//            do {
//                let response: [Message] = try await query.execute().value
//                print("### Returned: \(response)")
//            } catch {
//                print("### Insert Error: \(error)")
//            }
//        }
        
    }
    
//    private func encode (message: Message) throws -> Any {
//        guard
//            let data = try? JSONEncoder().encode(message),
//            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//        else {
//            print("error while encoding")
//            throw NSError()
//        }
//        return dictionary
//    }
    
}
