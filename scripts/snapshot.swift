import AppKit
import WebKit
// Renders a page with WebKit (what Safari uses) and saves a PNG, for checking layouts without a browser.
// Usage: swift scripts/snapshot.swift <url> <width> <out.png> <light|dark> [max-height]
// Without max-height it captures the full page height.
let args = CommandLine.arguments
let url = URL(string: args[1])!, width = CGFloat(Double(args[2])!), out = args[3], dark = args[4] == "dark"
let app = NSApplication.shared
app.setActivationPolicy(.prohibited)
final class Loader: NSObject, WKNavigationDelegate {
    let web: WKWebView
    let window: NSWindow
    init(width: CGFloat, dark: Bool) {
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: width, height: 900), styleMask: [.borderless], backing: .buffered, defer: false)
        window.appearance = NSAppearance(named: dark ? .darkAqua : .aqua)
        web = WKWebView(frame: NSRect(x: 0, y: 0, width: width, height: 900))
        web.appearance = window.appearance
        super.init()
        window.contentView = web
        web.navigationDelegate = self
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            webView.evaluateJavaScript("document.documentElement.scrollHeight") { value, _ in
                let full = CGFloat((value as? Double) ?? 900); let h = args.count > 5 ? min(full, CGFloat(Double(args[5])!)) : full
                self.window.setContentSize(NSSize(width: webView.frame.width, height: h))
                webView.frame = NSRect(x: 0, y: 0, width: webView.frame.width, height: h)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    let config = WKSnapshotConfiguration()
                    config.rect = webView.bounds
                    webView.takeSnapshot(with: config) { image, error in
                        guard let image, let tiff = image.tiffRepresentation, let rep = NSBitmapImageRep(data: tiff),
                              let png = rep.representation(using: .png, properties: [:]) else { print("fail", error as Any); exit(1) }
                        try! png.write(to: URL(fileURLWithPath: out)); print("ok", Int(h)); exit(0)
                    }
                }
            }
        }
    }
}
let loader = Loader(width: width, dark: dark)
loader.web.load(URLRequest(url: url))
DispatchQueue.main.asyncAfter(deadline: .now() + 30) { print("timeout"); exit(2) }
app.run()
