from kivy.app import App
from kivy_iad_sample.main_ui import MainUI

class SampleApp(App):

    def build(self):
        self.main_ui = MainUI()
        return self.main_ui

if __name__ == '__main__':
    SampleApp().run()
