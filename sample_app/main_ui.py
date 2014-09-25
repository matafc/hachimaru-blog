from kivy.uix.floatlayout import FloatLayout
from kivy.uix.button import Button
from kivy.uix.label import Label


class MainUI(FloatLayout):
    def __init__(self, **kwargs):
        super(MainUI, self).__init__(**kwargs)

        self.toggle_label_button = Button(text='Toggle Label', size_hint=(.3, .2), pos_hint={'top': 1})
        self.toggle_label_button.bind(on_press=self.toggle_label)
        self.sample_label = Label(text="I'm a label!", size_hint=(.3, .2), pos_hint={'top': .6})

        self.add_widget(self.toggle_label_button)

    def toggle_label(self, instance):
        if self.sample_label in self.children:
            self.remove_widget(self.sample_label)
        else:
            self.add_widget(self.sample_label)