from kivy.uix.floatlayout import FloatLayout
from kivy.uix.button import Button
from kivy import platform

class MainUI(FloatLayout):
    def __init__(self, **kwargs):
        super(MainUI, self).__init__(**kwargs)

        self.toggle_ad_button = Button(text='Toggle Ad', size_hint=(.3, .2), pos_hint={'top': 1})
        self.toggle_ad_button.bind(on_press=self.toggle_ad)
        if platform == 'ios':
            from kivy_iad_sample.iad_banner import IadBanner
            self.ad = IadBanner()
        else:
            self.ad = None

        self.ad_showing = False
        self.add_widget(self.toggle_ad_button)

    def toggle_ad(self, instance):
        if self.ad:
            if not self.ad_showing:
                self.ad.show()
                self.ad_showing = True
            else:
                self.ad.remove()
                self.ad_showing = False
        else:
            print 'No ad loaded'