# JasonetteDemoAction

[![CI Status](http://img.shields.io/travis/seletz/JasonetteDemoAction.svg?style=flat)](https://travis-ci.org/seletz/JasonetteDemoAction)
[![Version](https://img.shields.io/cocoapods/v/JasonetteDemoAction.svg?style=flat)](http://cocoapods.org/pods/JasonetteDemoAction)
[![License](https://img.shields.io/cocoapods/l/JasonetteDemoAction.svg?style=flat)](http://cocoapods.org/pods/JasonetteDemoAction)
[![Platform](https://img.shields.io/cocoapods/p/JasonetteDemoAction.svg?style=flat)](http://cocoapods.org/pods/JasonetteDemoAction)

## What is it?

This is an example plug-in for [Jasonette](http://jasonette.com).  This plug-in implements
a plug-in which can be invoked using Jason.  The plug-in implements one action `demo` which
does a `NSLog()` and returns some values to the caller.  It also demos the usage of the 
`options` passed to the action.

For details, please see these issues:

- https://github.com/Jasonette/JASONETTE-iOS/issues/26
- https://github.com/Jasonette/JASONETTE-iOS/issues/34

## Usage

To use this plug-in in [Jasonette](http://jasonette.com), you need to add this pod and recompile:

```shell
$ cd Jasonette-iOS
$ cd app
$ pod install JasonetteDemoAction
```

Once you did that, you can invoke the plug-in using something like this:

```json
{
  "$jason": {
    "head": {
      "title": "Jasonette Demo Action",
      "actions": {
        "$load": {
          "type": "@JasonetteDemoAction.demo",
          "options": {
            "text": "foo"
          }
        }
      }
    },
    "body": {
      "header": {
        "title": "Jasonette Demo Action"
      },
      "sections": {
        "items": [
          {
            "type": "label",
            "text": "???"
          }
        ]
      }
    }
  }
}
``` 

## Author

Stefan Eletzhofer, se@nexiles.de

## License

JasonetteDemoAction is available under the MIT license. See the LICENSE file for more info.
