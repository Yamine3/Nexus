//
//  SignUpView.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct SignUpView: View {
    
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.accentPurple
                
                VStack(alignment: .leading) {
                    
                    authentificationTopCardView(titleView: "SIGN-UP")
                    
                    VStack {
                        
                        VStack(spacing: 15) {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Name")
                                
                                authentificationTextField(placeholderLogin: "Enter your name", textInTextField: name)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Email address")
                                
                                authentificationTextField(placeholderLogin: "Enter your email", textInTextField: name)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Password")
                                
                                authentificationSecureField(placeholderLogin: "Enter your password", textInTextField: email)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Retype password")
                                
                                authentificationSecureField(placeholderLogin: "Confirm your password", textInTextField: email)
                                
                            }
                        }
                        
                        VStack(spacing: 20) {
                            
                            NavigationLink {
//                                WorkshopDetail(workshopName: "Intro to Manga Drawing")
                            } label: {
                                labelButton(label: "Sign-up", labelColor: .accentPurple, background: .white)
                            }
                            
                            redirectionToLogInRow(redirectionQuestion: "Already have an account ?")
                        }
                        .padding(.top, 20)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SignUpView()
}
