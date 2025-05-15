# Wayfinder

**Wayfinder** is a Swift package designed to simplify navigation in SwiftUI applications.  
It offers a declarative and type-safe approach to routing, making it easier to manage navigation flows in your app.

NOTE: Fork of SwiftfulRouting (https://github.com/SwiftfulThinking/SwiftfulRouting)

## Features

- Declarative routing for SwiftUI
- Type-safe navigation paths
- Support for deep linking
- Easy integration with existing SwiftUI views

## Installation

You can add Wayfinder to your project using Swift Package Manager:

1. In Xcode, go to **File > Add Packages...**
2. Enter the repository URL:
    ```https://github.com/kubamilcarz/Wayfinder.git```
3. Select the latest version and add the package to your project.

## Usage

Here's a basic example of how to use Wayfinder in your SwiftUI app:

```swift
import SwiftUI
import Wayfinder

struct ContentView: View {

    @Environment(\.router) var router

    var body: some View {
        NavigationView {
            VStack {
                Button {
                    router.showScreen(.push) { _ in
                        DetailView()
                    }
                } label: {
                    Text("Go to Detail")
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView: View {

    @Environment(\.router) var router

    var body: some View {
        Button("Dismiss Screen") {
            router.dismissScreen()
        }
        .navigationTitle("Detail")
    }
}
```

In this example, Wayfinder helps manage navigation between a home screen and a detail screen. The `@Environment(\.router)` property wrapper provides access to the router, allowing you to programmatically push and pop views easily.

## Contributing
Contributions are welcome! If you have suggestions for improvements or encounter any issues, please open an issue or submit a pull request.

License
Wayfinder is released under the MIT License. See the LICENSE file for more information.

---

For more details and advanced usage, please refer to the Wayfinder GitHub repository.
