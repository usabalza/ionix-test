# Docs for IonixTest

## Minimum system requirements
iOS 12+

## How to install
In order to install, the first step is clone or fork the repository. After that, open the command prompt on the folder "IonixTest" and execute:
`pod install`

This will install the last versions of Alamofire, Kingfisher and SwiftLint on your project.

*NOTE: If you don't have CocoaPods in your workstation, first install it with:*
`sudo gem install cocoapods`

## Overview
This app is a tech testing in order to show the basic capabilities of permission requests, API requests and fetching data into a UITaableView.

## Used tools
macOS Ventura 13.0.1

Xcode 14.1

CocoaPods 1.11.3

## Pods
*Alamofire:* This high praised library is the most used in Swift community for HTTP networking, to make API requests. Actually in version 5.6.4.

*Kingfisher:* Used for downloading images from the web, including a caching function in order to save device resources. Currently in version 7.4.1.

*SwiftLint:* A tool to enforce Swift style and conventions, actually in version 0.50.1

## Folder structure
*Network:* Contains the methods for connecting the API of Reddit and make HTTP calls.

*Models:* Contains the codable entities for data representation.

*Cells:* Contains the classes and .xib used for the UITableView implementation.

*Extensions:* Contains the extensions for UIView (add shadow to layers), UIViewController (sytem alerts) and UIButton (gradient colored buttons)

*Modules:* Contains the Permissions module (for requesting authorization to use camera, send notifications and get device location) and the Home module (shows the populated table and searches by letter). All these modules are under the VIPER design pattern of software.
