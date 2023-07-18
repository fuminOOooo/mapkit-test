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
    
    var schedule: [String] = ["", "Apple Academy",
                             "Bundaran HI",
                             "Dukuh Atas BNI",
                             "Setiabudi Astra",
                             "Bendungan Hilir",
                             "Istora Mandiri",
                             "Senayan",
                             "Asean",
                             "Blok M",
                             "Blok A",
                             "Haji Nawi",
                             "Cipete Raya",
                             "Fatmawati",
                             "Lebak Bulus Grab"]
    
    @Binding var time: String

    var body: some View {
        VStack(alignment: .center,spacing: 0) {
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

