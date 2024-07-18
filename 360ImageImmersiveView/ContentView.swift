//
//  ContentView.swift
//  360ImageImmersiveView
//
//  Created by George Alexiou on 17/07/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State var isImmersiveModeOn: Bool = false
    
    var body: some View {
        VStack {
            if (isImmersiveModeOn) {
                Button("Close Immersive Space", systemImage: "x.circle"){
                    Task {
                        await dismissImmersiveSpace()
                        isImmersiveModeOn = false
                    }
                }
            } else {
                Button("Open Immersive Space", systemImage: "move.3d"){
                    Task {
                        await openImmersiveSpace(id: "360_image")
                        isImmersiveModeOn = true
                    }
                }
            }
        }
        .padding()
    }
}
