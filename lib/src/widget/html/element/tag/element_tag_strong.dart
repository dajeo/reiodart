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
/// with the `<strong>` tag.
class Strong extends WidgetElementVisible {
  /// The `<strong>` HTML element indicates that its contents
  /// have strong importance, seriousness, or urgency.
  /// [Read more...](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/strong)
  Strong([super.value]) {
    tag = 'strong';
  }
}
