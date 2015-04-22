---
layout: post
title:  "Alternative methods for using iAds with kivy"
date:   2015-04-21 21:13:02
categories: jekyll update
---
Alternative methods for using iAds with kivy

The great folks working on [kivy-ios](https://github.com/kivy/kivy-ios "kivy-ios") updated the build process so it can create builds for 64 bit iOS architectures as well as iOS simluator architectures. Previously, I implemented iAds using pyobjus to control them, but with 64 bit builds, using iAds with pyobjus can crash the app. So here is a way to create a banner ad for your kivy app, by modifying the objective C code in the main.m used to start the kivy app.

1. Create your xcode project using the instructions [here](https://github.com/kivy/kivy-ios "kivy-ios")

2. Open the xcode project and replace main.m with the code in custom/main.m located in the master branch of this repo.

3. Add the iad framework to your project

4. Run your project, you should now have banner ads in ios. That's it.


Unfortunately, there is no way to interact with the ads (toggle/hide) since we are loading outside of the python interpreter. Once pyobjus is updated to work properly with 64 bit builds, we can use it to control the ads again.

You can test this method with the simple project in the hello-kivy/src directory located in master branch of this repo.