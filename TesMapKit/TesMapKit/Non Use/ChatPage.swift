////
////  ChatPage.swift
////  TesMapKit
////
////  Created by Elvis Susanto on 23/05/23.
////
//
//import SwiftUI
//
//struct ChatPage: View {
//    
//    @State private var notAccepted : Bool = true
//    @State private var isOutside : Bool = false
//    @State private var isInaccessible : Bool = false
//    @State private var currentText : String = ""
//    @ObservedObject var viewModel2 = ChatViewModel()
//    var viewModel : MapViewModel
//    
//    var body: some View {
//        
//        ZStack {
//            
//            colors.backgroundColor.ignoresSafeArea()
//            
//            VStack {
//                
//                // Date, Indicator, and Timer
//                HStack {
//                    
//                    Spacer()
//                    
//                    // Date & Timer
//                    Text("\(viewModel.todaysDate, formatter: DateFormatter().dateFormat())")
//                        .font(Font.custom("SFPro-ExpandedBold", size: 21))
//                        .foregroundColor(colors.white)
//                        .onReceive(viewModel.timer) { _ in
//                                if viewModel.refreshingInZero > 0 {
//                                    viewModel.refreshingInZero -= 1
//                                } else if viewModel.refreshingInZero == 0 {
//                                    viewModel.locationAuthorizationCheck()
//                                    viewModel.checkIfUserIsInInsideRegion(dest: dest)
//                                    viewModel.refreshingInZero = 2
//                                }
//                        }
//                        
//                    // Indicator
//                    if (viewModel.isInside) {
//                        Image(systemName: "checkmark.circle.fill")
//                            .foregroundColor(colors.green)
//                    }
//                    else {
//                        Image(systemName: "x.circle.fill")
//                            .foregroundColor(colors.red)
//                    }
//                    
//                    Spacer()
//                    
//                }
//                .padding()
//                .background(colors.barGray)
//                
//                Spacer()
//                
//                // All Chat Bubbles
//                VStack {
//                    
//                    if (!notAccepted && isOutside && !isInaccessible) {
//                        
//                        ScrollView {
//                            
//                        }
//                        
//                    }
//                    
//                }
//                
//                Spacer()
//                
//                // Text Bar & Send Button
//                HStack {
//                    
//                    // Text Bar
//                    TextField (
//                        text: $currentText,
//                        prompt: Text("Text message..")
//                            .foregroundColor(colors.promptColor)
//                    ) {
//                    }
//                    .foregroundColor(colors.white)
//                    .padding(.leading)
//                    .padding(.trailing)
//                    .frame(height: 38)
//                    .font(Font.custom("SFPro-Light", size: 17))
//                    .background(colors.typingBackground)
//                    .cornerRadius(17)
//                    
//                    // Send Button
//                    if currentText != "" {
//                        
//                        Button {
//                            
//                            viewModel2.newMessage (
//                                withID: .random(in: 0...1000000),
//                                andDate: "cobanih",
//                                andString: currentText
//                            )
//                            
//                            currentText = ""
//                        }
//                        
//                        label: {
//                            Image(systemName: "paperplane.fill")
//                                .foregroundColor(colors.white)
//                        }
//                        
//                    }
//                    
//                }
//                .padding()
//                .background(colors.barGray)
//                
//                
//            }
//            
//            // First Time Modal
////            if notAccepted {
////                Color.black.opacity(0.75)
////                    .edgesIgnoringSafeArea(.all)
////                // Modal View
////                FirstTimeModal(notAccepted: $notAccepted)
////                    .zIndex(1)
////                    .onAppear {
////                        viewModel.serviceAvailabilityCheck()
////                    }
////            }
////            
////            // Outside Location Modal
////            if !viewModel.isInside {
////                Color.black.opacity(0.75)
////                    .edgesIgnoringSafeArea(.all)
////                    .onAppear {
////                        isOutside = true
////                    }
////                // Modal View
////                OutsideLocationModal(isOutside: $isOutside)
////                    .zIndex(1)
////            }
////            
////            // Location Unauthorized Modal
////            if !viewModel.locationAccess {
////                Color.black.opacity(0.75)
////                    .edgesIgnoringSafeArea(.all)
////                    .onAppear {
////                        isInaccessible = true
////                    }
////                // Modal View
////                LocationUnauthorizedModal(isInaccessible: $isInaccessible)
////                    .zIndex(1)
////            }
//            
//        }
//        .navigationBarBackButtonHidden(true)
//        .onAppear {
//            viewModel.serviceAvailabilityCheck()
//        }
//        
//    }
//}
//
//extension DateFormatter {
//    
//    func dateFormat() -> DateFormatter {
//        self.dateStyle = .long
//        return self
//    }
//    
//    func dateFormatString() -> String {
//        self.dateStyle = .long
//        return self.string(from: Date())
//    }
//}
//
//struct ChatPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatPage(viewModel: MapViewModel())
//    }
//}
