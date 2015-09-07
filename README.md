# transpose

Transpose rows and columns:

    > transpose
    a1,a2,a3
    b1,b2,b3
    c1,c2,c3
    ^D

    a1,b1,c1
    a2,b2,c2
    a3,b3,c3

Usage:

    > transpose -h

    Usage: transpose [DELIM_IN] [DELIM_OUT] [-h|--help]


You can do this with `hoe` if you're so inclined...

    :'<,'>!hoe 'unlines . map unwords . transpose . map (splitOn ",") . lines' | tabulate ' '
