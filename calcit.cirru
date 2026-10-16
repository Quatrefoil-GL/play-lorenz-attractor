
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
          :schema $ :: 'List 'Number
        'comp-lorenz-attractor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-lorenz-attractor (states)
            let
                cursor $ quatrefoil.util.core/require-decoded $ try-decode-map-as
                    get states :cursor
                    , .unwrap
                  :: 'List 'Tag
                state $ quatrefoil.util.core/require-decoded $ try-decode-map-as
                  or
                    match (get states :data)
                      (:some found) found
                      (:none) nil
                    {} (:a 10) (:b 28) (:size 600000) (:unit 0.006) (:scale 4)
                      :c $ / 8 3
                  :: 'Map 'Tag 'Number
                a $
                  get state :a
                  , .unwrap
                b $
                  get state :b
                  , .unwrap
                c $
                  get state :c
                  , .unwrap
                size $
                  get state :size
                  , .unwrap
                unit $
                  get state :unit
                  , .unwrap
                scale $
                  get state :scale
                  , .unwrap
              group ({})
                let
                    n 8
                    points $ gen-lorenz-seq (.round size) unit a b c scale
                    segments $ split-segments points 2
                  group ({}) & $ -> segments $ map-indexed
                    fn (idx segment)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'List (:: 'List 'Number)
                        :return 'quatrefoil.schema/Shape
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
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      d! cursor $ assoc state :size v
                  comp-value
                    {} (:radius 1) (:speed 0.0001) (:color 0xffaa99) (:show-text? true) (:opacity 0.8) (:label |unit) (:fract-length 5) (:value unit)
                      :position $ [] 10 15 160
                      :bound $ [] 0.00001 1
                    fn (v d!)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      d! cursor $ assoc state :unit v
                  comp-value
                    {} (:radius 1) (:speed 0.1) (:color 0xec8afa) (:show-text? true) (:opacity 0.8) (:label |scale) (:fract-length 5) (:value scale)
                      :position $ [] 10 10 160
                      :bound $ [] 0.1 10
                    fn (v d!)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      d! cursor $ assoc state :scale v
                  comp-value
                    {} (:radius 1) (:speed 0.5) (:color 0xaaaaff) (:show-text? true) (:opacity 0.8) (:label |a) (:fract-length 5) (:value a)
                      :position $ [] 20 5 160
                      :bound $ [] -100 100
                    fn (v d!)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      d! cursor $ assoc state :a v
                  comp-value
                    {} (:radius 1) (:speed 0.5) (:color 0xaaaaff) (:show-text? true) (:opacity 0.8) (:label |b) (:fract-length 5) (:value b)
                      :position $ [] 20 0 160
                      :bound $ [] -100 100
                    fn (v d!)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      d! cursor $ assoc state :b v
                  comp-value
                    {} (:radius 1) (:speed 0.5) (:color 0xaaaaff) (:show-text? true) (:opacity 0.8) (:label |c) (:fract-length 5) (:value c)
                      :position $ [] 20 -5 160
                      :bound $ [] -100 100
                    fn (v d!)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      d! cursor $ assoc state :c v
                  sphere $ {} (:radius 1) (:emissive 0xffffff) (:color 0xff0000) (:emissiveIntensity 1)
                    :position $ [] 50 4 160
                    :material $ {} (:kind :mesh-basic) (:color 0xff0000) (:opacity 1) (:transparent true)
                    :event $ {} $ :click
                      fn (e d!)
                        hint-fn $ {}
                          :args $ [] 'Dynamic $ :: 'Fn
                            {}
                              :args $ [] 'Dynamic 'Dynamic
                              :return 'Unit
                          :return 'Unit
                        d! cursor $ merge state initial-config
                ambient-light $ {} $ :color 0x444422
                point-light $ {} (:color 0xffffff) (:intensity 2) (:distance 200)
                  :position $ [] 0 60 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Component)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'gen-lorenz-seq $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn gen-lorenz-seq (steps dt a b c scale)
            loop
                acc $ []
                x 2
                y 3
                z 4
                n steps
              hint-fn $ {}
                :args $ []
                  :: 'List $ :: 'List 'Number
                  , 'Number 'Number 'Number 'Number
                :return $ :: 'List $ :: 'List 'Number
              ; println |trace x y z n
              if (&<= n 0) acc $ let
                  dx $ &* dt $ &* a (&- y x)
                  dy $ &* dt $ &-
                    &* x $ &- b z
                    , y
                  dz $ &* dt $ &- (&* x y) (&* c z)
                recur
                  conj acc $ [] (&* x scale) (&* y scale) (&* z scale)
                  &+ x dx
                  &+ y dy
                  &+ z dz
                  dec n
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Number 'Number 'Number 'Number 'Number 'Number
            :return $ :: 'List $ :: 'List 'Number
        'initial-config $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def initial-config
            {} (:a 10) (:b 28)
              :c $ / 8 3
              :size 3000
              :unit 0.006
              :scale 1
          :examples $ []
          :schema $ :: 'Map 'Tag 'Number
        'split-segments $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn split-segments (points n)
            let
                size $ count points
                unit $ floor $ / size n
              -> (range n)
                map $ fn (idx)
                  hint-fn $ {}
                    :args $ [] 'Number
                    :return $ :: 'List $ :: 'List 'Number
                  if
                    = (inc idx) n
                    slice points (* idx unit) size
                    slice points (* idx unit)
                      * (inc idx) unit
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
              :: 'List $ :: 'List 'Number
              , 'Number
            :return $ :: 'List $ :: 'List (:: 'List 'Number)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.como.lorenz-attractor
          :require
            quatrefoil.alias :refer $ group sphere line ambient-light point-light
            quatrefoil.core :refer $ defcomp hslx
            quatrefoil.comp.control :refer $ comp-value
    'app.comp.container $ %{} 'FileEntry
      :defs $ {} $ 'comp-container
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (store)
            let
                states $ quatrefoil.util.core/require-decoded $ try-decode-map-as
                    get store :states
                    , .unwrap
                  :: 'Map 'Tag 'Dynamic
                scaled 0.002
              scene ({})
                group
                  {}
                    :scale $ [] scaled scaled scaled
                    :position $ [] 0 1.1 -0.4
                  comp-lorenz-attractor $ quatrefoil.util.core/require-decoded $ try-decode-map-as (>> states :lorenz) (:: 'Map 'Tag 'Dynamic)
                  ambient-light $ {} $ :color 0x666666
                  ; point-light $ {} (:color 0xffffff) (:intensity 1.4) (:distance 200)
                    :position $ [] 20 40 50
                  ; point-light $ {} (:color 0xffffff) (:intensity 2) (:distance 200)
                    :position $ [] 0 60 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Component)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require
            quatrefoil.alias :refer $ group box sphere point-light ambient-light scene text
            quatrefoil.core :refer $ defcomp >>
            app.como.lorenz-attractor :refer $ comp-lorenz-attractor
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store
            {} $ :states $ {}
              :cursor $ []
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Tag 'Dynamic
        'MobileDetectorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait MobileDetectorHost
            .mobile $ :: 'Fn $ {}
              :args $ [] 'app.main/MobileDetectorHost
              :return $ :: 'JsNullish 'JsObject
              :features $ #{} :js-ffi
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op op-data)
            if (list? op)
              recur :states $ [] op op-data
              let
                  store $ updater @*store
                    quatrefoil.util.core/require-decoded $ try-decode-map-as op 'Tag
                    , op-data
                ; js/console.log |Dispatch: op op-data store
                reset! *store store
                , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
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
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'mobile? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mobile? (user-agent)
            let
                detector $ js-cast (new mobile-detect user-agent) 'app.main/MobileDetectorHost
              js-present? $ .!mobile detector
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'String
            :features $ #{} :js-ffi
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
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! () (; println "|Render app:")
            render-canvas! (comp-container @*store) dispatch!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            |@quatrefoil/utils :refer $ inject-tree-methods
            quatrefoil.core :refer $ render-canvas! *global-tree clear-cache! init-renderer! init-controls! handle-key-event handle-control-events
            app.comp.container :refer $ comp-container
            app.updater :refer $ updater
            |three :as THREE
            touch-control.core :refer $ render-control! start-control-loop! clear-control-loop!
            |mobile-detect :default mobile-detect
            |bottom-tip :default hud!
            |./calcit.build-errors :default build-errors
            quatrefoil.dsl.object3d-dom :refer $ set-perspective-camera!
    'app.updater $ %{} 'FileEntry
      :defs $ {} $ 'updater
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op op-data)
            match op
              :states $ update-states store op-data
              _ store
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require $ quatrefoil.cursor :refer $ update-states
