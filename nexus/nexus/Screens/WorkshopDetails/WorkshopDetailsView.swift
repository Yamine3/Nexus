//
//  WorkshopDetail.swift
//  testNexusProject
//
//  Created by apprenant92 on 29/10/2026.
//

import SwiftUI

struct WorkshopDetailsView: View {
    
    var workshopName: String
    
    @State var isReserve: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    ZStack {
                        Color.accentBlue
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 185)
                    .padding(.top, 120)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        categoryCard(categoryName: "Manga")
                        
                        Text(workshopName)
                            .font(.custom("Inter18pt-Bold", size: 28))
                        
                        HStack {
                            workshopInformationCard(symbol: "calendar", title: "Date", text: "Sat, Sep 12")
                            workshopInformationCard(symbol: "hourglass.circle", title: "Time", text: "10:00 - 11:30")
                        }
                        
                        HStack {
                            workshopInformationCard(symbol: "", title: "", text: "")
                                .opacity(0)
                            
                            workshopInformationCard(symbol: "person.3.fill", title: "Capacity", text: "5 / 30 slots left")
                        }
                        
                        Text("About this Workshop")
                            .font(.custom("Inter18pt-Bold", size: 18))
                        
                        workshopDescriptionCard(workshopDescription: "Join us for a hands-on introduction to the basics of Japanese-style manga art. We’ll start with fundamental concepts before diving into practical drawing techniques.\n\nWhat you'll learn: \nFacial anatomy & proportions \nDynamic expressions & emotions \nInking basics & line work \nBeginner friendly — All materials provided on site.")
                        
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity)
            }
            VStack {
                Button {
                    isReserve.toggle()
                } label: {
                    labelButton(
                        label: isReserve ? "Reserved" : "Reserve a spot" ,
                        labelColor: .white,
                        background: isReserve ? .accentGreen : .accentPurple )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
        .background(.white)
        .ignoresSafeArea()
    }
}


#Preview {
    WorkshopDetailsView(workshopName: "Intro to Manga Drawing")
}
