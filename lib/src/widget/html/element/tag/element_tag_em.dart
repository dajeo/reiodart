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
/// with the `<em>` tag.
class Em extends WidgetElementVisible {
  /// The `<em>` HTML element marks text
  /// that has stress emphasis.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/em)
  Em([super.value]) {
    tag = 'em';
  }
}
