// Copyright (c) MineEjo.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import '../html_element.dart';
import '../html_element_visible.dart';

// Experimental, not standard or obsolete tags and attributes
// are not and will not be implemented. If you notice this,
// send it as a issue to https://github.com/MineEjo/reiodart/issues
// Adapted for HTML version 5.

/// Contains [WidgetElement] that contains a virtual node
/// with the `<kbd>` tag.
class Kbd extends WidgetElementVisible {
  /// The `<kbd>` HTML element represents a span
  /// of inline text denoting textual user input from a keyboard,
  /// voice input, or any other text entry device.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/kbd)
  Kbd([super.value]) {
    tag = 'kbd';
  }
}
