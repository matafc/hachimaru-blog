import kivy
kivy.require('1.1.1')
from kivy.app import App
from sample_app.main_ui import MainUI

class SampleApp(App):

    def build(self):
        self.main_ui = MainUI()
        return self.main_ui

if __name__ == '__main__':
    SampleApp().run()
