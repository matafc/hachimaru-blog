Hachimaru Blog
==============

This website describes my experience with making the app hachimaru with kivy. The main branch contains example code derived from the actual code I used in the app hachimaru.

The site is [here](http://matafc.github.io/hachimaru-blog/).

## kivy-ios setup with ios simulator support

Run this command to setup kivy ios with simulator support. It will take a while to install everything.

    bash scripts/setup_xcode.sh

## Projects


### Virtualenv and kivy-ios fork

I use virtualenv to setup my python environment, and use my own kivy-ios fork to build these apps for ios. After downloading the project, use the following commands for the best results to setup your environment.

	virtualenv env
	./env/bin/pip install Cython==0.20.2 pillow jinja2
	./env/bin/pip install hg+http://bitbucket.org/pygame/pygame
	./env/bin/pip install kivy

Make sure everything installed properly before continuing.


#### hello-kivy (use with ios simulator)

A basic kivy app, to test your kivy installation and attempt to build for ios simluator. 

After setting up kivy-ios, run these commands:

    . ./env/bin/activate
    bash hello-kivy/init-xcode.sh

You can now open the created xcode project and run the app in the simluator!


####kivy-iad-sample

This app demonstrates using pyobjus to create iad banners in kivy.

After setting up kivy-ios, run this command:

    bash kivy-iad-sample/init-xcode.sh

Open the created xcode project and add the iAdFramework to the project. After the ad builds and loads, toggle the banner with the button. If ads are not displaying, you may want to close and reopen the app. The code does not display the banner if the ads did not load, and ads do not always load in the simulator to allow devs to handle error cases.
