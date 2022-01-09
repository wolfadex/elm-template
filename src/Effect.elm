module Effect exposing
    ( Effect, none, map, batch
    , fromCmd
    , toCmd
    )

{-|

@docs Effect, none, map, batch
@docs fromCmd
@docs toCmd

-}


type Effect msg
    = None
    | Cmd (Cmd msg)
    | Batch (List (Effect msg))


none : Effect msg
none =
    None


map : (a -> b) -> Effect a -> Effect b
map fn effect =
    case effect of
        None ->
            None

        Cmd cmd ->
            Cmd (Cmd.map fn cmd)

        Batch list ->
            Batch (List.map (map fn) list)


fromCmd : Cmd msg -> Effect msg
fromCmd =
    Cmd


batch : List (Effect msg) -> Effect msg
batch =
    Batch



-- Used by Main.elm


toCmd : (pageMsg -> msg) -> Effect pageMsg -> Cmd msg
toCmd fromPageMsg effect =
    case effect of
        None ->
            Cmd.none

        Cmd cmd ->
            Cmd.map fromPageMsg cmd

        Batch list ->
            Cmd.batch (List.map (toCmd fromPageMsg) list)
