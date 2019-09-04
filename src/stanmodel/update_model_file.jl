"""

# Method `update_model_file`

Update Stan language model file if necessary 

### Method
```julia
StanSample.update_model_file(
  file::String, 
  str::String
)
```
### Required arguments
```julia
* `file::AbstractString`                : File for Stan model
* `str::AbstractString`                 : Stan model string
```

"""
function update_model_file(file::AbstractString, model::AbstractString)
  
  model1 = strip(parse_and_interpolate(model))
  model2 = ""
  if isfile(file)
    resfile = open(file, "r")
    model2 = strip(parse_and_interpolate(read(resfile, String)))
    model1 != model2 && rm(file)
  end
  if model1 != model2
    println("\n$(file) updated.")
    strmout = open(file, "w")
    write(strmout, model1)
    close(strmout)
  end
  
end

function parse_and_interpolate(model::AbstractString)
  newmodel = ""
  lines = split(model, "\n")
  for l in lines
    ls = String(strip(l))
    replace_strings = findall("#include", ls)
    if length(replace_strings) == 1 && 
        # handle the case the include line is commented out
        length(ls) > 2 && !(ls[1:2] == "//")
      for r in replace_strings
        ls = split(strip(ls[r[end]+1:end]), " ")[1]
        func = open(f -> read(f, String), strip(ls))
        newmodel *= "   "*func*"\n"
      end
    else
      if length(replace_strings) > 1
        error("Improper number of includes in line `$l`")
      else
        newmodel *= l*"\n"
      end
    end
  end
  newmodel
end
