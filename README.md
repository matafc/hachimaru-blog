hachimaru-blog
==============

This website describes my experience with making the app hachimaru with kivy. The main branch contains sample code.


To setup kivy with ios simulator support:

1. Setup kivy according to docs at http://kivy.org/docs/gettingstarted/intro.html . Make sure kivy main.py runs the app on your computer.
2. Run "setup_xcode.sh". This will take a while.
3. Run "create_and_open_xcode_project.sh". After Xcode opens, build for the simulator and you should see the app running.