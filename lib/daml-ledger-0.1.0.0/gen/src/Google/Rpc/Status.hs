{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module Google.Rpc.Status where
import qualified Prelude as Hs
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.DotProto as HsProtobuf
import qualified Proto3.Suite.JSONPB as HsJSONPB
import Proto3.Suite.JSONPB ((.=), (.:))
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import qualified Control.Applicative as Hs
import Control.Applicative ((<*>), (<|>), (<$>))
import qualified Control.DeepSeq as Hs
import qualified Control.Monad as Hs
import qualified Data.ByteString as Hs
import qualified Data.Coerce as Hs
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.List.NonEmpty as Hs (NonEmpty(..))
import qualified Data.Map as Hs (Map, mapKeysMonotonic)
import qualified Data.Proxy as Proxy
import qualified Data.String as Hs (fromString)
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Enum as Hs
import qualified GHC.Generics as Hs
import qualified Unsafe.Coerce as Hs
import qualified Google.Protobuf.Any
 
data Status = Status{statusCode :: Hs.Int32,
                     statusMessage :: Hs.Text,
                     statusDetails :: Hs.Vector Google.Protobuf.Any.Any}
            deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named Status where
        nameOf _ = (Hs.fromString "Status")
 
instance HsProtobuf.HasDefault Status
 
instance HsProtobuf.Message Status where
        encodeMessage _
          Status{statusCode = statusCode, statusMessage = statusMessage,
                 statusDetails = statusDetails}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   statusCode),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   statusMessage),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   (Hs.coerce @(Hs.Vector Google.Protobuf.Any.Any)
                      @(HsProtobuf.NestedVec Google.Protobuf.Any.Any)
                      statusDetails))])
        decodeMessage _
          = (Hs.pure Status) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              (Hs.coerce @(_ (HsProtobuf.NestedVec Google.Protobuf.Any.Any))
                 @(_ (Hs.Vector Google.Protobuf.Any.Any))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 3)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "code")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "message")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Repeated
                   (HsProtobuf.Named
                      (HsProtobuf.Dots
                         (HsProtobuf.Path ("google" Hs.:| ["protobuf", "Any"])))))
                (HsProtobuf.Single "details")
                []
                "")]
 
instance HsJSONPB.ToJSONPB Status where
        toJSONPB (Status f1 f2 f3)
          = (HsJSONPB.object
               ["code" .= f1, "message" .= f2, "details" .= f3])
        toEncodingPB (Status f1 f2 f3)
          = (HsJSONPB.pairs ["code" .= f1, "message" .= f2, "details" .= f3])
 
instance HsJSONPB.FromJSONPB Status where
        parseJSONPB
          = (HsJSONPB.withObject "Status"
               (\ obj ->
                  (Hs.pure Status) <*> obj .: "code" <*> obj .: "message" <*>
                    obj .: "details"))
 
instance HsJSONPB.ToJSON Status where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON Status where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema Status where
        declareNamedSchema _
          = do let declare_code = HsJSONPB.declareSchemaRef
               statusCode <- declare_code Proxy.Proxy
               let declare_message = HsJSONPB.declareSchemaRef
               statusMessage <- declare_message Proxy.Proxy
               let declare_details = HsJSONPB.declareSchemaRef
               statusDetails <- declare_details Proxy.Proxy
               let _ = Hs.pure Status <*> HsJSONPB.asProxy declare_code <*>
                         HsJSONPB.asProxy declare_message
                         <*> HsJSONPB.asProxy declare_details
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName = Hs.Just "Status",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("code", statusCode),
                                                        ("message", statusMessage),
                                                        ("details", statusDetails)]}})