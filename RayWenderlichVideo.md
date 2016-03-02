# 1. Custom Control

## Connect your control with Interface builder

Mark your UIView Class with `@IBDesignable` , `@IBInspectable`, you could also do a lot of customization through code, like update
tintColor for your control's subview to keep consistent with your control's tintcolor.

## Interaction and UIControl

Five ways to interact with Custom UIControl
1. Target-Action

     button.addTarget(self, action:"handleTap:", forControlEvents: .TouchUpInside)
     func handleTap(sender: UIButton) {
        print("You tapped the button!")
     }
     
  You could change your class to be subclass of UIControl, then use some method to detect tap gesture, like `tapGestureRecognizer`, then
  call `sendActionForControlEvents()`
  
2. Delegation

3. Command Parttern: Callback

4. Notification: clunky

5. Key-Value Observation

## Drawing with Layers

# 2. iOS Animations

## Non Auto Layout Animations




