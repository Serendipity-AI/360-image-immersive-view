//
//  ImageImmersiveView.swift
//  360ImageImmersiveView
//
//  Created by George Alexiou on 17/07/2024.
//

import SwiftUI
import RealityKit

struct ImageImmersiveView: View {
    var imageName: String
    var body: some View {
        RealityView { content in
            content.add(createImmersivePicture(imageName : imageName))
        }
    }
}
