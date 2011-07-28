import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.LayoutHints
import XMonad.Util.Run (spawnPipe)
import System.IO

import XMonad.Layout.NoBorders

main :: IO ()
main = do
  xmobar <- spawnPipe "xmobar ~/.xmobarrc"
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ smartBorders $ layoutHints $ layoutHook defaultConfig
    , logHook = myLogHook xmobar
    , borderWidth = 1
    , focusedBorderColor = "#00ff00"
    , terminal = "xterm -ls -bg black -fg white +cm"
    }


myLogHook xmobar = dynamicLogWithPP $ defaultPP {
    ppOutput = hPutStrLn xmobar
    , ppTitle = xmobarColor "white" "" . shorten 110
    , ppCurrent = xmobarColor "white" "black" . pad
    , ppHidden = pad
    , ppHiddenNoWindows = \w -> xmobarColor "#444" "" (" " ++ w ++ " ")
    , ppSep = xmobarColor "#555" "" " / "
    , ppWsSep = ""
    }
