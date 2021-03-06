{-# LANGUAGE CPP                      #-}
{-# LANGUAGE EmptyDataDecls           #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI            #-}
module JavaScript.JQuery.UI.Internal where

import JavaScript.JQuery
import JavaScript.JQuery.Internal
import GHCJS.Types
import GHCJS.Foreign

#ifdef __GHCJS__
-- to export: removeClass, addClass
    
-- | Effect core

-- XXX: animate
-- ^ http://api.jqueryui.com/color-animation/

foreign import javascript unsafe
    "$3.effect($1, $2)"
    jq_effect :: JSString -> (JSObject a) -> JQuery -> IO ()    

foreign import javascript unsafe
    "$3.hide($1, $2)"
    jq_hide :: JSString -> (JSObject a) -> JQuery -> IO ()    

foreign import javascript unsafe
    "$3.show($1, $2)"
    jq_show :: JSString -> (JSObject a) -> JQuery -> IO ()    

foreign import javascript unsafe
    "$4.switchClass($1, $2, $3)"
    jq_switchClass :: JSString -> JSString -> (JSObject a) -> JQuery -> IO ()    

foreign import javascript unsafe
    "$3.toggle($1, $2)"
    jq_toggle :: JSString -> (JSObject a) -> JQuery -> IO ()    

foreign import javascript unsafe
    "$3.toggleClass($1, $2)"
    jq_toggleClass :: JSString -> (JSObject a) -> JQuery -> IO ()    

-- | UI core

--- XXX: keycodes: http://api.jqueryui.com/jQuery.ui.keyCode/
--- XXX: zIndex

foreign import javascript unsafe
    "$r = $2.focus($1)"
    jq_focus :: JSNumber -> JQuery -> IO JQuery

foreign import javascript unsafe
    "$r = $1.removeUniqueId()"
    jq_removeUniqueId :: JQuery -> IO JQuery  

foreign import javascript unsafe
    "$r = $1.scrollParent()"
    jq_scrollParent :: JQuery -> IO JQuery

foreign import javascript unsafe
    "$r = $1.uniqueId()"
    jq_uniqueId :: JQuery -> IO JQuery

foreign import javascript unsafe
    "$1.disableSelection()"
    jq_disableSelection :: JQuery -> IO JQuery

foreign import javascript unsafe
    "$1.enableSelection()"
    jq_enableSelection  :: JQuery -> IO JQuery
                           
-- | Widgets

foreign import javascript unsafe
    "$2.$1()"
    jq_initWidget    :: JQWidget -> JQuery -> IO ()

foreign import javascript unsafe
    "$3[$1]($2)"
    jq_setOptsWidget :: JQWidget -> JSObject a -> JQuery -> IO ()

foreign import javascript unsafe
    "$2[$1](\"option\")"
    jq_getOptsWidget :: JQWidget               -> JQuery -> IO (JSObject a)

foreign import javascript unsafe
    "$3[$1](\"option\", $2)"
    jq_getOptWidget  :: JQWidget -> JSString   -> JQuery -> IO (JSRef a)

foreign import javascript unsafe
    "$4[$1](\"option\", $2, $3)"
    jq_setOptWidget  :: JQWidget -> JSString   -> JSRef a -> JQuery -> IO (JSRef a)
                        
foreign import javascript unsafe
    "$3[$1]($2)"
    jq_widgetMethod  :: JQWidget -> JSString   -> JQuery -> IO (JSRef a)
#else

#include "nonghcjs.txt"

#endif

type JQWidget = JSString

