[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# TouchSynthesis

This project is a translation and re-implementation of the touch synthesis code in Matt Gallagher's project from his blog post, ["Synthesizing a touch event on the iPhone"](https://www.cocoawithlove.com/2008/10/synthesizing-touch-event-on-iphone.html).

Matt is a brilliant developer and the reverse-engineering of `UITouch`, `UIEvent`, etc. are his work, not mine. I have merely translated his work to Swift and wrapped it into a small and hopefully convenient framework.

_This framework makes heavy use of private/undocumented API, and should only be used for debugging and testing._

# Usage

After importing the `TouchSynthesis` framework (say, with [Carthage](https://github.com/Carthage/Carthage)), you can dispatch a single-touch, single-tap `UITouch` to any view. Multi-touch and other gestures are currently not supported.

To dispatch a tap:

```Swift
do {
    try self.target.tap(at: .random(insetBy: 20), bypassSubviews: true)
} catch {
    fatalError("\(error)")
}
```

You have four options for the location (in the view's coordinate system) where the tap should occur:

```Swift
public enum Location {
    case center                     // of the target view
    case origin                     // top left corner of the target view
    case point(CGPoint)             // custom location relative to target view's origin
    case random(insetBy: CGPoint)   // random location within the target view's bounds
}
```

By default, a tap on a view will _actually_ land on the front-most view overlapping the touch's coordinates, which means that if a view's subview overlaps the location of a dispatched touch, the subview will intercept the touch.

To short-circuit this behavior and dispatch the touch directly to the view of interest, bypassing its subviews, pass `true` for the `bypassSubviews:` argument.
