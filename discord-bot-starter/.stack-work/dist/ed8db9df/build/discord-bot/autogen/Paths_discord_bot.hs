{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_discord_bot (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\13ce4efa\\bin"
libdir     = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\13ce4efa\\lib\\x86_64-windows-ghc-8.10.7\\discord-bot-0.1.0.0-2zrLoXPtShU82phZyoUFtg-discord-bot"
dynlibdir  = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\13ce4efa\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\13ce4efa\\share\\x86_64-windows-ghc-8.10.7\\discord-bot-0.1.0.0"
libexecdir = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\13ce4efa\\libexec\\x86_64-windows-ghc-8.10.7\\discord-bot-0.1.0.0"
sysconfdir = "C:\\Users\\imcar\\Desktop\\discord bot haskell\\.stack-work\\install\\13ce4efa\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "discord_bot_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "discord_bot_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "discord_bot_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "discord_bot_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "discord_bot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "discord_bot_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
