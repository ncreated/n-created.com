// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Ncreatedcom",
    products: [
        .executable(name: "Ncreatedcom", targets: ["Ncreatedcom"])
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Publish", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "Ncreatedcom",
            dependencies: ["Publish"]
        )
    ]
)
