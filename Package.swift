import PackageDescription

let package = Package(
    name: "xcopen",
    dependencies: [
        .Package(url: "https://github.com/kylef/PathKit", majorVersion: 0, minor: 7),
        .Package(url: "https://github.com/Carthage/Commandant", majorVersion: 0, minor: 11)
    ]
)
