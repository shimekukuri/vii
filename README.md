# vii
## A SIMD and multi-threading Utility Library For zig

This library as of this writing at version 0.0.1 is intended to be a utility library for doing common operations on simd vectors
along with other utilities for utilizing multi-threading on top of Vector operations (nested Parallelism). Currently
This library only consist of a sparse module of functions for converting between vector types and other representations of their
backing data. The ultimate plan for this library is to provide either a comprehensive set of utilties that will enable quicker
and less bug prone implimentations of nested parallelism, or, become a full fledged frame work with access to high level
abstractions that enable all of the previously mentioned functionality. In either, or both cases, the final intent of this library
is to be what Raylib is to Rust, but even more (in a zig way).

# Road Map
## Version 0.0.1
### Conversions <- Currently here
This module will contain all code and related utility functions for converting to and from vector types and other representations
of backing data.

## Version 0.1.0
### Constants (Not Yet Implimented)
This module will contain useful Constans IE Splats of Booleans both flase and true for different vector lengths.

## Version 0.2.0
### simdUtils (Not Yet Implimented)
This module will contain the majority of uility function such as easily itterating through arrays with handling remainders.

## version 0.3.0
### SyncrhonizationStrategies
This module will contain different utilities for Sycnronizing Threads outside of the provided language functionality (IE
Parallel Barrier).
### multiThreadingUtils (Not Yet Implimented)
A Comprehensive set of tools for doing operations over multiple threads at the same time.

## version 0.4.0
### nestedUtils (Not Yet Implimented)

## version 0.5.0
### Standardization
Outside of serious problems with the previous implimentations up until this point once something has been marked as 'completed'
it will be frozen, functions and interfaces maybe added, but nothing will change after it has been marked completed. In 0.5.0
an entire rewrite will occur, no guarentees can be made about what will or won't change. This serves as a schedule in breaking
changes before writing the framework and 1.0. Additionally if there are changes to Zig as a whole and the library hasn't been
fully updated to the latest tag before moving forward it must be updated to the latest tag here.

## version 0.6.0
### Vii Framework (Not Yet Implimented)
This will be a high level abstraction that will allow a designed and determined way of best operating on data using nested parallelism
I personally see this as what 90% of people will end up using, while we will still expose all of the underlying functionality that
enables framework for usecases where the 'happy path' isn't so happy.

## version 0.7.0
### Framework revisions

## version 0.8.0
### Standardization
See previous standardiation, recap:
* Everything is frozen outside of breaking bugs up until this point.
* If library isn't on latest tag it cannot move past this point until it does.
* Full rewrite of everything with no guarentees of what will or won't break.

## version 0.9.0
### Finalization
A determined amount of time blocked out to collect bugs and resolve major issues. This will serve as the last way point before
1.0. No changes should be made to the API during this time, major breaking changes that occured in 0.8.0 are the last before version
1.0.

## version 1.0
Full release and change in versioning to proper semver with major changes indiciating breaking changes in the API.

# Contributing
I will allow any and all contributions as long as they contritube to what is outlined in the Road Map above, changes in the RoadMap
will only be additional or orginizational, meaning that if there is need for a new module we will properly organize it into the
existing roadmap and once placed will not move versions.

# Style guide / rules
Don't go over 130 chars column wise. All functions require Documentation, tests, and if they already exist benchmarks to ensure
that major changes speed are only in a positive (not massively negative) direction. Before Moving between versions all code needs
to be documented and tests directly below the function implimentation.
