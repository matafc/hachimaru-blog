from kivy.core.window import Window
import logging
logging.basicConfig()
from pyobjus import autoclass, protocol
from pyobjus.objc_py_types import CGRect, CGSize, CGPoint


class IadBanner():

        def __init__(self):
            ADBannerView = autoclass('ADBannerView')
            self.view = autoclass('UIApplication').sharedApplication().keyWindow.rootViewController().view()
            self.adView = ADBannerView.alloc().initWithFrame_(self.get_frame())
            self.adView.setDelegate_(self)
            Window.bind(size=self.win_size_change)

        def win_size_change(self, instance, value):
            self.resize()

        def show(self):
            self.view.addSubview_(self.adView)

        def remove(self):
            self.adView.removeFromSuperview()

        def resize(self):
            if self.adView.isDescendantOfView_(self.view):
                self.adView.setFrame_(self.get_frame())

        def get_frame(self):
            # if show_offset is 0, ad will not be shown, frame will be off screen
            show_offset = 0

            #iphone
            scale_factor = 2
            frame_height = 32
            if min(Window.height, Window.width) == 640:
                if Window.height > Window.width:
                    frame_height = 50

            # all ipads
            elif min(Window.height, Window.width) in (768, 1536):
                frame_height = 66
                scale_factor = min(Window.height, Window.width)/768

            try:
                if self.adView.isBannerLoaded():
                    show_offset = frame_height
            except:
                pass

            return CGRect(CGPoint(0, Window.height/scale_factor-show_offset), CGSize(Window.width/scale_factor, frame_height))

        # add delegates to resize ad frame as necessary
        @protocol('ADBannerViewDelegate')
        def bannerViewDidLoadAd_(self, banner):
            self.resize()

        @protocol('ADBannerViewDelegate')
        def bannerView_didFailToReceiveAdWithError_(self, banner, error):
            self.resize()

