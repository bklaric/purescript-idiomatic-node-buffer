module Node.Buffer
    ( Buffer
    , alloc
    , allocBuffer
    , allocInteger
    , allocString
    , allocString_
    , fromString
    , fromString_
    ) where

import Control.Monad.Effect (Effect)
import Data.Foreign (Foreign, toForeign)
import Node.Encoding (Encoding, toNodeString)

foreign import data Buffer :: Type

foreign import undefined :: forall anything. anything

foreign import allocImpl :: Int -> Foreign -> String -> Effect Buffer

alloc :: Int -> Effect Buffer
alloc size = allocImpl size undefined undefined

allocBuffer :: Int -> Buffer -> Effect Buffer
allocBuffer size fill = allocImpl size (toForeign fill) undefined

allocInteger :: Int -> Int -> Effect Buffer
allocInteger size fill = allocImpl size (toForeign fill) undefined

allocString :: Int -> String -> Encoding -> Effect Buffer
allocString size fill encoding =
    allocImpl size (toForeign fill) (toNodeString encoding)

allocString_ :: Int -> String -> Effect Buffer
allocString_ size fill = allocImpl size (toForeign fill) undefined

foreign import fromStringImpl :: String -> String -> Effect Buffer

fromString :: String -> Encoding -> Effect Buffer
fromString string encoding = fromStringImpl string (toNodeString encoding)

fromString_ :: String -> Effect Buffer
fromString_ string = fromStringImpl string undefined
