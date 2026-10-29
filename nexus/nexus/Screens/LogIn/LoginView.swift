//
//  LoginView.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.accentPurple
                
                VStack(alignment: .leading) {
                    
                    authentificationTopCardView(titleView: "LOG-IN")
                    
                    VStack {
                        
                        VStack(spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Adress email")
                                
                                authentificationTextField(placeholderLogin: "Enter your email", textInTextField: email)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Password")
                                
                                authentificationSecureField(placeholderLogin: "Enter your password", textInTextField: email)
                                
                            }
                        }
                        
                        VStack(spacing: 20) {
                            
                            redirectionToSignUpRow(redirectionQuestion: "Don’t have an account ?")
                            
                            NavigationLink {
//                                if email == "staff@test.com" && password == "password123" {
//                                WorkshopDetail(workshopName: "Intro to Manga Drawing")
//                                }
                            } label: {
                                labelButton(label: "Log-in", labelColor: .accentPurple, background: .white)
                            }
                        }
                        .padding(.top, 10)
                    }
                    .padding(.top, 80)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
}
