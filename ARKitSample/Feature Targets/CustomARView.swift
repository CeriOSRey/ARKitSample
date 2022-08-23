//
//  CustomARView.swift
//  ARKitSample
//
//  Created by Rey Cerio on 2022-08-23.
//

import ARKit
import RealityKit
import SwiftUI

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // custom init and view covers the whole screen
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        placeBlueBlock()
    }
    
    func configurationExample() {
        // Track the device relative to it's environment
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        
        // Not supported in all regions, tracks wrt global coordinates
        let _ = ARGeoTrackingConfiguration()
        
        // Tracks faces in the scene
        let _ = ARFaceTrackingConfiguration()
        
        // Tracks bodies in the scene
        let _ = ARBodyTrackingConfiguration()
    }
    
    func anchorExample() {
        // Attach anchors at specific coordinates in the iPhone-centered coordinate system
        let coordinateAnchor = AnchorEntity(world: .zero)
        
        // Attach anchors to detected planes (this works best on devices with a LIDAR sensor)
        let _ = AnchorEntity(plane: .horizontal)
        let _ = AnchorEntity(plane: .vertical)
        
        // Attach anchors to tracked body parts such as the face
        let _ = AnchorEntity(.face)
        
        // Attach anchors to tracked images, such as markers or visual codes.
        let _ = AnchorEntity(.image(group: "group", name: "name"))
        
        // Have to add the anchor to the scene
        scene.addAnchor(coordinateAnchor)
    }
    
    func entitiyExample() {
        // Load an entity from a usdz file
        let _ = try? Entity.load(named: "usdzFileName")
        
        // Load an entity from a  reality file
        let _ = try? Entity.load(named: "realityFileName")
        
        // Generate an entity with code
        let box = MeshResource.generateBox(size: 1)  // by meter
        let entity = ModelEntity(mesh: box)
        
        // Add entity to an anchor so its placed in the scene
        let anchor = AnchorEntity()
        anchor.addChild(entity)
    }
    
    func placeBlueBlock() {
        let block = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
}
