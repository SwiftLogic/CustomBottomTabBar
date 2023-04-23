//
//  CustomBottomTabBarView.swift
//  CustomBottomTabBar
//
//  Created by Osaretin Uyigue on 4/22/23.
//

import SwiftUI

enum Tab: String, Hashable, CaseIterable {
    case home = "house"
    case explore = "globe.europe.africa"
    case bookmark = "star"
    case notification = "bell"
    case profile = "person"
}


private let buttonDimen: CGFloat = 55

struct CustomBottomTabBarView: View {
    
    @Binding var currentTab: Tab
    
    var body: some View {
        HStack {
        
            TabBarButton(imageName: Tab.home.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .home
                }
            
            Spacer()

            TabBarButton(imageName: Tab.explore.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .explore
                }

            Spacer()
            
            TabBarButton(imageName: Tab.bookmark.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .bookmark
                }

            Spacer()
            
            TabBarButton(imageName: Tab.notification.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .notification
                }
            
            Spacer()
            
            TabBarButton(imageName: Tab.profile.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .profile
                }

        }
        .frame(width: (buttonDimen * CGFloat(Tab.allCases.count)) + 60)
        .tint(Color.black)
        .padding(.vertical, 2.5)
        .background(Color.white)
        .clipShape(Capsule(style: .continuous))
        .overlay {
            SelectedTabCircleView(currentTab: $currentTab)
        }
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.65), value: currentTab)
    }
    
}

private struct TabBarButton: View {
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.template)
            .tint(.black)
            .fontWeight(.bold)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBottomTabBarView(currentTab: .constant(.explore))
    }
}

struct SelectedTabCircleView: View {
    
    @Binding var currentTab: Tab
    
    private var horizontalOffset: CGFloat {
        switch currentTab {
        case .home:
            return -138
        case .explore:
            return -72
        case .bookmark:
            return 0
        case .notification:
            return 72
        case .profile:
            return 138
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: buttonDimen , height: buttonDimen)
            
            TabBarButton(imageName: "\(currentTab.rawValue).fill")
                .foregroundColor(.white)
        }
        .offset(x: horizontalOffset)
    }

}
