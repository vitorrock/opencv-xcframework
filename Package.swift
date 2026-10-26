// swift-tools-version: 5.9

import PackageDescription

let version = "4.12.0-1"
let checksum = "0be9e42bb68159c698f14e5b36e55d75d139abbc86f91f44d593a6d2560a4ed6"

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
