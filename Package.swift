// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Ncreatedcom",
    products: [
        .executable(name: "Ncreatedcom", targets: ["Ncreatedcom"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Ncreatedcom",
            dependencies: ["Publish"]
        )
    ]
)
