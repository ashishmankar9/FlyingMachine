//
//  ContentView.swift
//  FlyingMachine
//
//  Created by Ashish Mankar on 02/01/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            CloudView(isBackground: true)
            AeroPlanView()
            CloudView()
        }
    }
}

#Preview {
    ContentView()
}
