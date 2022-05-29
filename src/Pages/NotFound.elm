module Pages.NotFound exposing (view)

import Element as E


view : { title : String, body : E.Element msg }
view =
    { title = "404"
    , body = E.text "Not found."
    }
