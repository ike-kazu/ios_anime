//
//  LoginView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/24.
//

import SwiftUI
import Domain

struct LoginView: View {

    @ObservedObject var state: LoginState

    var body: some View {
        NavigationView {
            VStack {
                Text("Anime App")
                    .font(.largeTitle)
                    .bold()
                Image("launch_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 320)
                Form {
                    Section("ログイン") {
                        Button {
                        } label: {
                            Text("Twitterでサインイン")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .listRowBackground(Color.accentColor)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(state: LoginState(apiClient: APIClientImpl()))
    }
}
