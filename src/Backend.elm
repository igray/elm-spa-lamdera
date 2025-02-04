module Backend exposing (Model, app)

import Bridge exposing (ToBackend(..))
import Lamdera exposing (ClientId, SessionId)
import Types exposing (BackendModel, BackendMsg(..))


type alias Model =
    BackendModel


app :
    { init : ( Model, Cmd BackendMsg )
    , subscriptions : Model -> Sub BackendMsg
    , update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
    , updateFromFrontend :
        SessionId
        -> ClientId
        -> Types.ToBackend
        -> Model
        -> ( Model, Cmd BackendMsg )
    }
app =
    Lamdera.backend
        { init = init
        , update = update
        , updateFromFrontend = updateFromFrontend
        , subscriptions = \_ -> Sub.none
        }


init : ( Model, Cmd BackendMsg )
init =
    ( { message = "stub"
      }
    , Cmd.none
    )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    case msg of
        NoOpBackendMsg ->
            ( model, Cmd.none )


updateFromFrontend : SessionId -> ClientId -> Types.ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend _ _ msg model =
    case msg of
        NoOpToBackend ->
            ( model, Cmd.none )
