//
//  _360ImageImmersiveViewApp.swift
//  360ImageImmersiveView
//
//  Created by George Alexiou on 17/07/2024.
//

import SwiftUI

@main
struct _360ImageImmersiveViewApp: App {
    @State private var currentImmersionStyle: ImmersionStyle = .full //or .mixed
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //immersive view to add
        ImmersiveSpace(id: "360_image") {
            ImageImmersiveView(imageName: "360_planet")
        }
        .immersionStyle(selection: $currentImmersionStyle, in: .full)
    }
}
