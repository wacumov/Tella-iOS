//
//  TopBarView.swift
//  Tella
//
//  Created by Ahlem on 08/06/2021.
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct TopBarView: View {
    @Binding var index: Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width

    var body: some View {
        VStack(alignment : .leading, spacing : 0){
            HeaderView(onRefreshClick: {}, onHelpClick: {}, onNewFormClick: {})
            HStack{
                Text("Forms")
                    .font(.system(size: 40))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(width : .none)
                
                Spacer()
            }.background(Color(Styles.Colors.backgroundMain))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
 
            HStack{
                Button(action: {
                    self.index = 1
                    self.offset = width
                }, label: {
                    VStack(spacing: 4){
                        HStack(spacing : 4){
                            Text("Blank")
                                .font(Font.custom("open-sans.regular", size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(self.index == 1 ?.white : Color.white.opacity(0.5))
                        }
                        Capsule()
                            .fill(self.index == 1 ? Color.white : Color.clear)
                            .frame(height : 4)                    }
                })
                Button(action: {
                    self.index = 2
                }, label: {
                    VStack(spacing: 8){
                        HStack(spacing : 12){
                            Text("Drafts")
                                .font(Font.custom("open-sans.regular", size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(self.index == 2 ?.white : Color.white.opacity(0.5))
                        }
                        Capsule()
                            .fill(self.index == 2 ? Color.white : Color.clear)
                            .frame(height : 4)                    }
                })
                Button(action: {
                    self.index = 3
                }, label: {
                    VStack(spacing: 4){
                        HStack(spacing : 4){
                            Text("Outbox")
                                .foregroundColor(self.index == 3 ?.white : Color.white.opacity(0.5))
                                .font(Font.custom("open-sans.regular", size: 20))
                                .fontWeight(.regular)

                            Text("(2)")
                                .foregroundColor(.yellow)
                                .font(Font.custom("open-sans.regular", size: 18))
                                .fontWeight(.regular)

                        }
                        Capsule()
                            .fill(self.index == 3 ? Color.white : Color.clear)
                            .frame(height : 4)                    }
                })
                
                Button(action: {
                    self.index = 4
                }, label: {
                    VStack(spacing: 8){
                        HStack(spacing : 12){
                            Text("Sent")
                                .font(Font.custom("open-sans.regular", size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(self.index == 4 ?.white : Color.white.opacity(0.5))
                        }
                        Capsule()
                            .fill(self.index == 4 ? Color.white : Color.clear)
                            .frame(height : 4)
                    }
                })
            }.padding(.top,  15)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(Color(Styles.Colors.backgroundMain))
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
       FormsView()
    }
}
