(let [compile (require :hotpot.api.compile)]
  ;; Force a direct compilation mapping on these explicit paths
  (compile.directory "./fnl" {:force true
                              :atomic true
                              :target "./lua"}))
