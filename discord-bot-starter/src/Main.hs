{-# LANGUAGE OverloadedStrings #-}

import Discord
import Discord.Types
import Discord.Requests
import qualified Data.Text as T
import Control.Monad (when, void)

main :: IO ()
main = do
  tok <- readFile "bot.token"
  userFacingError <- runDiscord $ def
    { discordToken = T.pack (filter (/= '\n') tok)
    , discordOnEvent = eventHandler
    }
  putStrLn (T.unpack userFacingError)

eventHandler :: Event -> DiscordHandler ()
eventHandler event = case event of
  MessageCreate m -> when (not (userIsBot (messageAuthor m))) $ handleMessage m
  _ -> return ()

handleMessage :: Message -> DiscordHandler ()
handleMessage m
  | "!" `T.isPrefixOf` messageContent m =
      case T.stripPrefix "!" (messageContent m) of
        Just "ping" -> sendMessage "Pong!"
        Just "saluda" -> sendMessage "¡Hola! Soy un bot en Haskell."
        _ -> return ()
  | otherwise = return ()
  where
    sendMessage txt = void $ restCall (CreateMessage (messageChannelId m) txt)
