# xcode-shapes
Xcode project for building apps derived from Shapes template from Swift Playgrounds for iPad.

![Shapes template output](https://github.com/dbystruev/xcode-shapes/blob/master/Resources/xcode-shapes.png)
## Instructions
1. In Swift Playgrounds for iPad, start new playgroundbook (by pressing "+") and select Shapes template.
1. Design, test, and run your program as normal, all within one page.
1. After you are done, you need to copy the code from iPad to Mac.  Please note that "Create PDF" in Swift Playgrounds creates an image-based file without text information, so it is impossible to copy and paste text from it.  First open the xcode-shapes project (Shapes.xcodeproj) with Xcode on Mac.  Select all code in Swift Playgrounds, copy it and paste to:
   * directly to Xcode for Mac into Shapes/Contents.swift file inside runSwiftPlaygrounds() function, if you have [Universal Keyboard](https://support.apple.com/kb/PH25168) turned on, OR
   * to some 3rd place, like [GitHubGist](https://gist.github.com), from where you can access the code on Mac
1. Try to build and run your app.  If something does not work, try compiling the original code in runSwiftPlaygrounds() first.
## Copyright notice
This work is based on the code derived from:
* Shapes template in [Swift Playgrounds](https://itunes.apple.com/us/app/swift-playgrounds/id908519492) for iPad by Apple
* Converted Playgroundbooks by [Kush Taneja](https://github.com/kushtaneja)

You can use this work freely if not prohibited by your local laws.

Started by [Denis Bystruev](https://github.com/dbystruev/) from [learnSwift.ru](http://learnSwift.ru) on 13th of April 2017.

Feel free to contract me via e-mail in [my GitHub profile](https://github.com/dbystruev/).
