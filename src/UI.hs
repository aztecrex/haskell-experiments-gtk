module UI
    ( go
    ) where

import Graphics.UI.Gtk

hello :: (ButtonClass o) => o -> IO ()
hello b = set b [buttonLabel := "Hello World"]

go :: IO ()
go = do
  initGUI
  window <- windowNew
  hbox <- hBoxNew True 10
  button1 <- buttonNewWithLabel "Button 1"
  button2 <- buttonNewWithLabel "Button 2"
  set window [windowDefaultWidth := 200, windowDefaultHeight := 200,
              containerChild := hbox, containerBorderWidth := 10]
  boxPackStart hbox button1 PackGrow 0
  boxPackStart hbox button2 PackGrow 0
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI
