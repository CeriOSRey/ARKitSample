//
//  ContentView.swift
//  ARKitSample
//
//  Created by Rey Cerio on 2022-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
