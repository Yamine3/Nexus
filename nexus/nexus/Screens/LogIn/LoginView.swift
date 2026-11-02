//
//  LoginView.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(AuthService.self) private var authService
    
    @State private var viewModel = LoginViewModel()
    
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
                                
                                authentificationTextField(placeholderLogin: "Enter your email", textInTextField: $viewModel.email)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                //pour éviter les corrections automatiques
                                
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Password")
                                
                                authentificationSecureField(placeholderLogin: "Enter your password", textInTextField: $viewModel.password)
                                
                            }
                            
                        }
                        
                        VStack(spacing: 20) {
                            
                            redirectionToSignUpRow(redirectionQuestion: "Don’t have an account ?")
                            
                            Button {
                                Task {
                                    await viewModel.login(authService: authService)
                                }
                       
                            } label: {
                                labelButton(
                                    label: viewModel.isLoading ? "Connecting..." : "Log-in",
                                    labelColor: .accentPurple,
                                    background: .white
                                )
                            }
                            .disabled(viewModel.isLoading)
                            
                            if viewModel.isLoading {
                                ProgressView()
                                    .tint(.white)
                            }
                            
                            if let errorMessage = viewModel.errorMessage {
                                Text(errorMessage)
                                    .foregroundStyle(.red)
                                    
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
