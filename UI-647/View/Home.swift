//
//  Home.swift
//  UI-647
//
//  Created by nyannyan0328 on 2022/08/18.
//

import SwiftUI
import Lottie

struct Home: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab : Tab = .home
    
    @State var animatedIcons : [AnimatedIcon] = {
        
        var tabs : [AnimatedIcon] = []
        
        
        for tab in Tab.allCases{
            
            tabs.append(.init(tabIcont: tab, lottieView: AnimationView(name: tab.rawValue,bundle: .main)))
        }
        
        return tabs
        
        
        
    }()
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection: $currentTab) {
                
                Text("A")
                    .setBG()
                    .tag(Tab.home)
                
                Text("B")
                    .setBG()
                    .tag(Tab.account)
                
                Text("C")
                    .setBG()
                    .tag(Tab.chat)
                
                Text("D")
                    .setBG()
                    .tag(Tab.notifications)
                
                Text("E")
                    .setBG()
                    .tag(Tab.saved)
            }
            
            if #available(iOS 16, *){
                TabBar()
                    .toolbar(.hidden, for: .tabBar)
                
            }
            else{
                
                TabBar()
            }
            
        }
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            ForEach(animatedIcons){icon in
                
                ResizebleLottieView(lottieView:icon.lottieView)
                    .aspectRatio(contentMode: .fit)
                 .frame(width: 30,height: 30)
                  .frame(maxWidth: .infinity,alignment: .center)
                  .contentShape(Rectangle())
                  .onTapGesture {
                      
                      currentTab = icon.tabIcont
                      icon.lottieView.play{_ in
                          
                          
                      }
                  }
                  
                
            }
        
        }
        .padding(.top,10)
        .padding(.horizontal)
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    @ViewBuilder
    func setBG()->some View{
        
        self
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            
            
            Color.black.opacity(0.05).ignoresSafeArea()
        }
     
          
    }
}
