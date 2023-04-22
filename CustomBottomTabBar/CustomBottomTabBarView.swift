//
//  CustomBottomTabBarView.swift
//  CustomBottomTabBar
//
//  Created by Osaretin Uyigue on 4/22/23.
//

import SwiftUI

struct CustomBottomTabBarView: View {
    @State private var currentTab = 1
    var body: some View {
        HStack {
        
            TabBarButton(imageName: "house.fill")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    currentTab = 0
                }
            

            TabBarButton(imageName: "house.fill")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    currentTab = 1
                }
            
            TabBarButton(imageName: "house.fill")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    currentTab = 2
                }

        }
        .tint(Color.black)
        .padding(10)
        .background(Color.white)
        .clipShape(Capsule(style: .continuous))
        .overlay {
            ZStack {
                Circle()
                    .padding(8)
                    .frame(width: 60, height: 60)
                
                TabBarButton(imageName: "camera.fill")
                    .foregroundColor(.white)
            }
            .offset(x: horizontalOffset)
        }
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.65), value: currentTab)
    }
    
    
    var horizontalOffset: CGFloat {
        if currentTab == 0 {
            return -60
        } else if currentTab == 1 {
            return 0
        } else {
            return 60
        }
    }
}

private struct TabBarButton: View {
    let imageName: String
    var body: some View {
//        Button {
//            //
//        } label: {
//            Image(systemName: imageName)
//                .renderingMode(.template)
//                .tint(.black)
//
//        }
        Image(systemName: imageName)
            .renderingMode(.template)
            .tint(.black)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBottomTabBarView()
    }
}
