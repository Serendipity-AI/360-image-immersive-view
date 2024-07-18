//
//  ImageFromURLImmersiveView.swift
//  360ImageImmersiveView
//
//  Created by George Alexiou on 17/07/2024.
//

import SwiftUI
import RealityKit

struct ImageFromURLImmersiveView: View {
    var url: URL
    @State private var imageTexture: TextureResource?

    var body: some View {
        RealityView { content in
        } update: { content in
            content.entities.removeAll()
            if let texture = imageTexture {
                let entity = createImmersivePictureFromTexture(texture: texture)
                content.add(entity)
            }
        }
        .task {
            await loadImage()
        }
    }

    private func loadImage() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let uiImage = UIImage(data: data),
               let cgImage = uiImage.cgImage {
                let texture = try await TextureResource.generate(from: cgImage, options: .init(semantic: .color))
                await MainActor.run {
                    self.imageTexture = texture
                }
            }
        } catch {
            print("Failed to load image: \(error)")
        }
    }
}
