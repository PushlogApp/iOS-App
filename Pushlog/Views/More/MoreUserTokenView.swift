//
//  MoreUserTokenView.swift
//  Pushlog
//
//  Created by Laurens on 07.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct MoreUserTokenView: View {
    
    let appUser: AppUser
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ScrollView {
                     Text("\(appUser.userToken)").padding()
                    }
                }.background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(UIColor.systemGray6))).padding()
                Button(action: {
                    ClipboardUtils.writeToken(token: self.appUser.userToken)
                }) {
                    Text("Copy Token")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("lightBlue")))
                        .padding(.bottom)
                }.padding(.horizontal)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color("lightBlue")))
                        .padding(.bottom)
                }.padding(.horizontal)
            }.navigationBarTitle("Token", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done").fontWeight(.semibold)
                })
        }
    }
}

struct MoreUserTokenView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
