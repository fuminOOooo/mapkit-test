//
//  CustomButton.swift
//  TesMapKit
//
//  Created by Elvis Susanto on 23/05/23.
//

import SwiftUI

struct FillButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.custom("SF-Pro-Rounded-Regular", size: 16))
            .padding()
            .frame(height: 44)
            .background(configuration.isPressed ? colors.barGray : colors.black)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(configuration.isPressed ? colors.barGray : colors.black)
            )
            .cornerRadius(6)
            .foregroundColor(configuration.isPressed ? colors.white : colors.white)
    }
}

struct DisabledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.custom("SF-Pro-Rounded-Regular", size: 16))
            .opacity(0.4)
            .padding()
            .frame(height: 44)
            .background(configuration.isPressed ? colors.gray : colors.black)
            .opacity(0.4)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(configuration.isPressed ? colors.gray : colors.black)
                    .opacity(0.4)
            )
            .cornerRadius(6)
            .foregroundColor(configuration.isPressed ? colors.white : colors.white)
    }
}
