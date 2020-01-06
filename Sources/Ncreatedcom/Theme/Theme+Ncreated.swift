import Publish
import Plot

extension Theme {
    static func ncreated(using navigation: Navigation) -> Self {
        Theme(
            htmlFactory: NcreatedHTMLFactory(navigation: navigation),
            resourcePaths: [
                "Resources/NcreatedTheme/styles.css",
                "Resources/NcreatedTheme/fonts/SourceSansPro-Light.ttf",
                "Resources/NcreatedTheme/fonts/SourceSansPro-Regular.ttf",
            ]
        )
    }
}

private struct NcreatedHTMLFactory<Site: Website>: HTMLFactory {
    let navigation: Navigation

    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body(
                .header(for: context),
                .div(
                    .class("wrapper content clearfix"),
                    .img(.class("avatar"), .src("avatar.jpg")),
                    .div(
                        .class("introduction"),
                        .contentBody(index.body)
                    ),
                    .navigationMenu(navigation)
                ),
                .footer(for: context.site)
            )
        )
    }

    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        notSupportedByThisTheme()
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        notSupportedByThisTheme()
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        notSupportedByThisTheme()
    }

    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        notSupportedByThisTheme()
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        notSupportedByThisTheme()
    }

    private func notSupportedByThisTheme() -> HTML { HTML() }
    private func notSupportedByThisTheme() -> HTML? { nil }
}

private extension Node where Context == HTML.BodyContext {
    static func header<T: Website>(
        for context: PublishingContext<T>
    ) -> Node {
        return .header(
            .div(
                .class("wrapper"),
                .a(.class("site-name"), .href("/"), .text(context.site.name))
            )
        )
    }

    static func navigationMenu(_ navigation: Navigation) -> Node {
        return .ul(
            .class("navigation-items-container"),
            .forEach(navigation.items) { navigationItem in
                .li(
                    .class("navigation-item"),
                    .a(
                        .href(navigationItem.destinationURL),
                        .div(
                            .img(.src(navigationItem.iconPath)),
                            .text(navigationItem.caption)
                        )
                    )
                )
            }
        )
    }

    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            )
        )
    }
}
