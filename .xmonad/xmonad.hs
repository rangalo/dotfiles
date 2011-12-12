import XMonad
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog, doFullFloat, doCenterFloat)
import XMonad.Layout.Tabbed
import System.IO
 
 
-- -xos4-terminus-medium-r-*-*-14-*-*-*-*-*-*-*
myLauncher :: String
myLauncher = "`dmenu_path | dmenu -fn '-xos4-terminus-medium-r-*-*-14-*-*-*-*-*-*-*' -nb '#303030' -nf '#959595' -sf '#FFFFFF' -sb '#606060'`"
newLauncher = "`cat /home/hardik/.dmenu_cache |  dmenu -fn '-xos4-terminus-medium-r-*-*-14-*-*-*-*-*-*-*' -nb '#303030' -nf '#959595' -sf '#FFFFFF' -sb '#606060'`"
-- newLauncher = " /usr/bin/gmrun"
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask,                          xK_a), spawn $ XMonad.terminal conf)
    , ((modMask,                          xK_e), spawn "xterm")
    , ((modMask,                          xK_r), spawn newLauncher)
    , ((mod1Mask,                         xK_F4), kill)
    , ((mod4Mask .|. controlMask, xK_Down     ), spawn "/home/hardik/bin/decrease-aumix-vol.sh")
    , ((0                       , 0x1008ff11  ), spawn "/home/hardik/bin/decrease-aumix-vol.sh")
    , ((mod4Mask .|. controlMask, xK_Up     ), spawn "/home/hardik/bin/increase-aumix-vol.sh")
    , ((0                       , 0x1008ff13  ), spawn "/home/hardik/bin/increase-aumix-vol.sh")
    , ((mod4Mask .|. controlMask, xK_m     ), spawn "/home/hardik/bin/toggle-aumix-mute.sh")
    , ((0                       , 0x1008ff12 ), spawn "/home/hardik/bin/toggle-aumix-mute.sh")
    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modMask,               xK_n     ), refresh)
    , ((mod1Mask,               xK_Tab   ), windows W.focusDown)
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp  )
    , ((modMask,               xK_m     ), windows W.focusMaster  )
    , ((modMask,               xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    ) 
    , ((modMask,               xK_h     ), sendMessage Shrink) 
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modMask              , xK_q     ), spawn "killall conky dzen2 yeahconsole && xmonad --recompile && xmonad --restart")
--    , ((modMask              , xK_q     ), spawn "/home/hardik/bin/killStartupPrograms.sh && xmonad --recompile && xmonad --restart")
--    , ((modMask              , xK_q     ), spawn "xmonad --recompile && xmonad --restart")
    , ((modMask .|.shiftMask .|. controlMask  , xK_c ), spawn "emacs ~/.xmonad/xmonad.hs")
    , ((modMask .|. controlMask               , xK_l ), spawn "xscreensaver-command -lock")
    , ((modMask .|. controlMask               , xK_k ), spawn "python ~/desklets/SwitchKbLayoutDesk/src/setNextKbLayout.py")
    , ((mod4Mask .|. controlMask               , xK_p ), spawn "mpc toggle")
    , ((mod4Mask .|. controlMask               , xK_s ), spawn "mpc stop")
    , ((mod4Mask .|. controlMask               , xK_period ), spawn "mpc next")
    , ((mod4Mask .|. controlMask               , xK_comma), spawn "mpc prev")
    , ((0                                      , 0x1008ff14 ), spawn "mpc toggle")
    , ((0                                      , 0x1008ff15 ), spawn "mpc stop")
    , ((0                                      , 0x1008ff17 ), spawn "mpc next")
    , ((0                                      , 0x1008ff16 ), spawn "mpc prev")
    , ((modMask              , xK_b     ), sendMessage ToggleStruts)
    ]
    ++
    [((m .|. controlMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F6]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
 
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
    ]
 
 
myLayouts = tiled ||| Mirror tiled ||| noBorders Full ||| simpleTabbedBottom
  where
    tiled = Tall 1 (2/100) (1/2)
 
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Smplayer"       --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "IDEA"           --> doFloat
    , className =? "Picasa"         --> doFloat
    , className =? "Eclipse"        --> doCenterFloat
    , resource  =? "desktop_window" --> doIgnore
    , isFullscreen                  --> doFullFloat 
    , isDialog                      --> doCenterFloat ]

myStartupHook :: X ()
myStartupHook = do 
                setWMName "LG3D"
                spawn "xset -b"
                spawn "xrdb -load ~/.Xdafaults"
                spawn "xscreensaver -no-splash"
                spawn "numlockx on"
                spawn "eval `cat $HOME/.fehbg`"
                spawn "(sleep 5 && conky) &"
                spawn "(sleep 5 && conky -c ~/.conkyrc_dzen | dzen2 -ta r -x 600 -bg '#303030' -fn ' -*-lucida-*-*-normal-*-12-*-*-*-*-*-*-*') &"
                spawn "(sleep 7 && yeahconsole) &"
 
 
shortened :: Int -> String -> String
shortened n xs | length xs < n = xs
               | otherwise = (take ( n - length end) xs) ++ end
    where
        end = "..."

myStatusbar = "conky -c ~/.conkyrc_dzen | dzen2 -ta r -x 600 -bg '#303030' -fn ' -*-lucida-*-*-normal-*-12-*-*-*-*-*-*-*'"

main = do 

h <- spawnPipe "dzen2 -w 600 -ta l -fn ' -*-lucida-*-*-normal-*-12-*-*-*-*-*-*-*' -bg '#303030' -fg '#FFFFFF'"

-- spawnPipe myStatusbar

xmonad $ defaultConfig {
        terminal           = "urxvt",
        focusFollowsMouse  = True,
        borderWidth        = 1,
        modMask            = mod4Mask,
        workspaces         = ["1:console  ","2:dev  ","3:misc  ","4:browser  ", "5:scratch1 ", "6:scratch2 " ],
        normalBorderColor  = "#303030",
        focusedBorderColor = "#55BBFF",
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = avoidStruts $ smartBorders myLayouts,
        manageHook         = myManageHook <+> manageDocks,
        startupHook        = myStartupHook,
        logHook            = dynamicLogWithPP $ defaultPP {
                         ppCurrent = wrap "^fg(#FFFFFF)^bg(#606060)" "^fg()^bg()"
                        ,ppVisible = wrap "^fg(#FFFFFF)^bg()" "^fg()^bg()"
                        ,ppHidden = wrap "^fg(#55BBFF)^bg()" "^fg()^bg()"
                        ,ppHiddenNoWindows = wrap "^fg(#808080)^bg()" "^fg()^bg()"
                        ,ppUrgent = wrap "^fg(#FF0000)^bg()" "^fg()^bg()"
                        ,ppTitle  = \x -> if null x 
                                             then ""
                                             else  "< ^fg(#FFFFFF)^bg()" ++ shortened 23 x ++ "^fg()^bg() >"
                        ,ppLayout = \x -> "^fg(#FFBB00)^bg()"
                                              ++ case x of
                                                       "Tall" -> "Tiled"
                                                       "Full" -> "Full"
                                                       "Mirror Tall" -> "Tiled Bottom"
                                                       "Tabbed Bottom Simplest" -> "Tabbed"
                                                       _                        -> x
                                                       ++ "^fg()^bg()"
                        ,ppSep = " "
                        ,ppWsSep = ""
                        ,ppOutput = hPutStrLn h
                        }
    }
 
