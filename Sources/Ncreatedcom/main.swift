import Foundation
import Publish
import Plot

/// An item displayed as button under About section.
struct NavigationItem {
    /// Icon file.
    let iconPath: String
    /// Text displayed next to the icon.
    let caption: String
    /// Destination URL for the link.
    let destinationURL: URL
}

/// Navigation displayed under About section.
struct Navigation {
    let items: [NavigationItem]
}

struct Ncreatedcom: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://n-created.com")!
    var name = "n-created.com"
    var description = ""
    var language: Language { .english }
    var imagePath: Path? { nil }
}

let navigation = Navigation(
    items: [
        .init(
            iconPath: "/social-icons/instagram.svg",
            caption: "watch my travels",
            destinationURL: URL(string: "https://instagram.com/flashu88")!
        ),
        .init(
            iconPath: "/social-icons/github.svg",
            caption: "see my code",
            destinationURL: URL(string: "https://github.com/ncreated")!
        ),
        .init(
            iconPath: "/social-icons/medium.svg",
            caption: "read my post",
            destinationURL: URL(string: "https://medium.com/@ncreated")!
        ),
        .init(
            iconPath: "/social-icons/linkedin.svg",
            caption: "check my profile",
            destinationURL: URL(string: "https://www.linkedin.com/in/maciek-grzybowski-67a61a9")!
        ),
        .init(
            iconPath: "/social-icons/twitter.svg",
            caption: "stay in touch",
            destinationURL: URL(string: "https://twitter.com/ncreated")!
        ),
    ]
)

try Ncreatedcom().publish(
    withTheme: .ncreated(using: navigation),
    indentation: .tabs(1),
    deployedUsing: .gitHub("ncreated/ncreated.github.io", useSSH: true)
)
