//
//  AeroPlanView.swift
//  FlyingMachine
//
//  Created by Ashish Mankar on 02/01/25.
//

import SwiftUI

struct AeroPlanView: View {
    @State var animateAeroplane = false
    var body: some View {
        Image("FlyingMachine", bundle: nil)
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .offset(y: animateAeroplane ? 0 : 8)
            .animation(.easeIn(duration: 0.8).repeatForever(), value: animateAeroplane)
            .onAppear {
                animateAeroplane = true
            }
    }
}

#Preview {
    AeroPlanView()
}
