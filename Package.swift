// swift-tools-version: 5.9

import PackageDescription

let version = "4.12.0"
let checksum = "735c5f16733b13a0402cd5db442456052ab2eb4850fed3487efcff65827e3465"

let package = Package(
	name: "opencv-xcframework",
	platforms: [.iOS(.v16)],
	products: [
		.library(name: "OpenCV", targets: ["opencv2", "OpenCVLinkage"]),
	],
	targets: [
		.binaryTarget(
			name: "opencv2",
			url: "https://github.com/vitorrock/opencv-xcframework/releases/download/\(version)/opencv2.xcframework.zip",
			checksum: checksum
		),
		.target(
			name: "OpenCVLinkage",
			linkerSettings: [
				.linkedFramework("Accelerate"),
				.linkedFramework("AVFoundation"),
				.linkedFramework("CoreImage"),
				.linkedFramework("CoreMedia"),
				.linkedFramework("CoreVideo"),
				.linkedLibrary("c++"),
			]
		),
	]
)
