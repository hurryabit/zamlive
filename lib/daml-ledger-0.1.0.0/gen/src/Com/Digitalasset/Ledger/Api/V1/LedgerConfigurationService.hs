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
module Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService
       where
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
import Network.GRPC.HighLevel.Generated as HsGRPC
import Network.GRPC.HighLevel.Client as HsGRPC
import Network.GRPC.HighLevel.Server as HsGRPC hiding (serverLoop)
import Network.GRPC.HighLevel.Server.Unregistered as HsGRPC
       (serverLoop)
import qualified Google.Protobuf.Duration
import qualified Com.Digitalasset.Ledger.Api.V1.TraceContext
 
data LedgerConfigurationService request
     response = LedgerConfigurationService{ledgerConfigurationServiceGetLedgerConfiguration
                                           ::
                                           request 'HsGRPC.ServerStreaming
                                             Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.GetLedgerConfigurationRequest
                                             Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.GetLedgerConfigurationResponse
                                             ->
                                             Hs.IO
                                               (response 'HsGRPC.ServerStreaming
                                                  Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.GetLedgerConfigurationResponse)}
              deriving Hs.Generic
 
ledgerConfigurationServiceServer ::
                                   LedgerConfigurationService HsGRPC.ServerRequest
                                     HsGRPC.ServerResponse
                                     -> HsGRPC.ServiceOptions -> Hs.IO ()
ledgerConfigurationServiceServer
  LedgerConfigurationService{ledgerConfigurationServiceGetLedgerConfiguration
                               = ledgerConfigurationServiceGetLedgerConfiguration}
  (ServiceOptions serverHost serverPort useCompression
     userAgentPrefix userAgentSuffix initialMetadata sslConfig logger)
  = (HsGRPC.serverLoop
       HsGRPC.defaultOptions{HsGRPC.optNormalHandlers = [],
                             HsGRPC.optClientStreamHandlers = [],
                             HsGRPC.optServerStreamHandlers =
                               [(HsGRPC.ServerStreamHandler
                                   (HsGRPC.MethodName
                                      "/com.digitalasset.ledger.api.v1.LedgerConfigurationService/GetLedgerConfiguration")
                                   (HsGRPC.convertGeneratedServerWriterHandler
                                      ledgerConfigurationServiceGetLedgerConfiguration))],
                             HsGRPC.optBiDiStreamHandlers = [], optServerHost = serverHost,
                             optServerPort = serverPort, optUseCompression = useCompression,
                             optUserAgentPrefix = userAgentPrefix,
                             optUserAgentSuffix = userAgentSuffix,
                             optInitialMetadata = initialMetadata, optSSLConfig = sslConfig,
                             optLogger = logger})
 
ledgerConfigurationServiceClient ::
                                   HsGRPC.Client ->
                                     Hs.IO
                                       (LedgerConfigurationService HsGRPC.ClientRequest
                                          HsGRPC.ClientResult)
ledgerConfigurationServiceClient client
  = (Hs.pure LedgerConfigurationService) <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName
               "/com.digitalasset.ledger.api.v1.LedgerConfigurationService/GetLedgerConfiguration")))
 
data GetLedgerConfigurationRequest = GetLedgerConfigurationRequest{getLedgerConfigurationRequestLedgerId
                                                                   :: Hs.Text,
                                                                   getLedgerConfigurationRequestTraceContext
                                                                   ::
                                                                   Hs.Maybe
                                                                     Com.Digitalasset.Ledger.Api.V1.TraceContext.TraceContext}
                                   deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named GetLedgerConfigurationRequest where
        nameOf _ = (Hs.fromString "GetLedgerConfigurationRequest")
 
instance HsProtobuf.HasDefault GetLedgerConfigurationRequest
 
instance HsProtobuf.Message GetLedgerConfigurationRequest where
        encodeMessage _
          GetLedgerConfigurationRequest{getLedgerConfigurationRequestLedgerId
                                          = getLedgerConfigurationRequestLedgerId,
                                        getLedgerConfigurationRequestTraceContext =
                                          getLedgerConfigurationRequestTraceContext}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   getLedgerConfigurationRequestLedgerId),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1000)
                   (Hs.coerce
                      @(Hs.Maybe Com.Digitalasset.Ledger.Api.V1.TraceContext.TraceContext)
                      @(HsProtobuf.Nested Com.Digitalasset.Ledger.Api.V1.TraceContext.TraceContext)
                      getLedgerConfigurationRequestTraceContext))])
        decodeMessage _
          = (Hs.pure GetLedgerConfigurationRequest) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (Hs.coerce
                 @(_ (HsProtobuf.Nested Com.Digitalasset.Ledger.Api.V1.TraceContext.TraceContext))
                 @(_ (Hs.Maybe Com.Digitalasset.Ledger.Api.V1.TraceContext.TraceContext))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1000)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "ledger_id")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1000)
                (HsProtobuf.Prim
                   (HsProtobuf.Named (HsProtobuf.Single "TraceContext")))
                (HsProtobuf.Single "trace_context")
                []
                "")]
 
