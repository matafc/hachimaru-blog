Hachimaru Blog
==============

This website describes my experience with making the app hachimaru with kivy. The main branch contains sample code.


## kivy-ios setup with ios simulator support

Run this command to setup kivy ios with simulator support. It will take a while to install everything.

    bash scripts/setup_xcode.sh

## Projects


#### hello-kivy (use with ios simulator)

A basic kivy app, to test your kivy installation and attempt to build for ios simluator. 

After setting up kivy-ios, run this command:

    bash hello-kivy/init-xcode.sh

You can now open the created xcode project and run the app in the simluator!


####kivy-iad-sample

This app demonstrates using pyobjus to create iad banners in kivy.

After setting up kivy-ios, run this command:

    bash kivy-iad-sample/init-xcode.sh

Open the created xcode project and add the iAdFramework to the project. After the ad builds and loads, toggle the banner with the button. If ads are not displaying, you may want to close and reopen the app. The code does not display the banner if the ads did not load, and ads do not always load in the simulator to allow devs to handle error cases.