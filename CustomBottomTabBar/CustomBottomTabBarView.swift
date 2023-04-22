//
//  CustomBottomTabBarView.swift
//  CustomBottomTabBar
//
//  Created by Osaretin Uyigue on 4/22/23.
//

import SwiftUI

enum Tab: String, Hashable {
    case home = "house"
    case star = "star"
    case bookmark = "book.closed"
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

            TabBarButton(imageName: Tab.star.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .star
                }
            
            Spacer()
            
            TabBarButton(imageName: Tab.bookmark.rawValue)
                .frame(width: buttonDimen, height: buttonDimen)
                .onTapGesture {
                    currentTab = .bookmark
                }

        }
        .frame(width: (buttonDimen * 3) + 60)
        .tint(Color.black)
        .padding(8)
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
        CustomBottomTabBarView(currentTab: .constant(.star))
    }
}

struct SelectedTabCircleView: View {
    
    @Binding var currentTab: Tab
    
    private var horizontalOffset: CGFloat {
        switch currentTab {
        case .home:
            return -85
        case .star:
            return 0
        case .bookmark:
            return 85
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
