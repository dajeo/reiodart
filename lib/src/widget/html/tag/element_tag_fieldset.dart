// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'dart:html';

import '../../../virtual_dom/virtual_node_attr.dart';
import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [ReioElement] that contains a virtual_dom
/// with the `<fieldset>` tag.
class FieldSet extends ReioElementVisible {
  /// The `<fieldset>` HTML element is used
  /// to group several controls
  /// as well as labels (`<label>`) within a web form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset)
  FieldSet([super.value]) {
    setHtmlTag('fieldset');
  }

  /// The scroll event fires when an element
  /// has been scrolled.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/API/Element/scroll_event)
  FieldSet onScroll(Function(Element, Event)? fun) {
    if (fun != null) on.call('scroll', fun);
    return this;
  }

  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset#attr-disabled)
  FieldSet disabled(bool boolean) {
    if (boolean && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('disabled', '');
      node.attrs!.add(attr);
    }
    return this;
  }

  /// This attribute takes the value of the id attribute
  /// of a `<form>` element you want the `<fieldset>` to be part
  /// of, even if it is not inside the form.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset#attr-form)
  FieldSet form(String id, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('form', id);
      node.attrs!.add(attr);
    }
    return this;
  }

  /// The name associated with the group.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset#attr-name)
  FieldSet name(String name, [bool? removeIf]) {
    if (removeIf != true && node.attrs != null) {
      ReioNodeAttr attr = ReioNodeAttr('name', name);
      node.attrs!.add(attr);
    }
    return this;
  }
}