//
//  Constant.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 24/05/23.
//

import Foundation

struct Message : Encodable, Decodable {
    let id: Int?
    let created_at: String?
    let textChat: String?
}

enum Constants {

    static var supabaseURL = URL(string: "https://fcgxspvzyezfigxomxrt.supabase.co")!
    static var supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZjZ3hzcHZ6eWV6ZmlneG9teHJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ4NTcyNDUsImV4cCI6MjAwMDQzMzI0NX0.wwny-HM5Voz41oThiMu0ctXjS7q94oLsaHhq-R_QOn8"
}
