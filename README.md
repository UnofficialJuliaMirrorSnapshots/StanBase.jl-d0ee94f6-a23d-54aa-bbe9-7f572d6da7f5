# StanBase.jl

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.com/StanJulia/StanBase.jl.svg?branch=master)](https://travis-ci.com/StanJulia/StanBase.jl)
[![codecov.io](http://codecov.io/github/StanJulia/StanBase.jl/coverage.svg?branch=master)](http://codecov.io/github/StanJulia/StanBase.jl?branch=master)


## Introduction

This package contains all the common components for several application packages wrapping Stan's `cmdstan` executable. 

Stan `methods` supported are in StanSample, StanOptimize, StanVariational, StanDiagnose and `generate_quantities` (included in StanSample.jl).

`StanBase.jl`, `HelpModel.jl`, `help_types.jl` and `cmdline.jl` are the templates that have been used in the cmdstan application packages to support cmdstan options such as `stan_sample`, `stan_variational`, etc. 

Note that `help_types.jl` is a bit degenerated, a more complete version can be found [here](https://github.com/StanJulia/StanSample.jl/blob/master/src/stanrun/cmdline.jl).

These five application packages support all features and options currently available in the `cmdstan` exacutable.

The intention is that users of Stan's `cmdstan` executable will never have to install Stanbase.jl, they can simply install any of the application packages listed [here](https://github.com/StanJulia). 

The currenly existing package `CmdStan.jl v5.x.x` will continue to exists. A new version of `Stan.jl, v6` using this newer setup is in the pipeline.

## Installation

This package is registered yet. Install with

```
pkg> add StanBase
```

This package is loaded automatically when `using ...` any of the application packages.

This package is derived from Tamas Papp's [StanRun.jl](https://github.com/tpapp/StanRun.jl) package. It also uses StanDump.jl and StanSamples.jl. 

This and all the application packages need a working [cmdstan](https://mc-stan.org/users/interfaces/cmdstan.html) installation, the path of which you should specify in `JULIA_CMDSTAN_HOME`, eg in your `~/.julia/config/startup.jl` have a line like
```julia
# CmdStan setup
ENV["JULIA_CMDSTAN_HOME"] = expanduser("~/src/cmdstan-2.19.1/") # replace with your path
```
