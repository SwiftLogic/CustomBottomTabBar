//
//  MainView.swift
//  CustomBottomTabBar
//
//  Created by Osaretin Uyigue on 4/22/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Tab = Tab.bookmark
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("HOME")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red.opacity(0.5))
                    .tag(Tab.home)
                
                Text("EXPLORE")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow.opacity(0.5))
                    .tag(Tab.explore)
                
                Text("BOOKMARK")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green.opacity(0.5))
                    .tag(Tab.bookmark)
                
                Text("NOTIFICATION")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green.opacity(0.5))
                    .tag(Tab.notification)
                
                Text("PROFILE")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green.opacity(0.5))
                    .tag(Tab.profile)
            }
            CustomBottomTabBarView(currentTab: $selectedTab)
                .padding(.bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
