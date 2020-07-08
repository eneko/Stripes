//
//  Stripes.swift
//  
//
//  Created by Eneko Alonso on 7/7/20.
//

import SwiftUI

struct Stripes: View {
    var background: Color = Color.pink.opacity(0.5)
    var foreground: Color = Color.pink.opacity(0.8)
    var degrees: Double = 0
    var barWidth: CGFloat = 20
    var barSpacing: CGFloat = 20

    var body: some View {
        GeometryReader { geometry in
            let longSide = max(geometry.size.width, geometry.size.height)
            let itemWidth = barWidth + barSpacing
            let items = Int(2 * longSide / itemWidth)
            HStack(spacing: barSpacing) {
                ForEach(0..<items) { index in
                    foreground
                        .frame(width: barWidth, height: 2*longSide)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotationEffect(Angle(degrees: degrees), anchor: .center)
            .offset(x: -longSide / 2, y: -longSide / 2)
            .background(background)
        }
        .clipped()
        .drawingGroup()
    }
}

struct Squares: View {
    var degrees: Double = 0
    var body: some View {
        ZStack {
            Stripes(degrees: degrees)
            Stripes(degrees: degrees - 90)
        }
    }
}

struct Stripes_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Stripes().frame(width: 200, height: 200)

            Squares().frame(width: 200, height: 200)

            ZStack {
                Stripes(background: Color.blue.opacity(0.2), foreground: Color.blue.opacity(0.4), degrees: 45)
                Stripes(background: Color.blue.opacity(0.1), foreground: Color.blue.opacity(0.3), degrees: -45)
            }
            .frame(width: 414, height: 896, alignment: .center)
            .background(Color.black)

            ZStack {
                Stripes(background: Color.red.opacity(0.2), foreground: Color.blue.opacity(0.6), degrees: 45)
                Stripes(background: Color.red.opacity(0.2), foreground: Color.white.opacity(0.3), degrees: -45)
            }
            .frame(width: 896, height: 414, alignment: .center)
            .background(Color.black)

            ZStack {
                Stripes(background: Color.white.opacity(0.7), foreground: Color.blue.opacity(0.6), degrees: 30)
            }
            .frame(width: 896, height: 414, alignment: .center)
            .background(Color.black)

            ZStack {
                Stripes(background: Color.red.opacity(0.6), foreground: Color.white.opacity(0.3), degrees: 0)
            }
            .frame(width: 896, height: 414, alignment: .center)
            .background(Color.black)
        }
    }
}

