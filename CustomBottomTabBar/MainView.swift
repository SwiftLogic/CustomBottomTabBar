//
//  MainView.swift
//  CustomBottomTabBar
//
//  Created by Osaretin Uyigue on 4/22/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Tab = Tab.star
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("HOME")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red.opacity(0.5))
                    .tag(Tab.home)
                
                Text("STAR")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow.opacity(0.5))
                    .tag(Tab.star)
                
                Text("BOOKMARK")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green.opacity(0.5))
                    .tag(Tab.bookmark)
            }
            CustomBottomTabBarView(currentTab: $selectedTab)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
