////
////  PopUpTimeComponent.swift
////  BLINK
////
////  Created by Jeremy Christopher on 27/06/23.
////
//
//import SwiftUI
//
//struct popUpDest: View {
//    var schedule:[Station] = stations
//    @Binding var time:String
//
//
//    var body: some View {
//        VStack(alignment: .center,spacing: 0){
//            Picker("Selected Halte", selection: $time) {
//                ForEach(schedule, id: \.self) { halteName in
//                        Text(halteName.name)
//                    }
//            }
//            .frame(maxWidth: .infinity)
//            .clipped()
//            .pickerStyle(.inline)
//            .overlay(alignment: .top) {
//                Text("Starting Bus Stop")
//                    .font(.system(size: 17, weight: .semibold))
//                    .frame(maxWidth: .infinity)
//                    .padding([.top,. bottom], 25)
//                    .background(.white)
//            }
//        }
//        .background(.white)
//        .transition(.move(edge: .bottom))
//    }
//}
//
//struct PopUpTimeComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        popUpDest(time: Binding.constant("sad"))
//    }
//}


//  PopUpTimeComponent.swift
//  BLINK
//
//  Created by Jeremy Christopher on 27/06/23.


import SwiftUI

struct popUpDest: View {
    var schedule:[String] = ["", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00"]
    @Binding var time:String

    var body: some View {
        VStack(alignment: .center,spacing: 0){
            Picker("Selected Halte", selection: $time) {
                ForEach(schedule, id: \.self) { halteName in
                           Text(halteName)
                    }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .pickerStyle(.inline)
            .overlay(alignment: .top) {
                Text("Starting Bus Stop")
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding([.top,. bottom], 25)
                    .background(.white)
            }
        }
        .background(.white)
        .transition(.move(edge: .bottom))
    }
}

struct PopUpTimeComponent_Previews: PreviewProvider {
    static var previews: some View {
        popUpDest(time: Binding.constant("sad"))
    }
}

