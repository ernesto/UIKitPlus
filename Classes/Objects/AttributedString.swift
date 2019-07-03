import Foundation

open class AttributedString {
    var attributedString: NSMutableAttributedString
    
    public init (_ string: String) {
        attributedString = .init(string: string)
    }
    
    private func addAttribute(_ attr: NSAttributedString.Key, _ value: Any, at range: ClosedRange<Int>? = nil) {
        let range = range ?? 0...attributedString.length
        attributedString.addAttribute(attr, value: value, range: range.nsRange)
    }
    
    /// UIColor, default nil: no background
    @discardableResult
    public func background(_ value: UIColor, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.backgroundColor, value, at: range)
        return self
    }
    
    /// Hex color, default nil: no background
    @discardableResult
    public func background(_ value: Int, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.backgroundColor, value.color, at: range)
        return self
    }
    
    /// UIColor, default blackColor
    @discardableResult
    public func foreground(_ value: UIColor, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.foregroundColor, value, at: range)
        return self
    }
    
    /// Hex color, default blackColor
    @discardableResult
    public func foreground(_ value: Int, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.foregroundColor, value.color, at: range)
        return self
    }
    
    @discardableResult
    public func font(v: UIFont, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.font, v, at: range)
        return self
    }
    
    @discardableResult
    public func font(_ identifier: FontIdentifier, _ size: CGFloat, at range: ClosedRange<Int>? = nil) -> AttributedString {
        if let value = UIFont(name: identifier.fontName, size: size) {
            addAttribute(.font, value, at: range)
        }
        return self
    }
    
    /// NSParagraphStyle, default defaultParagraphStyle
    @discardableResult
    public func paragraphStyle(_ value: NSParagraphStyle, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.paragraphStyle, value, at: range)
        return self
    }
    
    /// NSNumber containing integer, default 1: default ligatures, 0: no ligatures
    @discardableResult
    public func ligature(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.ligature, value, at: range)
        return self
    }
    
    /// NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled.
    @discardableResult
    public func kern(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.kern, value, at: range)
        return self
    }
    
    /// NSNumber containing integer, default 0: no strikethrough
    @discardableResult
    public func strikethroughStyle(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.strikethroughStyle, value, at: range)
        return self
    }
    
    /// NSNumber containing integer, default 0: no underline
    @discardableResult
    public func underlineStyle(_ value: NSUnderlineStyle, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.underlineStyle, value.rawValue, at: range)
        return self
    }
    
    /// UIColor, default nil: same as foreground color
    @discardableResult
    public func strokeColor(_ value: UIColor, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.strokeColor, value, at: range)
        return self
    }
    
    /// Hex color, default nil: same as foreground color
    @discardableResult
    public func strokeColor(_ value: Int, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.strokeColor, value.color, at: range)
        return self
    }
    
    /// NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
    @discardableResult
    public func strokeWidth(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.strokeWidth, value, at: range)
        return self
    }
    
    /// Shadow, default nil: no shadow
    @discardableResult
    public func shadow(offset: CGSize = .zero, blur: CGFloat = 0, color: UIColor = .clear, at range: ClosedRange<Int>? = nil) -> AttributedString {
        let shadow = NSShadow()
        shadow.shadowOffset = offset
        shadow.shadowBlurRadius = blur
        shadow.shadowColor = color
        addAttribute(.shadow, shadow, at: range)
        return self
    }
    
    /// NSString, default nil: no text effect
    @discardableResult
    public func textEffect(_ value: String, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.textEffect, value, at: range)
        return self
    }
    
    /// NSTextAttachment, default nil
    @discardableResult
    public func attachment(_ value: NSTextAttachment, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.attachment, value, at: range)
        return self
    }
    
    /// NSTextAttachment(data: Data, ofType: String), default nil
    @discardableResult
    public func attachment(_ data: Data?, type: String, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.attachment, NSTextAttachment(data: data, ofType: type), at: range)
        return self
    }
    
    @discardableResult
    public func link(_ value: URL, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.link, value, at: range)
        return self
    }
    
    @discardableResult
    public func link(_ value: String, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.link, value, at: range)
        return self
    }
    
    /// NSNumber containing floating point value, in points; offset from baseline, default 0
    @discardableResult
    public func baselineOffset(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.baselineOffset, value, at: range)
        return self
    }
    
    /// UIColor, default nil: same as foreground color
    @discardableResult
    public func underlineColor(_ value: UIColor, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.underlineColor, value, at: range)
        return self
    }
    
    /// Hex color, default nil: same as foreground color
    @discardableResult
    public func underlineColor(_ value: Int, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.underlineColor, value.color, at: range)
        return self
    }
    
    /// UIColor, default nil: same as foreground color
    @discardableResult
    public func strikethroughColor(_ value: UIColor, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.strikethroughColor, value, at: range)
        return self
    }
    
    /// Hex color, default nil: same as foreground color
    @discardableResult
    public func strikethroughColor(_ value: Int, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.strikethroughColor, value.color, at: range)
        return self
    }
    
    /// NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
    @discardableResult
    public func obliqueness(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.obliqueness, value, at: range)
        return self
    }
    
    /// NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion
    @discardableResult
    public func expansion(_ value: Float, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.expansion, value, at: range)
        return self
    }
    
    public enum GlyphForm: Int {
        case horizontal, vertical
    }
    
    @discardableResult
    public func glyphForm(_ form: GlyphForm, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.verticalGlyphForm, form.rawValue, at: range)
        return self
    }
    
    @discardableResult
    public func writingDirection(_ direction: NSWritingDirection, at range: ClosedRange<Int>? = nil) -> AttributedString {
        addAttribute(.writingDirection, direction, at: range)
        return self
    }
}