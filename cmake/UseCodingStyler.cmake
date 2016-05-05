function(USE_CODING_STYLER)
    file(GLOB HOOK_FILES 
        "${CMAKE_CURRENT_SOURCE_DIR}/.coding-styler/git/client/hooks/*")
    
    foreach(AHOOK_FILE IN LISTS HOOK_FILES)
        execute_process(COMMAND ${CMAKE_COMMAND} -E 
            copy_if_different 
            "${AHOOK_FILE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/.git/hooks")
    endforeach(AHOOK_FILE)    
endfunction(USE_CODING_STYLER)
