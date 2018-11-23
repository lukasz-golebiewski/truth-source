{-# LANGUAGE OverloadedStrings #-}
module Truth where

import Feature
import Tests
import Data.Text (Text, pack)
import Text.Pandoc.Options
import Text.Pandoc.Class
import Text.Pandoc.Readers.Markdown
import Text.Pandoc.Definition
import Control.Monad.IO.Class
import Config

generate :: (PandocMonad m, MonadIO m) => Config -> m Pandoc
generate config = do
  doc        <- readFeaturesDoc $ _features config
  features   <- loadFeatures doc
  report     <- readReport $ _tests config
  tests      <- loadTests report
  let result = combine features tests
  return $ toDoc result

readFeaturesDoc :: (PandocMonad m, MonadIO m) => String -> m Pandoc
readFeaturesDoc path = do
  raw <- liftIO $ readFile $ path
  readMarkdown def (pack raw)

readReport :: (MonadIO m) => String -> m Report
readReport path = undefined

loadFeatures :: Pandoc -> m Features
loadFeatures = undefined

loadTests :: Report -> m Tests
loadTests = undefined

combine :: Features -> Tests -> Features
combine features tests = undefined

toDoc :: Features -> Pandoc
toDoc features = undefined
