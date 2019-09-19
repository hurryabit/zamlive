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
module Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService
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
import qualified Google.Protobuf.Timestamp
 
data PackageManagementService request
     response = PackageManagementService{packageManagementServiceListKnownPackages
                                         ::
                                         request 'HsGRPC.Normal
                                           Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.ListKnownPackagesRequest
                                           Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.ListKnownPackagesResponse
                                           ->
                                           Hs.IO
                                             (response 'HsGRPC.Normal
                                                Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.ListKnownPackagesResponse),
                                         packageManagementServiceUploadDarFile ::
                                         request 'HsGRPC.Normal
                                           Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.UploadDarFileRequest
                                           Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.UploadDarFileResponse
                                           ->
                                           Hs.IO
                                             (response 'HsGRPC.Normal
                                                Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.UploadDarFileResponse)}
              deriving Hs.Generic
 
packageManagementServiceServer ::
                                 PackageManagementService HsGRPC.ServerRequest HsGRPC.ServerResponse
                                   -> HsGRPC.ServiceOptions -> Hs.IO ()
packageManagementServiceServer
  PackageManagementService{packageManagementServiceListKnownPackages
                             = packageManagementServiceListKnownPackages,
                           packageManagementServiceUploadDarFile =
                             packageManagementServiceUploadDarFile}
  (ServiceOptions serverHost serverPort useCompression
     userAgentPrefix userAgentSuffix initialMetadata sslConfig logger)
  = (HsGRPC.serverLoop
       HsGRPC.defaultOptions{HsGRPC.optNormalHandlers =
                               [(HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName
                                      "/com.digitalasset.ledger.api.v1.admin.PackageManagementService/ListKnownPackages")
                                   (HsGRPC.convertGeneratedServerHandler
                                      packageManagementServiceListKnownPackages)),
                                (HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName
                                      "/com.digitalasset.ledger.api.v1.admin.PackageManagementService/UploadDarFile")
                                   (HsGRPC.convertGeneratedServerHandler
                                      packageManagementServiceUploadDarFile))],
                             HsGRPC.optClientStreamHandlers = [],
                             HsGRPC.optServerStreamHandlers = [],
                             HsGRPC.optBiDiStreamHandlers = [], optServerHost = serverHost,
                             optServerPort = serverPort, optUseCompression = useCompression,
                             optUserAgentPrefix = userAgentPrefix,
                             optUserAgentSuffix = userAgentSuffix,
                             optInitialMetadata = initialMetadata, optSSLConfig = sslConfig,
                             optLogger = logger})
 
packageManagementServiceClient ::
                                 HsGRPC.Client ->
                                   Hs.IO
                                     (PackageManagementService HsGRPC.ClientRequest
                                        HsGRPC.ClientResult)
packageManagementServiceClient client
  = (Hs.pure PackageManagementService) <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName
               "/com.digitalasset.ledger.api.v1.admin.PackageManagementService/ListKnownPackages")))
      <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName
               "/com.digitalasset.ledger.api.v1.admin.PackageManagementService/UploadDarFile")))
 
data ListKnownPackagesRequest = ListKnownPackagesRequest{}
                              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named ListKnownPackagesRequest where
        nameOf _ = (Hs.fromString "ListKnownPackagesRequest")
 
instance HsProtobuf.HasDefault ListKnownPackagesRequest
 
instance HsProtobuf.Message ListKnownPackagesRequest where
        encodeMessage _ ListKnownPackagesRequest{} = (Hs.mconcat [])
        decodeMessage _ = (Hs.pure ListKnownPackagesRequest)
        dotProto _ = []
 
instance HsJSONPB.ToJSONPB ListKnownPackagesRequest where
        toJSONPB (ListKnownPackagesRequest) = (HsJSONPB.object [])
        toEncodingPB (ListKnownPackagesRequest) = (HsJSONPB.pairs [])
 
instance HsJSONPB.FromJSONPB ListKnownPackagesRequest where
        parseJSONPB
          = (HsJSONPB.withObject "ListKnownPackagesRequest"
               (\ obj -> (Hs.pure ListKnownPackagesRequest)))
 
instance HsJSONPB.ToJSON ListKnownPackagesRequest where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON ListKnownPackagesRequest where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema ListKnownPackagesRequest where
        declareNamedSchema _
          = do Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "ListKnownPackagesRequest",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList []}})
 
data ListKnownPackagesResponse = ListKnownPackagesResponse{listKnownPackagesResponsePackageDetails
                                                           ::
                                                           Hs.Vector
                                                             Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.PackageDetails}
                               deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named ListKnownPackagesResponse where
        nameOf _ = (Hs.fromString "ListKnownPackagesResponse")
 