instance HsJSONPB.ToJSONPB GetLedgerConfigurationRequest where
        toJSONPB (GetLedgerConfigurationRequest f1 f1000)
          = (HsJSONPB.object ["ledger_id" .= f1, "trace_context" .= f1000])
        toEncodingPB (GetLedgerConfigurationRequest f1 f1000)
          = (HsJSONPB.pairs ["ledger_id" .= f1, "trace_context" .= f1000])
 
instance HsJSONPB.FromJSONPB GetLedgerConfigurationRequest where
        parseJSONPB
          = (HsJSONPB.withObject "GetLedgerConfigurationRequest"
               (\ obj ->
                  (Hs.pure GetLedgerConfigurationRequest) <*> obj .: "ledger_id" <*>
                    obj .: "trace_context"))
 
instance HsJSONPB.ToJSON GetLedgerConfigurationRequest where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON GetLedgerConfigurationRequest where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema GetLedgerConfigurationRequest where
        declareNamedSchema _
          = do let declare_ledger_id = HsJSONPB.declareSchemaRef
               getLedgerConfigurationRequestLedgerId <- declare_ledger_id
                                                          Proxy.Proxy
               let declare_trace_context = HsJSONPB.declareSchemaRef
               getLedgerConfigurationRequestTraceContext <- declare_trace_context
                                                              Proxy.Proxy
               let _ = Hs.pure GetLedgerConfigurationRequest <*>
                         HsJSONPB.asProxy declare_ledger_id
                         <*> HsJSONPB.asProxy declare_trace_context
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "GetLedgerConfigurationRequest",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("ledger_id",
                                                         getLedgerConfigurationRequestLedgerId),
                                                        ("trace_context",
                                                         getLedgerConfigurationRequestTraceContext)]}})
 
data GetLedgerConfigurationResponse = GetLedgerConfigurationResponse{getLedgerConfigurationResponseLedgerConfiguration
                                                                     ::
                                                                     Hs.Maybe
                                                                       Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.LedgerConfiguration}
                                    deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named GetLedgerConfigurationResponse where
        nameOf _ = (Hs.fromString "GetLedgerConfigurationResponse")
 
instance HsProtobuf.HasDefault GetLedgerConfigurationResponse
 
instance HsProtobuf.Message GetLedgerConfigurationResponse where
        encodeMessage _
          GetLedgerConfigurationResponse{getLedgerConfigurationResponseLedgerConfiguration
                                           = getLedgerConfigurationResponseLedgerConfiguration}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (Hs.coerce
                      @(Hs.Maybe Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.LedgerConfiguration)
                      @(HsProtobuf.Nested Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.LedgerConfiguration)
                      getLedgerConfigurationResponseLedgerConfiguration))])
        decodeMessage _
          = (Hs.pure GetLedgerConfigurationResponse) <*>
              (Hs.coerce
                 @(_ (HsProtobuf.Nested Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.LedgerConfiguration))
                 @(_ (Hs.Maybe Com.Digitalasset.Ledger.Api.V1.LedgerConfigurationService.LedgerConfiguration))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim
                   (HsProtobuf.Named (HsProtobuf.Single "LedgerConfiguration")))
                (HsProtobuf.Single "ledger_configuration")
                []
                "")]
 
instance HsJSONPB.ToJSONPB GetLedgerConfigurationResponse where
        toJSONPB (GetLedgerConfigurationResponse f1)
          = (HsJSONPB.object ["ledger_configuration" .= f1])
        toEncodingPB (GetLedgerConfigurationResponse f1)
          = (HsJSONPB.pairs ["ledger_configuration" .= f1])
 
instance HsJSONPB.FromJSONPB GetLedgerConfigurationResponse where
        parseJSONPB
          = (HsJSONPB.withObject "GetLedgerConfigurationResponse"
               (\ obj ->
                  (Hs.pure GetLedgerConfigurationResponse) <*>
                    obj .: "ledger_configuration"))
 
