# Coding Styler

## Preface
Coding styler is a series scripts that use for force coding style on your project before commit.

We are wasting so much time on improving source code quality, doing things like force people to obey a strict paper with hundreds coding rules. We have to yell at programmer whom offend the rules and kick their ass to follow each rule, but they will forget more and more details after a few days. So, there only rules master could remember all details about those rules and commit without any coding style problems. 

Day after day, programmers will get tired to follow the rules while there have much more important thing needs to do. The source code quality will get worse by worse, finally the source code become unreadable and the whole project go into the grave.

This situation must change! 

How could we focus on the program logic but not cause the source code getting unreadable?

Actually there already have some utilities to help for do this job automatically:

Code Formatting
* uncrustify 
* astyle
* clang-format

Static Code Analyser
* Artistic Style
* https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis
* https://www.owasp.org/index.php/Static_Code_Analysis

You could invoke them manually or write a script to execute them, but as you know huam is unreliable ...

So we need a point to insert our script for let the utilities to work automatically without human manually.

All programmer must commit source code to source code repository, so THAT IS THE POINT!

We construct a git hook script to do all the dirty jobs, so all works will be done while commit!

Certainly, another question appear : how we put the script into ".git/hooks" ??

We will invoke use_coding_styler() in CMakeLists.txt for ensure all things are ready. 

## Environment Preparation
You should have these program ready for your system:

1. CMake (Ensure git hook script existed)
1. Uncrustify (Do code format automatic before commit)
1. Cppcheck (Only required if your project needs to compile with C/C++)

## Project Preparation
There must a .coding-style file and the coding styler's repository existed on the project root : 

    /---+ (Project Root)
        |
        +---- .git/ (Git Managed Directory)
        +---- .coding-styler/ (Coding Styler's project files)
        +---- .coding-style (Coding Styler configurations)
        +---- .uncrustify.cfg (The configurations of format rules)
        #---- CMakeLists.txt
        

.coding-style example :

    style_file: .uncrustify.cfg
    patterns: *.cpp, *.c, *.ino
    cppcheck: true
    
You must put these lines into your CMakeLists.txt for enable Coding Styler:

    include("${CMAKE_CURRENT_SOURCE_DIR}/.coding-styler/cmake/UseCodingStyler.cmake")
    use_coding_styler()
    
## Explanation
We copy simple hook scripts into ".git/hooks" through cmake, those scripts will invoke the real scripts in ".coding-styler/git/client/hooks-implementation". 

So, their cached files will be filterred by those script while users doing commit behaviors.

We will do tons jobs during filter process, just as automatic formating, static code check, or some other helpful lint utilities.   


## TODO

There have some goals we should implement in future:

* Check all name styles, just as function name, variant name, etc...

