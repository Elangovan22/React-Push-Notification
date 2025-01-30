if(NOT TARGET hermes-engine::libhermes)
add_library(hermes-engine::libhermes SHARED IMPORTED)
set_target_properties(hermes-engine::libhermes PROPERTIES
    IMPORTED_LOCATION "/Users/elangovaneaaswaramurty/.gradle/caches/8.9/transforms/d0c880439d6e8c3b8c8f2da547c8d3dc/transformed/hermes-android-0.77.0-release/prefab/modules/libhermes/libs/android.x86/libhermes.so"
    INTERFACE_INCLUDE_DIRECTORIES "/Users/elangovaneaaswaramurty/.gradle/caches/8.9/transforms/d0c880439d6e8c3b8c8f2da547c8d3dc/transformed/hermes-android-0.77.0-release/prefab/modules/libhermes/include"
    INTERFACE_LINK_LIBRARIES ""
)
endif()

