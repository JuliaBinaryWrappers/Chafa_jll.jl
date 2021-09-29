# Autogenerated wrapper script for Chafa_jll for aarch64-linux-musl
export chafa, libchafa

using FreeType2_jll
using Glib_jll
using ImageMagick_jll
JLLWrappers.@generate_wrapper_header("Chafa")
JLLWrappers.@declare_executable_product(chafa)
JLLWrappers.@declare_library_product(libchafa, "libchafa.so.0")
function __init__()
    JLLWrappers.@generate_init_header(FreeType2_jll, Glib_jll, ImageMagick_jll)
    JLLWrappers.@init_executable_product(
        chafa,
        "bin/chafa",
    )

    JLLWrappers.@init_library_product(
        libchafa,
        "lib/libchafa.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
