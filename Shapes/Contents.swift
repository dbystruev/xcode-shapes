//
//  Contents.swift
//  Shapes
//
//  Started by Denis Bystruev on 13/04/2017.
//  Copyright © 2017 Denis Bystruev. All rights reserved.
//  https://github.com/dbystruev
//  http://learnSwift.ru
//
//  The code below is derived from:
//  — Shapes template in Swift Playgrounds for iPad by Apple
//  — Converted Playgroundbooks by Kush Taneja (https://github.com/kushtaneja)

// Any code developed for Shapes template
// for Swift Playgrounds for iPad goes into this run() function of this class
class Contents {
    #if DEBUG || RELEASE
    // This code runs during DEBUG or RELEASE in Xcode
    let view = Canvas.shared.backingView
    #endif
    
    // The code to start with
    init() {
        #if DEBUG || RELEASE
            // This code runs in Xcode for Mac
            // Make the backgound white
            Canvas.shared.color = .white
        #else
            // This code runs in Swift Playgrounds for iPad
            run()
        #endif
    }
    
    // The code to run
    func run() {
        #if DEBUG
            // This code runs during DEBUG in Xcode
            // Find out visible screen's width and height in virtual units
            let width = Canvas.shared.visibleSize.width
            let heigth = Canvas.shared.visibleSize.height
            print("width = \(width), heigth = \(heigth)")
        #endif
        
        // Start with rotating line
        rotatingLine()
    }
    
    // Show a line with two controlling text labels to rotate it
    func rotatingLine() {
        // create a line.
        let line = Line(start: Point(x: -10, y: 0), end: Point(x: 10, y: 0))
        line.color = .blue
        line.center.y += 6
        
        // create a Text object that, when tapped, will kick off the clockwise rotation animation.
        let rotateClockwiseText = Text(string: "Rotate Line Clockwise", fontSize: 21.0)
        rotateClockwiseText.color = .blue
        rotateClockwiseText.center.y -= 7
        
        // create a Text object that, when tapped, will kick off the counter-clockwise rotation animation.
        let rotateCounterClockwiseText = Text(string: "Rotate Line Counter Clockwise", fontSize: 21.0)
        rotateCounterClockwiseText.color = .blue
        rotateCounterClockwiseText.center.y -= 12
        
        // create a Text object that, when tapped, will move to shape showcase
        let nextText = Text(string: ">", fontSize: 50, color: .blue)
        nextText.center.y -= 25
        
        // rotate the line clockwise with animation when the "Rotate Line Clockwise" text is tapped.
        rotateClockwiseText.onTouchUp {
            animate {
                line.rotation += .pi/4
            }
        }
        
        // rotate the line counter clockwise with animation when the "Rotate Line Counter Clockwise" text is tapped.
        rotateCounterClockwiseText.onTouchUp {
            animate {
                line.rotation -= .pi/4
            }
        }
        
        // move forward to shape showcase when the ">" is tapped
        nextText.onTouchUp {
            nextText.remove()
            rotateCounterClockwiseText.remove()
            rotateClockwiseText.remove()
            line.remove()
            self.shapeShowcase()
        }
    }
    
    // Draw different shapes, text, and an image
    func shapeShowcase() {
        // 1. Create a circle
        let circle = Circle(radius: 3)
        circle.center.y += 23
        
        // 2. Create a rectangle
        let rectangle = Rectangle(width: 10, height: 5, cornerRadius: 0.75)
        rectangle.color = .purple
        rectangle.center.y += 14
        
        // 3. Create a line
        let line = Line(start: Point(x: -10, y: 9), end: Point(x: 10, y: 9), thickness: 0.5)
        line.center.y -= 2
        line.rotation = 170 * (.pi/180)
        line.color = .yellow
        
        // 4. Create text
        let text = Text(string: "Hello world!", fontSize: 32.0, fontName: "Futura", color: .red)
        
        // 5. Create an image
        let image = Image(name: "SwiftBird", tint: .green)
        image.size.width *= 0.5
        image.size.height *= 0.5
        image.center.y -= 7
        
        // 6. Create a pattern with rectangles
        let numRectangles = 4
        var rectangles : [Rectangle] = []
        var xOffset = Double((numRectangles/2) * (-1))
        var yOffset = -19.0
        let saturationEnd = 0.911
        let saturationStart = 0.1
        let saturationStride = (saturationEnd - saturationStart)/Double(numRectangles)
        
        for i in 0...numRectangles {
            
            let rectangle = Rectangle(width: 10, height: 5, cornerRadius: 0.75)
            
            // set the color.
            let saturation = saturationEnd - (Double(numRectangles - i) * saturationStride)
            rectangle.color = Color(hue: 0.079, saturation: saturation, brightness: 0.934)
            
            // calculate the offset.
            rectangle.center = Point(x: xOffset, y: yOffset)
            xOffset += 1
            yOffset += 1
            
            rectangles.append(rectangle)
        }
        
        // create a Text object that, when tapped, will move to rotating line
        let prevText = Text(string: "<", fontSize: 50, color: .blue)
        prevText.center.x -= 2
        prevText.center.y -= 25
        
        // create a Text object that, when tapped, will move to draggable circle
        let nextText = Text(string: ">", fontSize: 50, color: .blue)
        nextText.center.x += 2
        nextText.center.y -= 25
        
        // clear the canvas
        func clearCanvas() {
            nextText.remove()
            prevText.remove()
            for i in (0 ..< rectangles.count).reversed() {
                rectangles[i].remove()
            }
            image.remove()
            text.remove()
            line.remove()
            rectangle.remove()
            circle.remove()
        }
        
        // move back to rotating line when the "<" is tapped
        prevText.onTouchUp {
            clearCanvas()
            self.rotatingLine()
        }
        
        // move forward to draggable circle when the ">" is tapped
        nextText.onTouchUp {
            clearCanvas()
            self.draggableCircle()
        }
    }
    
    // Draw a circle with changing color which is dragged to the touch point
    func draggableCircle() {
        // create a circle and make it draggable.
        let circle = Circle(radius: 7.0)
        circle.color = Color.purple
        circle.draggable = true
        
        // when the circle is touched, make it darker and give it a shadow.
        circle.onTouchDown {
            circle.color = circle.color.darker()
            circle.dropShadow = Shadow()
        }
        
        // when the touch ends on the circle, change its color to a random color.
        circle.onTouchUp {
            circle.color = Color.random()
            circle.dropShadow = nil
        }
        
        // jump the circle to the the point on the canvas that was touched.
        Canvas.shared.onTouchUp {
            circle.center = Canvas.shared.currentTouchPoints.first!
            circle.dropShadow = Shadow()
        }
        
        // create a Text object that, when tapped, will move to shape showcase
        let prevText = Text(string: "<", fontSize: 50, color: .blue)
        prevText.center.y -= 25
        
        // move back to shape showcase when the "<" is tapped
        prevText.onTouchUp {
            prevText.remove()
            circle.remove()
            self.shapeShowcase()
        }
    }
}

#if !DEBUG && !RELEASE
    // This code runs in Swift Playgrounds for iPad
    import PlaygroundSupport
    let _ = SwiftPlaygrounds()
#endif