instance HsProtobuf.HasDefault ListKnownPackagesResponse
 
instance HsProtobuf.Message ListKnownPackagesResponse where
        encodeMessage _
          ListKnownPackagesResponse{listKnownPackagesResponsePackageDetails =
                                      listKnownPackagesResponsePackageDetails}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (Hs.coerce
                      @(Hs.Vector Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.PackageDetails)
                      @(HsProtobuf.NestedVec Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.PackageDetails)
                      listKnownPackagesResponsePackageDetails))])
        decodeMessage _
          = (Hs.pure ListKnownPackagesResponse) <*>
              (Hs.coerce
                 @(_ (HsProtobuf.NestedVec Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.PackageDetails))
                 @(_ (Hs.Vector Com.Digitalasset.Ledger.Api.V1.Admin.PackageManagementService.PackageDetails))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Repeated
                   (HsProtobuf.Named (HsProtobuf.Single "PackageDetails")))
                (HsProtobuf.Single "package_details")
                []
                "")]
 
instance HsJSONPB.ToJSONPB ListKnownPackagesResponse where
        toJSONPB (ListKnownPackagesResponse f1)
          = (HsJSONPB.object ["package_details" .= f1])
        toEncodingPB (ListKnownPackagesResponse f1)
          = (HsJSONPB.pairs ["package_details" .= f1])
 
instance HsJSONPB.FromJSONPB ListKnownPackagesResponse where
        parseJSONPB
          = (HsJSONPB.withObject "ListKnownPackagesResponse"
               (\ obj ->
                  (Hs.pure ListKnownPackagesResponse) <*> obj .: "package_details"))
 
instance HsJSONPB.ToJSON ListKnownPackagesResponse where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON ListKnownPackagesResponse where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema ListKnownPackagesResponse where
        declareNamedSchema _
          = do let declare_package_details = HsJSONPB.declareSchemaRef
               listKnownPackagesResponsePackageDetails <- declare_package_details
                                                            Proxy.Proxy
               let _ = Hs.pure ListKnownPackagesResponse <*>
                         HsJSONPB.asProxy declare_package_details
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "ListKnownPackagesResponse",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("package_details",
                                                         listKnownPackagesResponsePackageDetails)]}})
 
data PackageDetails = PackageDetails{packageDetailsPackageId ::
                                     Hs.Text,
                                     packageDetailsPackageSize :: Hs.Word64,
                                     packageDetailsKnownSince ::
                                     Hs.Maybe Google.Protobuf.Timestamp.Timestamp,
                                     packageDetailsSourceDescription :: Hs.Text}
                    deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named PackageDetails where
        nameOf _ = (Hs.fromString "PackageDetails")
 
instance HsProtobuf.HasDefault PackageDetails
 
instance HsProtobuf.Message PackageDetails where
        encodeMessage _
          PackageDetails{packageDetailsPackageId = packageDetailsPackageId,
                         packageDetailsPackageSize = packageDetailsPackageSize,
                         packageDetailsKnownSince = packageDetailsKnownSince,
                         packageDetailsSourceDescription = packageDetailsSourceDescription}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   packageDetailsPackageId),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   packageDetailsPackageSize),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   (Hs.coerce @(Hs.Maybe Google.Protobuf.Timestamp.Timestamp)
                      @(HsProtobuf.Nested Google.Protobuf.Timestamp.Timestamp)
                      packageDetailsKnownSince)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   packageDetailsSourceDescription)])
        decodeMessage _
          = (Hs.pure PackageDetails) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              (Hs.coerce
                 @(_ (HsProtobuf.Nested Google.Protobuf.Timestamp.Timestamp))
                 @(_ (Hs.Maybe Google.Protobuf.Timestamp.Timestamp))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 3)))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 4))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "package_id")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.UInt64)
                (HsProtobuf.Single "package_size")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim
                   (HsProtobuf.Named
                      (HsProtobuf.Dots
                         (HsProtobuf.Path ("google" Hs.:| ["protobuf", "Timestamp"])))))
                (HsProtobuf.Single "known_since")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "source_description")
                []
                "")]
 
instance HsJSONPB.ToJSONPB PackageDetails where
        toJSONPB (PackageDetails f1 f2 f3 f4)
          = (HsJSONPB.object
               ["package_id" .= f1, "package_size" .= f2, "known_since" .= f3,
                "source_description" .= f4])
        toEncodingPB (PackageDetails f1 f2 f3 f4)
          = (HsJSONPB.pairs
               ["package_id" .= f1, "package_size" .= f2, "known_since" .= f3,
                "source_description" .= f4])
 
