{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_discord_bot (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\37dbe412\\bin"
libdir     = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\37dbe412\\lib\\x86_64-windows-ghc-9.8.4\\discord-bot-0.1.0.0-94wadZbNQR4C1ha1u1GFOH-discord-bot"
dynlibdir  = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\37dbe412\\lib\\x86_64-windows-ghc-9.8.4"
datadir    = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\37dbe412\\share\\x86_64-windows-ghc-9.8.4\\discord-bot-0.1.0.0"
libexecdir = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\37dbe412\\libexec\\x86_64-windows-ghc-9.8.4\\discord-bot-0.1.0.0"
sysconfdir = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\37dbe412\\etc"

getBinDir     = catchIO (getEnv "discord_bot_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "discord_bot_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "discord_bot_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "discord_bot_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "discord_bot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "discord_bot_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
