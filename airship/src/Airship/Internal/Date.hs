module Airship.Internal.Date
    ( parseRfc1123Date
    , utcTimeToRfc1123
    )
where

import Data.ByteString (ByteString)
import Data.Time.Clock (UTCTime)
import qualified Network.HTTP.Date as HTTP

parseRfc1123Date :: ByteString -> Maybe UTCTime
parseRfc1123Date = fmap HTTP.httpDateToUTC . HTTP.parseHTTPDate

utcTimeToRfc1123 :: UTCTime -> ByteString
utcTimeToRfc1123 = HTTP.formatHTTPDate . HTTP.utcToHTTPDate
