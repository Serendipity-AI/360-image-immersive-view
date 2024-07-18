//
//  ImageUtils.swift
//  360ImageImmersiveView
//
//  Created by George Alexiou on 17/07/2024.
//

import RealityKit

func createImmersivePicture(imageName: String) -> Entity {
    let modelEntity = Entity()
    if let texture = try? TextureResource.load(named: imageName) {
        return createImmersivePictureFromTexture(texture: texture)
    } else {
        return modelEntity
    }
}

func createImmersivePictureFromTexture(texture: TextureResource) -> Entity {
    let modelEntity = Entity()
    var material = UnlitMaterial()
    material.color = .init(texture: .init(texture))
    modelEntity.components.set(ModelComponent(
        mesh: .generateSphere(radius: 1E3),
        materials: [material]
    ))
    modelEntity.scale = .init(x: -10, y: 10, z: 10)
    modelEntity.transform.translation += SIMD3<Float>(0.0, 1.0, 0.0)
    return modelEntity
}
