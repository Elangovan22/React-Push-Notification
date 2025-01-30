if(NOT TARGET hermes-engine::libhermes)
add_library(hermes-engine::libhermes SHARED IMPORTED)
set_target_properties(hermes-engine::libhermes PROPERTIES
    IMPORTED_LOCATION "/Users/elangovaneaaswaramurty/.gradle/caches/8.9/transforms/8837ea610f4e2c5e62c533c3d9af5486/transformed/hermes-android-0.77.0-debug/prefab/modules/libhermes/libs/android.x86_64/libhermes.so"
    INTERFACE_INCLUDE_DIRECTORIES "/Users/elangovaneaaswaramurty/.gradle/caches/8.9/transforms/8837ea610f4e2c5e62c533c3d9af5486/transformed/hermes-android-0.77.0-debug/prefab/modules/libhermes/include"
    INTERFACE_LINK_LIBRARIES ""
)
endif()

