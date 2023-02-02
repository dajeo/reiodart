// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<meta>` tag.
class Meta extends ReioElement {
  /// The `<meta>` HTML element represents
  /// metadata that cannot be represented by other
  /// HTML meta-related elements, like `<base>`, `<link>`,
  /// `<script>`, `<style>` or `<title>`.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta)
  Meta([super.value]) {
    setHtmlTag('meta');
  }

  /// This attribute declares the
  /// document's character encoding.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta#attr-charset)
  Meta charSet(String charSet, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('charset', charSet);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute contains the value
  /// for the http-equiv or name attribute,
  /// depending on which is used.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta#attr-content)
  Meta content(String text, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('content', text);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// Defines a pragma directive.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta#attr-http-equiv)
  Meta httpEquiv(String value, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('http-equiv', value);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name and content attributes can
  /// be used together to provide document metadata
  /// in terms of name-value pairs, with the name
  /// attribute giving the metadata name, and the content
  /// attribute giving the value.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta#attr-name)
  Meta name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }
}