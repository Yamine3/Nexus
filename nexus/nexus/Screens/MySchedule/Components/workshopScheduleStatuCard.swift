////
////  workshopScheduleStatuCard.swift
////  testNexusProject
////
////  Created by apprenant92 on 30/10/2026.
////
//
//import SwiftUI
//
//struct workshopScheduleStatuCard: View {
//    
//    let reservation : ReservationModel
//    
//    var body: some View {
//        
//        Text(reservation.status.rawValue)
//            .font(.custom("Inter18pt-Medium", size: 14))
//            .padding(.vertical, 2)
//            .padding(.horizontal, 5)
//            .background(.backgroundPurple)
//            .cornerRadius(10)
//    }
//}
//
//#Preview {
//    workshopScheduleStatuCard(reservation: ReservationModel(workshop: WorkshopModel(
//        id: UUID(),
//        name: "Pop Quiz: 90's gaming",
//        startTime: .now,
//        endTime: .now.addingTimeInterval(7200),
//        capacityMax: 20,
//        remainingPlaces: 5,
//        category: "Gaming"
//    ),
//        status: StatusEnum.valid))
//}