instance HsJSONPB.ToJSON GetLedgerConfigurationResponse where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON GetLedgerConfigurationResponse where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema GetLedgerConfigurationResponse where
        declareNamedSchema _
          = do let declare_ledger_configuration = HsJSONPB.declareSchemaRef
               getLedgerConfigurationResponseLedgerConfiguration <- declare_ledger_configuration
                                                                      Proxy.Proxy
               let _ = Hs.pure GetLedgerConfigurationResponse <*>
                         HsJSONPB.asProxy declare_ledger_configuration
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "GetLedgerConfigurationResponse",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("ledger_configuration",
                                                         getLedgerConfigurationResponseLedgerConfiguration)]}})
 
data LedgerConfiguration = LedgerConfiguration{ledgerConfigurationMinTtl
                                               :: Hs.Maybe Google.Protobuf.Duration.Duration,
                                               ledgerConfigurationMaxTtl ::
                                               Hs.Maybe Google.Protobuf.Duration.Duration}
                         deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named LedgerConfiguration where
        nameOf _ = (Hs.fromString "LedgerConfiguration")
 
instance HsProtobuf.HasDefault LedgerConfiguration
 
instance HsProtobuf.Message LedgerConfiguration where
        encodeMessage _
          LedgerConfiguration{ledgerConfigurationMinTtl =
                                ledgerConfigurationMinTtl,
                              ledgerConfigurationMaxTtl = ledgerConfigurationMaxTtl}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (Hs.coerce @(Hs.Maybe Google.Protobuf.Duration.Duration)
                      @(HsProtobuf.Nested Google.Protobuf.Duration.Duration)
                      ledgerConfigurationMinTtl)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   (Hs.coerce @(Hs.Maybe Google.Protobuf.Duration.Duration)
                      @(HsProtobuf.Nested Google.Protobuf.Duration.Duration)
                      ledgerConfigurationMaxTtl))])
        decodeMessage _
          = (Hs.pure LedgerConfiguration) <*>
              (Hs.coerce
                 @(_ (HsProtobuf.Nested Google.Protobuf.Duration.Duration))
                 @(_ (Hs.Maybe Google.Protobuf.Duration.Duration))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
              <*>
              (Hs.coerce
                 @(_ (HsProtobuf.Nested Google.Protobuf.Duration.Duration))
                 @(_ (Hs.Maybe Google.Protobuf.Duration.Duration))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 2)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim
                   (HsProtobuf.Named
                      (HsProtobuf.Dots
                         (HsProtobuf.Path ("google" Hs.:| ["protobuf", "Duration"])))))
                (HsProtobuf.Single "min_ttl")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim
                   (HsProtobuf.Named
                      (HsProtobuf.Dots
                         (HsProtobuf.Path ("google" Hs.:| ["protobuf", "Duration"])))))
                (HsProtobuf.Single "max_ttl")
                []
                "")]
 
instance HsJSONPB.ToJSONPB LedgerConfiguration where
        toJSONPB (LedgerConfiguration f1 f2)
          = (HsJSONPB.object ["min_ttl" .= f1, "max_ttl" .= f2])
        toEncodingPB (LedgerConfiguration f1 f2)
          = (HsJSONPB.pairs ["min_ttl" .= f1, "max_ttl" .= f2])
 
instance HsJSONPB.FromJSONPB LedgerConfiguration where
        parseJSONPB
          = (HsJSONPB.withObject "LedgerConfiguration"
               (\ obj ->
                  (Hs.pure LedgerConfiguration) <*> obj .: "min_ttl" <*>
                    obj .: "max_ttl"))
 
instance HsJSONPB.ToJSON LedgerConfiguration where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON LedgerConfiguration where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema LedgerConfiguration where
        declareNamedSchema _
          = do let declare_min_ttl = HsJSONPB.declareSchemaRef
               ledgerConfigurationMinTtl <- declare_min_ttl Proxy.Proxy
               let declare_max_ttl = HsJSONPB.declareSchemaRef
               ledgerConfigurationMaxTtl <- declare_max_ttl Proxy.Proxy
               let _ = Hs.pure LedgerConfiguration <*>
                         HsJSONPB.asProxy declare_min_ttl
                         <*> HsJSONPB.asProxy declare_max_ttl
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "LedgerConfiguration",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("min_ttl", ledgerConfigurationMinTtl),
                                                        ("max_ttl", ledgerConfigurationMaxTtl)]}})