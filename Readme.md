```swift
rootFlexContainer.flex.justifyContent(.center).padding(10).define { (flex) in
        flex.addItem(button1) // View1
        flex.addItem(button2).marginTop(10) // View2
        flex.addItem(button3).marginTop(10) // View3
    }
``` 
