//
//  SheetManager.swift
//  CustomSheetInSwiftUI
//
//  Created by Tunde Adegoroye on 21/03/2022.
//

import Foundation

final class SheetManager: ObservableObject {
    
//    typealias Config = Action.Info
    
    enum Action {
        case na
        case present
        case dismiss
    }
    
    @Published private(set) var action: Action = .na
    
    func present() {
        guard !action.isPresented else { return }
        self.action = .present
    }
    
    func dismiss() {
        self.action = .dismiss
    }
}

extension SheetManager.Action {
    var isPresented: Bool {self == .present}
}
