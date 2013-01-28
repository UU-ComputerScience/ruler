-------------------------------------------------------------------------
-- Version of program
-- $Id$
-------------------------------------------------------------------------

%%[1 hs module (Version)
import Paths_ruler (version)
import Data.Version (showVersion)
%%]

%%[1 hs export (versionInfo, versionDist, versionSvn)
%%]

-------------------------------------------------------------------------
-- Version info
-------------------------------------------------------------------------

%%[1 hs
versionSvn      = "$Id$"
versionDist     = showVersion version
versionProg     = "ruler"
versionInfo     = versionProg ++ "(" ++ versionDist ++ ")" ++ ", " ++ versionSvn
%%]
