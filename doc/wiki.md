This page provides information about the functions and positive practices in reiodart. This is basic information that is recommended to learn before writing your own project.

> The information on this page refers to Reio version 0.1.x!

<br>

# About

Reio.dart is a progressive Dart library for creating UI on the web. It supports reactivity and virtual DOM.

<br>

# Start

You can use a [template](https://github.com/MineEjo/reiodart-demo) to create a project:

```bash
$ git clone https://github.com/MineEjo/reiodart-demo
```

Either [download manually](https://github.com/MineEjo/reiodart-demo/archive/refs/heads/master.zip) or use it as the [template directly](https://github.com/MineEjo/reiodart-demo/generate).

<br>

# Structure

The basic structure of your project should be like this:

```markdown
- web
  - components
    - app.reio.dart
  - main.dart
  - index.html
  - global.css
- analysis_options.yaml
- pubspec.lock
- pubspec.yaml
```

This is the minimum set used in the standard template for proper operation of the library.

<br>

# Component

The component represents one or more virtual nodes. Virtual nodes make up the virtual DOM. They are in the `components` folder.

**Example:**

```markdown
- web
  - components
    - name.reio.dart
```

<br>

### File

In a name of the component (file), it is recommended to add the prefix `.reio` before `.dart`. To make it clear what the file is used for.

**Example:**

```markdown
counter.dart --> `countter.reio.dart`
```

<br>

### Naming

The name of a virtual node component consists of the prefix `$` and the name with a capital letter. It looks rather specific, but it distinguishes components from elements well, since they are both virtual nodes, this is the only reason the symbol is added.

**Example:**

```dart
VirtualNode $ComponentName(...) {...}
```

<br>

### Options

Components take options, you can use them to specify a target for embedding a component.

**Example, with the main parent:**

> web/components/app.reio.dart

```dart
import 'dart:html';

import 'child.reio.dart';

import 'package:reio/reio.dart';

VirtualNode $App([ComponentOptions options]) {
  Watcher watcher = Watcher();

  watcher.watch(() {
    watcher.components(() {
      $Child({'target': document.getElementById('app')});
    });
  });

  return watcher.virtualNode;
}
```

This method of embedding in `HTML` works for the main parents, it is one by default. And it is initialized in `main()`.

> web/main.dart

```dart
import 'components/app.reio.dart';

void main() {
  $App();
}
```

Do not use in the target, `document.get...` without needing to, it will cause a malfunction.

<br>

## Interaction

In version `0.1.x` there is no clear distinction between virtual nodes, elements, components and functions, all of which can be a virtual node. It's easy to get confused about this, so there will be an explanation of almost every line of code next.

> web/components/example.reio.dart

```dart
1   | import 'package:reio/reio.dart';
2   |
3   | VirtualNode $Example([ComponentOptions options]) {
```

To explicitly store the construction `(HTML)` of a component, it is recommended to put it in the corresponding function.

```dart
4   |  VirtualNode render() {
5   |    return div();
6   |  }
```

<br>

### Mount

A special class, Watcher, is used to help you interact with the component. An example of initialization.

```dart
7   |  watcher.init(() {
8   |    watcher.virtualNode = render();
9   |    watcher.virtualNode.mount(options!['target']);
10  |  });
```

<br>

### Destroy

After initialization, you can destroy the component by also removing it from the DOM.

```dart
watcher.virtualNode.destroy();
```

<br>

### Syntax

When creating a construction, it is important to understand what you are writing and what type you are using, although it does not matter in what order or if it exists.

```dart
11  |  VirtualNode render() {
12  |     return div('value', ['id cool-element', 'class first second etc'], [div(), span()],
13  |        {'onMount': () => print('Yep!'), 'onDestroy': () => print('Nope!')});
14  |  }
```

**Types:**

```dart
String interHTML = 'Hello world!';
List<String> attributes = ['id cool-element', 'class first second etc'];
List<VirtualNode> childs = [div(), span()];
Map events = {'onMount': () => print('Yep!'), 'onDestroy': () => print('Nope!')};
```

Types can be used in different ways, such as adding conditional constructions to strings.

**Aspects:**

1. The function names correspond to `HTML` tags.
2. Attribute consists of a name and a value, separated by a space: `'name value'`. The name and value correspond to `HTML`.
3. Order or existence doesn't matter, an empty `div()` is valid too.
4. The function accepts only the `4` arguments listed above.

**Example nesting:**

```dart
return div([
  span(),
  span(),
    div([
      span(),
      div([span(), div(), span()]),
      span()
    ])
  ]);
```

<br>

## Lifecycle

Every virtual node has a `lifecycle` that starts when it is created, and ends when it is destroyed. There are a handful of functions that allow you to run code at key moments during that lifecycle.

<br>

### Event

The one you'll use most frequently is `onMount`, which runs after the component is first rendered to the DOM.

**Example:**

```dart
VirtualNode render() {
  return div({'onMount': () => print('Mounted!'), 'onDestroy': () => print('Destroyed')});
}
```

With `onMount / onDestroy` you can add bind events.

**Example:**

```dart
void showMsg(VirtualNode virtualNode) {
  virtualNode.dom?.onClick.listen((event) => print('clicked!'));
}

VirtualNode render() {
  return button('Show Message', {'onMount': showMsg}),
}
```

<br>

## Store

Stores are used to interact and store information. They are responsible for reactivity in components.

<br>

### Writable

**Example of creation:**

```dart
int value = 5;
ReactiveWritableStore store = $Writable({'keyName': value});
```

**Example of setting a value:**

```dart
int newValue = 10;
store['keyName']?.set(newValue));
```

**Example of getting a value:**

The `get()` method should be called in the `init()` or `watch()` methods.

```dart
int value = store['keyName']?.get();
```

If the component in which the value is getting will be destroyed by the `destroy()` method, a virtual node must be passed to `get()` to remove the dependency.

```dart
int value = store['keyName']?.get(watcher.virtualNode);
```

<br>

### Readable

**Example of creation:**

```dart
int value = 5;
ReactiveReadableStore store = $Readable({'keyName': value});
```

**Example of getting a value:**

The `get()` method should be called in the `init()` or `watch()` methods.

```dart
int value = store['keyName']?.get();
```

If the component in which the value is getting will be destroyed by the `destroy()` method, a virtual node must be passed to `get()` to remove the dependency.

```dart
int value = store['keyName']?.get(watcher.virtualNode);
```

<br>

### Access

There are no local or global stores in Reio. Global or local it becomes from the area to which the store will be created.

**Example:**

1. The store created outside a component will become - global and it can be imported into third-party components, preserving reactivity.
2. The store created in a component will become - local and will be available only in it.

<br>

## Watcher

The class with which the reactivity, update and activity of a component is implemented.

<br>

### Activity

Once initialized, you can add reactivity to the component with the `watch()` method. The `watch()` method checks if there is a receipt of values from the stores in the passed function and is triggered as many times as the number of stores it contains.

```dart
15  |  watcher.watch(() {
16  |    int value = store['keyName']?.get(watcher.virtualNode);
17  |    print(value);
18  |  });
```

<br>

### Update

To update or replace a virtual node, we use the `replace()` method, which accepts a new virtual node, in which case we can pass the updated render there.

```dart
19  |  watcher.watch(() {
20  |    int value = store['val']?.get(watcher.virtualNode);
21  |    watcher.virtualNode.replace(render(value));
22  |  });
```

Note that you don't need to create a new render, but add the argument to an existing one.

```dart
23  |  VirtualNode render(int val) {
24  |    return div('$val');
25  |  }
```

When you update a virtual node, its old values are reset, what was added to `input()` may disappear in `watch()` if they are not passed to render, etc.

<br>

### Embed

Components are embedded in the same way as elements.

```dart
VirtualNode render([Element? thisComponent]) {
  return div([
    div(),
    $Child({}) // Parentheses are required.
  ]);
}
```

The watcher can be used in some cases.

```dart
watcher.init(() {
  watcher.components(() {
    $Child({'target': watcher.virtualNode.dom});
  });
});
```

With an indication of the position of the component.

```dart
$Child({'target': watcher.virtualNode.children![0].dom});
```

<br>

### Export

If you want to reuse a component, don't forget to return it.

```dart
26  |   return watcher.virtualNode;
27  | }
```

<br>

## Styling

To store component styles explicitly, it is recommended to put them in the corresponding variable.

```dart
String renderCss = '''<style>...</style>'''

watcher.init(() {
  watcher.virtualNode = render();

  watcher.virtualNode.css = renderCss;

  watcher.virtualNode.mount(options!['target']);
});
```

In the `watch()` method, styles can be changed dynamically. Use variables, conditional constructs, etc.

```dart
watcher.watch(() {
  watcher.virtualNode.css = '''<style>
    $renderCss

    {protected}: .example {display: ${true ? 'simple' : 'initial'}}
  </style>''';

  watcher.virtualNode.replace(render());
}
```

To save styles from `input()`, add them to `watch()` as `$renderCss` in the example.

<br>

### Styles syntax

The syntax is almost the same as standard CSS, but has the ability to use access modifiers.

* `public` - It makes element styles global, which is an alternative to `global.css`. Use the public modifier if this is the only way and if the element styles refer to a component, otherwise use `global.css`.
* `private` - Restricts access to element styles to everyone except the component `itself`. Does not require an element to be specified after the modifier.
* `Restricts` access to element styles other than the component `itself` and `its children`.

**Example:**

```css
String renderCss = '''<style>
  {public}: body {
    color: black;
  }

  {private}: {
    color: white;
  }

  {protected}: div {
    color: blue;
  }
<style>'''
```

The modification does not support nesting, but it is possible to add simple media queries, etc., with a bracket before the query.

```css
String renderCss = '''<style>
  (@media screen and (max-width: 360) {
  {protected}: div {
    color: green;
  }
<style>'''
```