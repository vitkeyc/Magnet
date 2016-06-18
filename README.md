# Magnet
[![Release version](https://img.shields.io/github/release/Clipy/Magnet.svg)](https://github.com/Clipy/Magnet/releases/latest)
[![License: MIT](https://img.shields.io/github/license/Clipy/Magnet.svg)](https://github.com/Clipy/Magnet/blob/master/LICENSE)

Customaize global hotkeys in macOS. Written by swift.

## Usage
```
platform :osx, '10.9'
use_frameworks!

pod 'Magnet'
```

## Example
Add `⌘ + Control + B` hotkey.
```
if let keyCombo = KeyCombo(keyCode: 11, modifiers: 4352) {
   let hotKey = HotKey(identifier: "CommandControlB", keyCombo: keyCombo, target: self, action: #selector())
   hotKey?.register() // or HotKeyCenter.sharedCenter.register(hotKey)
}
```

Add `⌘ dobule tap` hotkey.
```
if let keyCombo = KeyCombo(doubledModifiers: .Command) {
   let hotKey = HotKey(identifier: "CommandDobuleTap", keyCombo: keyCombo, target: self, action: #selector())
   hotKey?.register()
}
```

Add `Control double tap` hotkey.
```
if let keyCombo = KeyCombo(doubledModifiers: controlKey) {
   let hotKey = HotKey(identifier: "ControlDoubleTap", keyCombo: keyCombo, target: self, action: #selector())
   hotKey?.register()
}
```

### Contributing
1. Fork it ( https://github.com/Clipy/Magnet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
