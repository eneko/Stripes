//
//  ContentView.swift
//  Shared
//
//  Created by Eneko Alonso on 7/9/20.
//

import SwiftUI
import Stripes

struct ContentView: View {
    var body: some View {
        ZStack {
            Stripes(config: StripesConfig(background: Color.green.opacity(0.6),
                                          foreground: Color.white.opacity(0.3), degrees: 0,
                                          barWidth: 50, barSpacing: 50))
            Text("Hello, world!")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .bold()
        }
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
