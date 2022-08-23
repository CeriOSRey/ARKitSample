//
//  CustomARViewRepresentable.swift
//  ARKitSample
//
//  Created by Rey Cerio on 2022-08-23.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {  }
    
}
