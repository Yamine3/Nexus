//
//  SignUpView.swift
//  testNexusProject
//
//  Created by apprenant92 on 28/10/2026.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(AuthService.self) private var authService
    
    @State private var viewModel = SignUpViewModel()
    
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
                                
                                authentificationTextField(placeholderLogin: "Enter your name", textInTextField:
                                                            $viewModel.name)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Email address")
                                
                                authentificationTextField(placeholderLogin: "Enter your email", textInTextField: $viewModel.email)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Password")
                                
                                authentificationSecureField(placeholderLogin: "Enter your password", textInTextField: $viewModel.password)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                authentificationSubTitle(textFieldTitle: "Retype password")
                                
                                authentificationSecureField(placeholderLogin: "Confirm your password", textInTextField: $viewModel.confirmPassword)
                                
                            }
                        }
                        
                        VStack(spacing: 20) {
                            
                            Button {
                                Task {
                                    await viewModel.signUp(authService: authService)
                                }
                                
                            } label: {
                                
                                labelButton(
                                    label: viewModel.isLoading ? "Creating account..." : "Sign-up",
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
                                    .font(.caption)
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
        .environment(
            AuthService(webService: WebService())
        )
}
