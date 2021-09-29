# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Chafa_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Chafa")
JLLWrappers.@generate_main_file("Chafa", UUID("52a89005-cc63-50df-a748-7ef82af009e5"))
end  # module Chafa_jll
