---
layout: post
title:  "Kivy and iAd with iOS simluator support"
date:   2014-09-28 21:13:02
categories: jekyll update
---

Officially Kivy does not have full support of iAds or testing with the iOS simluator, but it is possible to get both working. For the simulator, I was able to use the kivy-ios branch at the [kivy-ios simulator branch on github](https://github.com/kivy/kivy-ios/tree/iphonesimulator "kivy-ios simulator branch on github"). Integrating iAds was a little more work, but it is possible to do so with pyobjus, avoiding using objective-c. I have shared some code examples on this blog's github repo's [master branch](https://github.com/matafc/hachimaru-blog "master branch"). Take a look if you are interested.


I was also able to integrate AdMob for android using pyjnius, and Avocarrot using both pyobjus and pyjnius. If anyone is interested, make a pull request and I'll add examples for those as well.