# Stripes

Beautiful background pattern views for SwiftUI. 

## Example Patterns

### Diagonal Bars

![Stripes SwiftUI](Documentation/stripes-swiftui-macos.png)

```swift
import SwiftUI
import Stripes

struct ContentView: View {
    var body: some View {
        ZStack {
            Stripes(config: .default)
            
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
```

### Vertical Bars
![Stripes SwiftUI](Documentation/stripes-swiftui-ipad.png)

```swift
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
```

### Overlapping Patterns
![Stripes SwiftUI](Documentation/stripes-swiftui-iphone.png)

```swift
import SwiftUI
import Stripes

struct ContentView: View {
    var body: some View {
        ZStack {
            Stripes(config: StripesConfig(background: Color.red.opacity(0.2),
                                          foreground: Color.blue.opacity(0.6),
                                          degrees: 45, barWidth: 50, barSpacing: 20))
            Stripes(config: StripesConfig(background: Color.red.opacity(0.2),
                                          foreground: Color.white.opacity(0.15),
                                          degrees: -45, barWidth: 50, barSpacing: 20))
            
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
```


## Installation

### Preferred: Add package to Xcode project

1. In Xcode, tap on `File -> Swift Packages -> Add Package Dependency`

1. Enter the package URL `https://github.com/eneko/Stripes`

    ![Stripes Install](Documentation/stripes-install-1.png)

1. Ensure the library is added to the list of Frameworks & Libraries 

    ![Stripes Install](Documentation/stripes-install-2.png)

### Avoid dependencies, copy the code

```swift
public struct StripesConfig {
    var background: Color
    var foreground: Color
    var degrees: Double
    var barWidth: CGFloat
    var barSpacing: CGFloat

    public init(background: Color = Color.pink.opacity(0.5), foreground: Color = Color.pink.opacity(0.8),
                degrees: Double = 30, barWidth: CGFloat = 20, barSpacing: CGFloat = 20) {
        self.background = background
        self.foreground = foreground
        self.degrees = degrees
        self.barWidth = barWidth
        self.barSpacing = barSpacing
    }

    public static let `default` = StripesConfig()
}


public struct Stripes: View {
    var config: StripesConfig

    public init(config: StripesConfig) {
        self.config = config
    }

    public var body: some View {
        GeometryReader { geometry in
            let longSide = max(geometry.size.width, geometry.size.height)
            let itemWidth = config.barWidth + config.barSpacing
            let items = Int(2 * longSide / itemWidth)
            HStack(spacing: config.barSpacing) {
                ForEach(0..<items, id: \.self) { index in
                    config.foreground
                        .frame(width: config.barWidth, height: 2 * longSide)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotationEffect(Angle(degrees: config.degrees), anchor: .center)
            .offset(x: -longSide / 2, y: -longSide / 2)
            .background(config.background)
        }
        .clipped()
    }
}
```
