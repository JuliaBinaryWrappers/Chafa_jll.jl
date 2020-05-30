# Autogenerated wrapper script for Chafa_jll for i686-linux-gnu
export chafa, libchafa

using FreeType2_jll
using Glib_jll
using ImageMagick_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `chafa`
const chafa_splitpath = ["bin", "chafa"]

# This will be filled out by __init__() for all products, as it must be done at runtime
chafa_path = ""

# chafa-specific global declaration
function chafa(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(chafa_path)
    end
end


# Relative path to `libchafa`
const libchafa_splitpath = ["lib", "libchafa.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libchafa_path = ""

# libchafa-specific global declaration
# This will be filled out by __init__()
libchafa_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libchafa = "libchafa.so.0"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Chafa")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (FreeType2_jll.PATH_list, Glib_jll.PATH_list, ImageMagick_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (FreeType2_jll.LIBPATH_list, Glib_jll.LIBPATH_list, ImageMagick_jll.LIBPATH_list,))

    global chafa_path = normpath(joinpath(artifact_dir, chafa_splitpath...))

    push!(PATH_list, dirname(chafa_path))
    global libchafa_path = normpath(joinpath(artifact_dir, libchafa_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libchafa_handle = dlopen(libchafa_path)
    push!(LIBPATH_list, dirname(libchafa_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

