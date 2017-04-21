# xcode-shapes
Xcode project for building apps using Shapes template in Swift Playgrounds for iPad.  You can design and test your app on iPad and migrate the code to Mac for enhances and App Store submission.

![Shapes template output](https://github.com/dbystruev/xcode-shapes/blob/master/Resources/xcode-shapes.png)
## Instructions
1. In Swift Playgrounds for iPad, start new playgroundbook (by pressing "+") and select Shapes template.
1. Create a new page or delete all code on one of the existing pages
1. Copy the sample code from [Shapes/Contents.swift](https://github.com/dbystruev/xcode-shapes/blob/master/Shapes/Contents.swift) to an empty page of open playground
1. Design, test, and run your program as normal, all within SwiftPlaygrounds class.  Add new functions to this class, and high level code into run() method of this class
1. After you are done, you will need to copy the code from iPad to Mac.  Please note that "Create PDF" feature in Swift Playgrounds creates an image-based file without text information, so it is impossible to copy and paste text from it.  On Mac, open the xcode-shapes project (Shapes.xcodeproj) with Xcode.  On iPad, select all code in Swift Playgrounds, copy it and paste:
   * if you have [Universal Clipboard](https://support.apple.com/kb/PH25168) turned on — directly to Xcode for Mac into Shapes/Contents.swift file, replacing everything in it, OR
   * to some 3rd place, like [GitHubGist](https://gist.github.com), where you can access the code from your Mac
1. If you added any images or other files into your code on iPad, you need to add the same files into Resources folder in xcode-shapes project (Shapes.xcodeproj) on Mac
1. Try to build and run your app.  If something does not work, try compiling the original code in runSwiftPlaygrounds() first.
## Copyright notice
This work is based on the code derived from:
* Shapes template in [Swift Playgrounds](https://itunes.apple.com/us/app/swift-playgrounds/id908519492) for iPad by Apple
* Converted Playgroundbooks by [Kush Taneja](https://github.com/kushtaneja)

You can use this work freely if not prohibited by your local laws.

Started by [Denis Bystruev](https://github.com/dbystruev/) from [learnSwift.ru](http://learnSwift.ru) on 13th of April 2017.

Feel free to contract me via e-mail in [my GitHub profile](https://github.com/dbystruev/).