instance HsJSONPB.FromJSONPB PackageDetails where
        parseJSONPB
          = (HsJSONPB.withObject "PackageDetails"
               (\ obj ->
                  (Hs.pure PackageDetails) <*> obj .: "package_id" <*>
                    obj .: "package_size"
                    <*> obj .: "known_since"
                    <*> obj .: "source_description"))
 
instance HsJSONPB.ToJSON PackageDetails where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON PackageDetails where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema PackageDetails where
        declareNamedSchema _
          = do let declare_package_id = HsJSONPB.declareSchemaRef
               packageDetailsPackageId <- declare_package_id Proxy.Proxy
               let declare_package_size = HsJSONPB.declareSchemaRef
               packageDetailsPackageSize <- declare_package_size Proxy.Proxy
               let declare_known_since = HsJSONPB.declareSchemaRef
               packageDetailsKnownSince <- declare_known_since Proxy.Proxy
               let declare_source_description = HsJSONPB.declareSchemaRef
               packageDetailsSourceDescription <- declare_source_description
                                                    Proxy.Proxy
               let _ = Hs.pure PackageDetails <*>
                         HsJSONPB.asProxy declare_package_id
                         <*> HsJSONPB.asProxy declare_package_size
                         <*> HsJSONPB.asProxy declare_known_since
                         <*> HsJSONPB.asProxy declare_source_description
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "PackageDetails",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("package_id", packageDetailsPackageId),
                                                        ("package_size", packageDetailsPackageSize),
                                                        ("known_since", packageDetailsKnownSince),
                                                        ("source_description",
                                                         packageDetailsSourceDescription)]}})
 
data UploadDarFileRequest = UploadDarFileRequest{uploadDarFileRequestDarFile
                                                 :: Hs.ByteString}
                          deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named UploadDarFileRequest where
        nameOf _ = (Hs.fromString "UploadDarFileRequest")
 
instance HsProtobuf.HasDefault UploadDarFileRequest
 
instance HsProtobuf.Message UploadDarFileRequest where
        encodeMessage _
          UploadDarFileRequest{uploadDarFileRequestDarFile =
                                 uploadDarFileRequestDarFile}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   uploadDarFileRequestDarFile)])
        decodeMessage _
          = (Hs.pure UploadDarFileRequest) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Bytes)
                (HsProtobuf.Single "dar_file")
                []
                "")]
 
instance HsJSONPB.ToJSONPB UploadDarFileRequest where
        toJSONPB (UploadDarFileRequest f1)
          = (HsJSONPB.object ["dar_file" .= f1])
        toEncodingPB (UploadDarFileRequest f1)
          = (HsJSONPB.pairs ["dar_file" .= f1])
 
instance HsJSONPB.FromJSONPB UploadDarFileRequest where
        parseJSONPB
          = (HsJSONPB.withObject "UploadDarFileRequest"
               (\ obj -> (Hs.pure UploadDarFileRequest) <*> obj .: "dar_file"))
 
instance HsJSONPB.ToJSON UploadDarFileRequest where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON UploadDarFileRequest where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema UploadDarFileRequest where
        declareNamedSchema _
          = do let declare_dar_file = HsJSONPB.declareSchemaRef
               uploadDarFileRequestDarFile <- declare_dar_file Proxy.Proxy
               let _ = Hs.pure UploadDarFileRequest <*>
                         HsJSONPB.asProxy declare_dar_file
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "UploadDarFileRequest",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("dar_file",
                                                         uploadDarFileRequestDarFile)]}})
 
data UploadDarFileResponse = UploadDarFileResponse{}
                           deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named UploadDarFileResponse where
        nameOf _ = (Hs.fromString "UploadDarFileResponse")
 
instance HsProtobuf.HasDefault UploadDarFileResponse
 
instance HsProtobuf.Message UploadDarFileResponse where
        encodeMessage _ UploadDarFileResponse{} = (Hs.mconcat [])
        decodeMessage _ = (Hs.pure UploadDarFileResponse)
        dotProto _ = []
 
instance HsJSONPB.ToJSONPB UploadDarFileResponse where
        toJSONPB (UploadDarFileResponse) = (HsJSONPB.object [])
        toEncodingPB (UploadDarFileResponse) = (HsJSONPB.pairs [])
 
instance HsJSONPB.FromJSONPB UploadDarFileResponse where
        parseJSONPB
          = (HsJSONPB.withObject "UploadDarFileResponse"
               (\ obj -> (Hs.pure UploadDarFileResponse)))
 
instance HsJSONPB.ToJSON UploadDarFileResponse where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON UploadDarFileResponse where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema UploadDarFileResponse where
        declareNamedSchema _
          = do Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "UploadDarFileResponse",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList []}})