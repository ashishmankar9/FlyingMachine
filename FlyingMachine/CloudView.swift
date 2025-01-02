//
//  CloudView.swift
//  FlyingMachine
//
//  Created by Ashish Mankar on 02/01/25.
//

import SwiftUI

struct CloudView: View {
    struct Cloud: Identifiable {
        let id = UUID()
        var offset: CGFloat
        var speed: Double
        var size: CGFloat
        var yPosition: CGFloat
    }
    var isBackground = false
    @State private var clouds: [Cloud] = (0..<10).map { index in
        Cloud(
            offset: CGFloat(-300 - (index * 100)),
            speed: Double.random(in: 6...10),
            size: CGFloat.random(in: 40...70),
            yPosition: CGFloat.random(in: -50...50)
        )
    }

    var body: some View {
        ZStack {
            if isBackground {
                Color.cyan
            }
            ForEach(clouds) { cloud in
                Image("Clouds")
                    .resizable()
                    .scaledToFit()
                    .frame(width: cloud.size)
                    .offset(x: cloud.offset, y: cloud.yPosition)
                    .onAppear {
                        animateCloud(id: cloud.id)
                    }
            }
        }
    }

    private func animateCloud(id: UUID) {
        if let index = clouds.firstIndex(where: { $0.id == id }) {
            withAnimation(.linear(duration: clouds[index].speed)) {
                clouds[index].offset = 400
            }

            // Restart the animation once it reaches the end
            DispatchQueue.main.asyncAfter(deadline: .now() + clouds[index].speed) {
                clouds[index].offset = -300
                animateCloud(id: id)
            }
        }
    }
}

#Preview {
    CloudView(isBackground: true)
}
