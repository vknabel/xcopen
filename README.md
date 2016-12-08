# xcopen

Opens Xcode Workspaces, Projects and generates them for Swift Package Manager projects.

```bash
$ xcopen # tries to open workspaces, projects or generating the project
generated: ./xcopen.xcodeproj
$ xcopen work # Will only open workspaces
$ xcopen proj # Will only open projects if they exist
$ xcopen pm # Always generates project from Package.swift and opens it
generated: ./xcopen.xcodeproj
```

## Installation

The easiest way to install xcopen is by using [Rock](https://github.com/vknabel/Rock).

```bash
$ rock install xcopen
```

## Author

Valentin Knabel, [@vknabel](https://twitter.com/vknabel), dev@vknabel.com

## License

xcopen is available under the [MIT](LICENSE) license.
