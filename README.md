# opencv-xcframework

[OpenCV](https://github.com/opencv/opencv) as a prebuilt `opencv2.xcframework` for Swift Package Manager.

- iOS 16 and later, arm64 device and arm64 simulator.
- Built from the unmodified OpenCV release tag, with the patches in `patches/`.

## Usage

```swift
.package(url: "https://github.com/vitorrock/opencv-xcframework.git", exact: "4.12.0"),
```

```swift
.product(name: "OpenCV", package: "opencv-xcframework"),
```

## Patches

- `modulemap-explicit-headers.patch`: the module map lists every header explicitly instead of using an umbrella header. This removes the `-Wincomplete-umbrella` warnings in the apps that import `opencv2`.
- `ios-flat-framework-bundle.patch`: the iOS framework uses the flat bundle layout and its `Info.plist` has `CFBundleExecutable` and `MinimumOSVersion`. Xcode rejects the versioned macOS layout for iOS.

## Release

1. Set the OpenCV version in `.version`.
2. Run the **Release** workflow. It builds the xcframework, updates the version and checksum in `Package.swift`, tags the commit and attaches the zip to a GitHub release.

To rebuild the same OpenCV version, pass a new tag, e.g. `4.12.0-1`. Swift Package Manager treats it as a pre-release, so reference it with `exact:`. Do not replace the zip of a published tag: Swift Package Manager caches its checksum.

## License

OpenCV and this package are licensed under the [Apache License 2.0](LICENSE).
