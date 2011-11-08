Coverage Gap Test Case
==

In this repo you will find a simple script that loads a module and then executes some code in its runtime. The runtime code is properly caught by D::C.

On the other hand, the module also executes some code, which however will end up being executed at compile time within the require call in the script file. That code is not recorded as covered, which happens, i assume, due to being at compile time. In fact, without the empty sub in the module it wouldn't even show up in the report.
