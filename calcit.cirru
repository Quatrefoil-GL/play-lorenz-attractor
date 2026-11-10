
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |touch-control/ |pointed-prompt/ |quatrefoil/ |quaternion/
      :type-slots $ {}
  :files $ {}
    'app.como.lorenz-attractor $ %{} 'FileEntry
      :defs $ {}
        'color-scheme $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def color-scheme
            []
              quatrefoil.core/js-number $ hslx 240 100 60
              quatrefoil.core/js-number $ hslx 30 100 50
          :examples $ []
          :schema $ quote $ List Number
        'comp-lorenz-attractor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-lorenz-attractor (state)
            let
                cursor app.updater/lorenz-cursor
                a $ :a state
                b $ :b state
                c $ :c state
                size $ :size state
                unit $ :unit state
                scale $ :scale state
              group ({})
                let
                    n 8
                    points $ gen-lorenz-seq (.round size) unit a b c scale
                    segments $ split-segments points 2
                  group ({}) & $ -> segments $ map-indexed
                    fn (idx segment)
                      hint-fn $ Fn Number
                        List $ Tuple Number Number Number
                        -> quatrefoil.schema/Shape
                      line $ {} (:points segment)
                        :position $ [] 0 0 0
                        :material $ {} (:kind :line-basic)
                          :color $
                            nth color-scheme idx
                            , .unwrap-or 0xffffff
                          :opacity 1
                          ; :transparent true
                          :linewidth 1
                group ({})
                  comp-value
                    {} (:radius 1) (:speed 600) (:color 0xffff55) (:show-text? true) (:opacity 0.8) (:label |size) (:fract-length 0) (:value size)
                      :position $ [] 10 20 160
                      :bound $ [] 10 800000
                    fn (v d!)
                      hint-fn $ Fn Number
                        Fn (List Tag) app.updater/LorenzState $ -> Unit
                        -> Unit
                      d! cursor $ &struct:assoc state :size v
                  comp-value
                    {} (:radius 1) (:speed 0.0001) (:color 0xffaa99) (:show-text? true) (:opacity 0.8) (:label |unit) (:fract-length 5) (:value unit)
                      :position $ [] 10 15 160
                      :bound $ [] 0.00001 1
                    fn (v d!)
                      hint-fn $ Fn Number
                        Fn (List Tag) app.updater/LorenzState $ -> Unit
                        -> Unit
                      d! cursor $ &struct:assoc state :unit v
                  comp-value
                    {} (:radius 1) (:speed 0.1) (:color 0xec8afa) (:show-text? true) (:opacity 0.8) (:label |scale) (:fract-length 5) (:value scale)
                      :position $ [] 10 10 160
                      :bound $ [] 0.1 10
                    fn (v d!)
                      hint-fn $ Fn Number
                        Fn (List Tag) app.updater/LorenzState $ -> Unit
                        -> Unit
                      d! cursor $ &struct:assoc state :scale v
                  comp-value
                    {} (:radius 1) (:speed 0.5) (:color 0xaaaaff) (:show-text? true) (:opacity 0.8) (:label |a) (:fract-length 5) (:value a)
                      :position $ [] 20 5 160
                      :bound $ [] -100 100
                    fn (v d!)
                      hint-fn $ Fn Number
                        Fn (List Tag) app.updater/LorenzState $ -> Unit
                        -> Unit
                      d! cursor $ &struct:assoc state :a v
                  comp-value
                    {} (:radius 1) (:speed 0.5) (:color 0xaaaaff) (:show-text? true) (:opacity 0.8) (:label |b) (:fract-length 5) (:value b)
                      :position $ [] 20 0 160
                      :bound $ [] -100 100
                    fn (v d!)
                      hint-fn $ Fn Number
                        Fn (List Tag) app.updater/LorenzState $ -> Unit
                        -> Unit
                      d! cursor $ &struct:assoc state :b v
                  comp-value
                    {} (:radius 1) (:speed 0.5) (:color 0xaaaaff) (:show-text? true) (:opacity 0.8) (:label |c) (:fract-length 5) (:value c)
                      :position $ [] 20 -5 160
                      :bound $ [] -100 100
                    fn (v d!)
                      hint-fn $ Fn Number
                        Fn (List Tag) app.updater/LorenzState $ -> Unit
                        -> Unit
                      d! cursor $ &struct:assoc state :c v
                  sphere $ {} (:radius 1) (:emissive 0xffffff) (:color 0xff0000) (:emissiveIntensity 1)
                    :position $ [] 50 4 160
                    :material $ {} (:kind :mesh-basic) (:color 0xff0000) (:opacity 1) (:transparent true)
                    :event $ {} $ :click
                      fn (_event d!)
                        hint-fn $ Fn JsObject
                          Fn (List Tag) app.updater/LorenzState $ -> Unit
                          -> Unit
                        d! cursor app.updater/reset-state
                ambient-light $ {} $ :color 0x444422
                point-light $ {} (:color 0xffffff) (:intensity 2) (:distance 200)
                  :position $ [] 0 60 0
          :examples $ []
          :schema $ quote $ Fn app.updater/LorenzState (-> quatrefoil.schema/Component)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.como.lorenz-attractor
          :require
            quatrefoil.alias :refer $ group sphere line ambient-light point-light
            quatrefoil.core :refer $ defcomp hslx
            quatrefoil.comp.control :refer $ comp-value
            app.math :refer $ gen-lorenz-seq split-segments
    'app.comp.container $ %{} 'FileEntry
      :defs $ {} $ 'comp-container
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (store)
            let
                scaled 0.002
              scene ({})
                group
                  {}
                    :scale $ [] scaled scaled scaled
                    :position $ [] 0 1.1 -0.4
                  comp-lorenz-attractor store
                  ambient-light $ {} $ :color 0x666666
                  ; point-light $ {} (:color 0xffffff) (:intensity 1.4) (:distance 200)
                    :position $ [] 20 40 50
                  ; point-light $ {} (:color 0xffffff) (:intensity 2) (:distance 200)
                    :position $ [] 0 60 0
          :examples $ []
          :schema $ quote $ Fn app.updater/LorenzState (-> quatrefoil.schema/Component)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require
            quatrefoil.alias :refer $ group box sphere point-light ambient-light scene text
            quatrefoil.core :refer $ defcomp
            app.como.lorenz-attractor :refer $ comp-lorenz-attractor
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store app.updater/default-state
          :examples $ []
          :schema $ quote $ Ref app.updater/LorenzState
        'MobileDetectorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait MobileDetectorHost
            .mobile $ Fn app.main/MobileDetectorHost
              -> $ JsNullish JsObject
              :features :js-ffi
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op op-data)
            let
                pair $ if (list? op)
                  Option :some $ [] op op-data
                  if
                    = (decode-map-as op Tag) :states
                    Option :some $ decode-map-as op-data $ List Dynamic
                    Option :none
              match pair
                (:some args)
                  let
                      cursor $ decode-map-as
                        .unwrap $ nth args 0
                        List Tag
                      raw $ .unwrap $ nth args 1
                    reset! *store $ if (= cursor app.updater/lorenz-cursor)
                      if (not raw) app.updater/default-state $ app.updater/read-state $ decode-map-as raw app.updater/LorenzPayload
                      , @*store
                (:none) &unit
              , &unit
          :examples $ []
          :schema $ quote $ Fn Op Payload (-> Unit) (:generics Op Payload)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (load-console-formatter!) (inject-tree-methods)
            set-perspective-camera! $ {} (:fov 45) (:near 0.1) (:far 1000)
              :position $ [] 0 0 100
              :aspect $ / (quatrefoil.core/js-number js/window.innerWidth) (quatrefoil.core/js-number js/window.innerHeight)
            let
                canvas-el $ js/document.querySelector |canvas
              init-renderer! canvas-el $ {} $ :background 0x110022
            render-app!
            add-watch! *store :changes $ fn (store prev) (render-app!)
            set! js/window.onkeydown handle-key-event
            when
              mobile? $ quatrefoil.util.core/require-decoded $ try-decode-map-as js/window.navigator.userAgent 'String
              render-control!
              handle-control-events
            init-controls!
            println "|App started!"
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'mobile? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mobile? (user-agent)
            let
                detector $ js-cast (new mobile-detect user-agent) 'app.main/MobileDetectorHost
              js-present? $ .!mobile detector
          :examples $ []
          :schema $ quote $ Fn String (-> Bool) (:features :js-ffi)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (non-nil? build-errors) (hud! |error build-errors)
              do (hud! |ok~ nil) (clear-cache!)
                when
                  mobile? $ quatrefoil.util.core/require-decoded $ try-decode-map-as js/window.navigator.userAgent 'String
                  clear-control-loop!
                  handle-control-events
                remove-watch! *store :changes
                add-watch! *store :changes $ fn (store prev) (render-app!)
                render-app!
                set! js/window.onkeydown handle-key-event
                println "|Code updated."
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! () (; println "|Render app:")
            render-canvas! (comp-container @*store) dispatch!
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            |@quatrefoil/utils :refer $ inject-tree-methods
            quatrefoil.core :refer $ render-canvas! *global-tree clear-cache! init-renderer! init-controls! handle-key-event handle-control-events
            app.comp.container :refer $ comp-container
            |three :as THREE
            touch-control.core :refer $ render-control! start-control-loop! clear-control-loop!
            |mobile-detect :default mobile-detect
            |bottom-tip :default hud!
            |./calcit.build-errors :default build-errors
            quatrefoil.dsl.object3d-dom :refer $ set-perspective-camera!
    'app.math $ %{} 'FileEntry
      :defs $ {}
        'gen-lorenz-seq $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn gen-lorenz-seq (steps dt a b c scale)
            loop
                acc $ []
                x 2
                y 3
                z 4
                n steps
              hint-fn $ Fn
                List $ Tuple Number Number Number
                , Number Number Number Number $ ->
                  List $ Tuple Number Number Number
              ; println |trace x y z n
              if (&<= n 0) acc $ let
                  dx $ &* dt $ &* a (&- y x)
                  dy $ &* dt $ &-
                    &* x $ &- b z
                    , y
                  dz $ &* dt $ &- (&* x y) (&* c z)
                recur
                  conj acc $ assert-type
                    [] (&* x scale) (&* y scale) (&* z scale)
                    Tuple Number Number Number
                  &+ x dx
                  &+ y dy
                  &+ z dz
                  dec n
          :examples $ []
          :schema $ quote $ Fn Number Number Number Number Number Number
            -> $ List $ Tuple Number Number Number
          :tests $ [] $ %{} 'TestEntry (:name |preserve-euler-segments-and-default-count)
            :code $ quote $ do
              assert=
                [] $ [] 8 12 16
                gen-lorenz-seq 1 0.006 10 28 (/ 8 3) 4
              assert=
                [] ([] 8 12 16) ([] 8.24 13.08 15.888)
                gen-lorenz-seq 2 0.006 10 28 (/ 8 3) 4
              assert= 600000 $ .len $ gen-lorenz-seq 600000 0.006 10 28 (/ 8 3) 4
              assert=
                []
                  [] ([] 1) ([] 2)
                  [] ([] 3) ([] 4) ([] 5)
                split-segments
                  [] ([] 1) ([] 2) ([] 3) ([] 4) ([] 5)
                  , 2
              assert= 3000 $
                get initial-config :size
                , .unwrap
        'initial-config $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def initial-config
            {} (:a 10) (:b 28)
              :c $ / 8 3
              :size 3000
              :unit 0.006
              :scale 1
          :examples $ []
          :schema $ quote $ Map Tag Number
        'split-segments $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn split-segments (points n)
            let
                size $ .len points
                unit $ floor $ / size n
              -> (range n)
                map $ fn (idx)
                  hint-fn $ Fn Number $ -> (List T)
                  if
                    = (inc idx) n
                    slice points (* idx unit) (Option :some size)
                    slice points (* idx unit)
                      Option :some $ * (inc idx) unit
          :examples $ []
          :schema $ quote $ Fn (List T) Number
            -> $ List $ List T
            :generics T
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.math
    'app.updater $ %{} 'FileEntry
      :defs $ {}
        'LorenzPayload $ %{} 'CodeEntry
          :doc "|Current scene parameters or the legacy numeric Map."
          :code $ quote $ defunion LorenzPayload LorenzState (Map Tag Number)
          :examples $ []
          :schema $ quote UnionDef
        'LorenzState $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct LorenzState (:a Number) (:b Number) (:c Number) (:size Number) (:unit Number) (:scale Number)
          :examples $ []
          :schema $ quote StructDef
        'default-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def default-state
            &struct:assoc (&struct:assoc reset-state :size 600000) :scale 4
          :examples $ []
          :schema $ quote app.updater/LorenzState
        'lorenz-cursor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lorenz-cursor ([] :lorenz)
          :examples $ []
          :schema $ quote $ List Tag
        'read-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-state (raw)
            match raw
              (Map fields)
                LorenzState :a
                  .unwrap $ get fields :a
                  , :b
                    .unwrap $ get fields :b
                    , :c
                      .unwrap $ get fields :c
                      , :size
                        .unwrap $ get fields :size
                        , :unit
                          .unwrap $ get fields :unit
                          , :scale $ .unwrap $ get fields :scale
              (LorenzState checked) checked
          :examples $ []
          :schema $ quote $ Fn app.updater/LorenzPayload (-> app.updater/LorenzState)
        'reset-state $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def reset-state (read-state app.math/initial-config)
          :examples $ []
          :schema $ quote app.updater/LorenzState
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
