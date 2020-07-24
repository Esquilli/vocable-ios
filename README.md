# Vocable AAC for iOS
![Platform iOS](https://img.shields.io/badge/platform-iOS-orange.svg)
![license MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg)
[![Crowdin](https://badges.crowdin.net/vocable-ios/localized.svg)](https://crowdin.com/project/vocable-ios)

> Empowering people to communicate with care takers and loved ones.

[![Watch the video](marketing_assets/vocable_vimeo_still.gif)](https://player.vimeo.com/video/394212430)

[![AppStore Link](marketing_assets/appstore_badge.png)](https://itunes.apple.com/us/app/keynote/id1497040547?mt=8)

## Contents
- [What is Vocable?](#what-is-vocable)
- [Features](#features)
- [Roadmap](#roadmap)
- [Translations](#translations)
- [Contributing](#contributing)
- [Requirements](#requirements)
- [Credits](#credits)
- [License](#license)

## What is Vocable?
Vocable AAC allows those with conditions such as MS, stroke, ALS, or spinal cord injuries to communicate using an app that tracks head movements, without the need to spend tens of thousands of dollars on technology to do so.

## Features

### Multimodal User Interface

Vocable uses ARKit to track the user's head movements and understand where the user is looking at on the screen. This allows the app to be used completely hands-free: users can look around the screen and make selections by lingering their gaze at a particular element. 

For users with more mobility, the app can be operated by touch.

### Saved Phrases
Use a list of common phrases provided by speech language pathologists, or create and save your own.

### Full QWERTY Keyboard
Type with your head or your hands.

## Roadmap
For the current progress on features, please visit the [project board](https://github.com/willowtreeapps/vocable-ios/projects/1).

For a high-level roadmap, see the [Vocable Roadmap](./ROADMAP.md)

## Translations
We'd love to translate Vocable into as many languages as possible. If you'd like to help translate, please visit our [Crowdin project](https://crowdin.com/project/vocable-ios). Thanks for helping people communicate all around the world! 🌎🌍🌏

## Contributing
We love contributions! To get started, please see our [Contributing Guidelines](./CONTRIBUTING.md).

## Device Requirements
- iOS 13.0
- iOS devices with TrueDepth camera

## Device Provisioning
1. Run `fastlane` from the project command line.
2. From the menu select the option for `Add devices via....`
3. When prompted enter a `device name` and press enter. This can be any name.
4. When prompted enter the `device UDID` and press enter. Found in `Xcode -> Window -> Devices and Simulators`
5. When prompted enter a `eyespeakstore@willowtreeapps.com` for `username` and press enter.
6. Fastlane might ask you to enter a username again, use `eyespeakstore@willowtreeapps.com`.

## Credits
Matt Kubota, Kyle Ohanian, Duncan Lewis, Ameir Al-Zoubi, and many more from [WillowTree](https://willowtreeapps.com/) 💙.

## License
vocable-ios is released under the MIT license. See [LICENSE](LICENSE) for details.

## Other Variants
vocable-android is available on [Google Play](https://play.google.com/store/apps/details?id=com.willowtree.vocable) and is also [open-source](https://github.com/willowtreeapps/vocable-android). 
