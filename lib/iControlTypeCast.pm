#===========================================================================
#
# iControlTypeCast.pm
#
#===========================================================================
#
# The contents of this file are subject to the "END USER LICENSE AGREEMENT FOR F5
# Software Development Kit for iControl"; you may not use this file except in
# compliance with the License. The License is included in the iControl
# Software Development Kit.
#
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
# the License for the specific language governing rights and limitations
# under the License.
#
# The Original Code is iControl Code and related documentation
# distributed by F5.
#
# The Initial Developer of the Original Code is F5 Networks,
# Inc. Seattle, WA, USA. Portions created by F5 are Copyright (C) 1996-2013 F5 Networks,
# Inc. All Rights Reserved.  iControl (TM) is a registered trademark of F5 Networks, Inc.
#
# Alternatively, the contents of this file may be used under the terms
# of the GNU General Public License (the "GPL"), in which case the
# provisions of GPL are applicable instead of those above.  If you wish
# to allow use of your version of this file only under the terms of the
# GPL and not to allow others to use your version of this file under the
# License, indicate your decision by deleting the provisions above and
# replace them with the notice and other provisions required by the GPL.
# If you do not delete the provisions above, a recipient may use your
# version of this file under either the License or the GPL.
#

package iControlTypeCast;
require SOAP::Lite;

my $urnMap;

sub BEGIN
{
	$urnMap =
	{
    "{urn:iControl}ASM.ApplyLearningType" => 1,
    "{urn:iControl}ASM.DosDetectionMode" => 1,
    "{urn:iControl}ASM.DosOperationMode" => 1,
    "{urn:iControl}ASM.DynamicSessionsInUrlType" => 1,
    "{urn:iControl}ASM.FlagState" => 1,
    "{urn:iControl}ASM.LoggingLogicOperation" => 1,
    "{urn:iControl}ASM.LoggingRemoteFacility" => 1,
    "{urn:iControl}ASM.LoggingRemoteProtocol" => 1,
    "{urn:iControl}ASM.LoggingRemoteStorageType" => 1,
    "{urn:iControl}ASM.LoggingRequestSearchTarget" => 1,
    "{urn:iControl}ASM.LoggingRequestType" => 1,
    "{urn:iControl}ASM.LoggingStorageFormatType" => 1,
    "{urn:iControl}ASM.PolicyTemplate" => 1,
    "{urn:iControl}ASM.ProtocolType" => 1,
    "{urn:iControl}ASM.SeverityName" => 1,
    "{urn:iControl}ASM.ViolationName" => 1,
    "{urn:iControl}ASM.WebApplicationLanguage" => 1,
    "{urn:iControl}Classification.SignatureDefinition.SignatureUpdateProgressStatusType" => 1,
    "{urn:iControl}Classification.SignatureUpdateSchedule.SignatureUpdateIntervalType" => 1,
    "{urn:iControl}Common.ArmedState" => 1,
    "{urn:iControl}Common.AuthenticationMethod" => 1,
    "{urn:iControl}Common.AutoLasthop" => 1,
    "{urn:iControl}Common.AvailabilityStatus" => 1,
    "{urn:iControl}Common.DaemonStatus" => 1,
    "{urn:iControl}Common.EnabledState" => 1,
    "{urn:iControl}Common.EnabledStatus" => 1,
    "{urn:iControl}Common.FileChainType" => 1,
    "{urn:iControl}Common.FirewallPolicyType" => 1,
    "{urn:iControl}Common.FirewallRuleAction" => 1,
    "{urn:iControl}Common.FirewallRulePlacementType" => 1,
    "{urn:iControl}Common.FirewallRuleState" => 1,
    "{urn:iControl}Common.HAAction" => 1,
    "{urn:iControl}Common.HAState" => 1,
    "{urn:iControl}Common.IPHostType" => 1,
    "{urn:iControl}Common.MetadataPersistence" => 1,
    "{urn:iControl}Common.PoolProfileType" => 1,
    "{urn:iControl}Common.ProtocolType" => 1,
    "{urn:iControl}Common.SFlowGlobalType" => 1,
    "{urn:iControl}Common.SourcePortBehavior" => 1,
    "{urn:iControl}Common.StatisticType" => 1,
    "{urn:iControl}Common.TMOSModule" => 1,
    "{urn:iControl}Common.UnitType" => 1,
    "{urn:iControl}Common.VerificationStatus" => 1,
    "{urn:iControl}GlobalLB.Application.ApplicationObjectType" => 1,
    "{urn:iControl}GlobalLB.DNSSECKey.KeyAlgorithm" => 1,
    "{urn:iControl}GlobalLB.DNSSECKey.KeyType" => 1,
    "{urn:iControl}GlobalLB.DNSSECZone.HashAlgorithm" => 1,
    "{urn:iControl}GlobalLB.Monitor.IntPropertyType" => 1,
    "{urn:iControl}GlobalLB.Monitor.StrPropertyType" => 1,
    "{urn:iControl}GlobalLB.Monitor.TemplateType" => 1,
    "{urn:iControl}GlobalLB.WideIP.LBDecisionLogVerbosity" => 1,
    "{urn:iControl}GlobalLB.AddressType" => 1,
    "{urn:iControl}GlobalLB.AutoConfigurationState" => 1,
    "{urn:iControl}GlobalLB.AvailabilityDependency" => 1,
    "{urn:iControl}GlobalLB.DomainNameCheckMode" => 1,
    "{urn:iControl}GlobalLB.HardwareSecurityModuleType" => 1,
    "{urn:iControl}GlobalLB.LBMethod" => 1,
    "{urn:iControl}GlobalLB.LDNSProbeProtocol" => 1,
    "{urn:iControl}GlobalLB.LinkWeightType" => 1,
    "{urn:iControl}GlobalLB.MetricLimitType" => 1,
    "{urn:iControl}GlobalLB.MonitorAssociationRemovalRule" => 1,
    "{urn:iControl}GlobalLB.MonitorInstanceStateType" => 1,
    "{urn:iControl}GlobalLB.MonitorRuleType" => 1,
    "{urn:iControl}GlobalLB.RegionDBType" => 1,
    "{urn:iControl}GlobalLB.RegionType" => 1,
    "{urn:iControl}GlobalLB.ServerType" => 1,
    "{urn:iControl}LocalLB.Class.ClassType" => 1,
    "{urn:iControl}LocalLB.Class.FileFormatType" => 1,
    "{urn:iControl}LocalLB.Class.FileModeType" => 1,
    "{urn:iControl}LocalLB.DNSExpress.NOTIFYAction" => 1,
    "{urn:iControl}LocalLB.DNSExpress.TSIGKeyAlgorithm" => 1,
    "{urn:iControl}LocalLB.LSNPool.HairpinMode" => 1,
    "{urn:iControl}LocalLB.LSNPool.NATMode" => 1,
    "{urn:iControl}LocalLB.LSNPool.PersistMode" => 1,
    "{urn:iControl}LocalLB.Monitor.IntPropertyType" => 1,
    "{urn:iControl}LocalLB.Monitor.StrPropertyType" => 1,
    "{urn:iControl}LocalLB.Monitor.TemplateType" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.AnalyticsAlertGranularity" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.AnalyticsAlertMetric" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.AnalyticsAlertThresholdRelation" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.CapturedProtocol" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.LoggingFacility" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.SessionCookieSecurityMode" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.SessionTimeout" => 1,
    "{urn:iControl}LocalLB.ProfileAnalytics.TransactionPart" => 1,
    "{urn:iControl}LocalLB.ProfileDNS.DNS64AdditionalSectionRewrite" => 1,
    "{urn:iControl}LocalLB.ProfileDNS.DNS64Mode" => 1,
    "{urn:iControl}LocalLB.ProfileDNS.DNSLastAction" => 1,
    "{urn:iControl}LocalLB.ProfileDiameterEndpoint.DiameterApplicationType" => 1,
    "{urn:iControl}LocalLB.ProfileFastL4.PVAOffloadState" => 1,
    "{urn:iControl}LocalLB.ProfileHttp.ViaHeader" => 1,
    "{urn:iControl}LocalLB.ProfilePersistence.PersistenceHashMethod" => 1,
    "{urn:iControl}LocalLB.ProfileRequestLogging.Protocol" => 1,
    "{urn:iControl}LocalLB.ProfileSIP.RTPProxyStyle" => 1,
    "{urn:iControl}LocalLB.ProfileSPDY.ActivationMode" => 1,
    "{urn:iControl}LocalLB.ProfileSPDY.PriorityMode" => 1,
    "{urn:iControl}LocalLB.ProfileSPDY.SupportedProtocolVersion" => 1,
    "{urn:iControl}LocalLB.ProfileUserStatistic.UserStatisticKey" => 1,
    "{urn:iControl}LocalLB.ProfileWebAcceleration.CacheVaryType" => 1,
    "{urn:iControl}LocalLB.RAMCacheInformation.RAMCacheVaryType" => 1,
    "{urn:iControl}LocalLB.RateClass.DirectionType" => 1,
    "{urn:iControl}LocalLB.RateClass.DropPolicyType" => 1,
    "{urn:iControl}LocalLB.RateClass.QueueType" => 1,
    "{urn:iControl}LocalLB.RateClass.UnitType" => 1,
    "{urn:iControl}LocalLB.Rule.VerificationStatus" => 1,
    "{urn:iControl}LocalLB.VirtualServer.SourceAddressTranslationType" => 1,
    "{urn:iControl}LocalLB.VirtualServer.VirtualServerCMPEnableMode" => 1,
    "{urn:iControl}LocalLB.VirtualServer.VirtualServerType" => 1,
    "{urn:iControl}LocalLB.AdaptServiceDownAction" => 1,
    "{urn:iControl}LocalLB.AddressType" => 1,
    "{urn:iControl}LocalLB.AuthenticationMethod" => 1,
    "{urn:iControl}LocalLB.AvailabilityStatus" => 1,
    "{urn:iControl}LocalLB.ClientSSLCertificateMode" => 1,
    "{urn:iControl}LocalLB.ClonePoolType" => 1,
    "{urn:iControl}LocalLB.CompressionMethod" => 1,
    "{urn:iControl}LocalLB.CookiePersistenceMethod" => 1,
    "{urn:iControl}LocalLB.CredentialSource" => 1,
    "{urn:iControl}LocalLB.DNSCacheLocalZoneType" => 1,
    "{urn:iControl}LocalLB.DNSCacheType" => 1,
    "{urn:iControl}LocalLB.DataGroupType" => 1,
    "{urn:iControl}LocalLB.EnabledStatus" => 1,
    "{urn:iControl}LocalLB.HardwareAccelerationMode" => 1,
    "{urn:iControl}LocalLB.HttpChunkMode" => 1,
    "{urn:iControl}LocalLB.HttpCompressionMode" => 1,
    "{urn:iControl}LocalLB.HttpRedirectRewriteMode" => 1,
    "{urn:iControl}LocalLB.LBMethod" => 1,
    "{urn:iControl}LocalLB.MonitorAssociationRemovalRule" => 1,
    "{urn:iControl}LocalLB.MonitorInstanceStateType" => 1,
    "{urn:iControl}LocalLB.MonitorRuleType" => 1,
    "{urn:iControl}LocalLB.MonitorStatus" => 1,
    "{urn:iControl}LocalLB.PersistenceMode" => 1,
    "{urn:iControl}LocalLB.ProfileContextType" => 1,
    "{urn:iControl}LocalLB.ProfileMode" => 1,
    "{urn:iControl}LocalLB.ProfileType" => 1,
    "{urn:iControl}LocalLB.RamCacheCacheControlMode" => 1,
    "{urn:iControl}LocalLB.RateLimitMode" => 1,
    "{urn:iControl}LocalLB.ResponseControlMode" => 1,
    "{urn:iControl}LocalLB.RtspProxyType" => 1,
    "{urn:iControl}LocalLB.SSLCertificateExtension" => 1,
    "{urn:iControl}LocalLB.SSLOption" => 1,
    "{urn:iControl}LocalLB.SecureRenegotiationMode" => 1,
    "{urn:iControl}LocalLB.ServerSSLCertificateMode" => 1,
    "{urn:iControl}LocalLB.ServiceDownAction" => 1,
    "{urn:iControl}LocalLB.SessionStatus" => 1,
    "{urn:iControl}LocalLB.SnatType" => 1,
    "{urn:iControl}LocalLB.TCPCongestionControlMode" => 1,
    "{urn:iControl}LocalLB.TCPOptionMode" => 1,
    "{urn:iControl}LocalLB.UncleanShutdownMode" => 1,
    "{urn:iControl}LocalLB.VirtualAddressStatusDependency" => 1,
    "{urn:iControl}LocalLB.WACacheControlMode" => 1,
    "{urn:iControl}Log.DestinationRemoteHighSpeedLog.HighSpeedLogProtocol" => 1,
    "{urn:iControl}Log.Filter.Source" => 1,
    "{urn:iControl}Log.SyslogFacility" => 1,
    "{urn:iControl}Log.SyslogFormat" => 1,
    "{urn:iControl}Log.SyslogLevel" => 1,
    "{urn:iControl}Management.Device.ChassisVersion" => 1,
    "{urn:iControl}Management.DeviceGroup.DeviceSyncType" => 1,
    "{urn:iControl}Management.DeviceGroup.MemberState" => 1,
    "{urn:iControl}Management.DeviceGroup.StatusColor" => 1,
    "{urn:iControl}Management.DeviceGroup.Type" => 1,
    "{urn:iControl}Management.EM.TaskStatus" => 1,
    "{urn:iControl}Management.EventNotification.EventDataType" => 1,
    "{urn:iControl}Management.EventSubscription.AuthenticationMode" => 1,
    "{urn:iControl}Management.EventSubscription.EventType" => 1,
    "{urn:iControl}Management.EventSubscription.ObjectType" => 1,
    "{urn:iControl}Management.EventSubscription.SubscriptionStatusCode" => 1,
    "{urn:iControl}Management.KeyCertificate.CertificateType" => 1,
    "{urn:iControl}Management.KeyCertificate.KeyType" => 1,
    "{urn:iControl}Management.KeyCertificate.ManagementModeType" => 1,
    "{urn:iControl}Management.KeyCertificate.SecurityType" => 1,
    "{urn:iControl}Management.KeyCertificate.ValidityType" => 1,
    "{urn:iControl}Management.Provision.ProvisionLevel" => 1,
    "{urn:iControl}Management.SMTPConfiguration.EncryptedConnectionType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.AuthType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.DiskCheckType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.LevelType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.ModelType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.PrefixType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.PrivacyProtocolType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.SinkType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.TransportType" => 1,
    "{urn:iControl}Management.SNMPConfiguration.ViewType" => 1,
    "{urn:iControl}Management.UserManagement.UserRole" => 1,
    "{urn:iControl}Management.DebugLevel" => 1,
    "{urn:iControl}Management.LDAPPasswordEncodingOption" => 1,
    "{urn:iControl}Management.LDAPSSLOption" => 1,
    "{urn:iControl}Management.LDAPSSOOption" => 1,
    "{urn:iControl}Management.LDAPSearchMethod" => 1,
    "{urn:iControl}Management.LDAPSearchScope" => 1,
    "{urn:iControl}Management.OCSPDigestMethod" => 1,
    "{urn:iControl}Management.RadiusServiceType" => 1,
    "{urn:iControl}Management.ZoneType" => 1,
    "{urn:iControl}Networking.ARP.NDPState" => 1,
    "{urn:iControl}Networking.Interfaces.BundleState" => 1,
    "{urn:iControl}Networking.Interfaces.LLDPAdminStatus" => 1,
    "{urn:iControl}Networking.Interfaces.MediaType" => 1,
    "{urn:iControl}Networking.PacketFilterGlobals.DefaultAction" => 1,
    "{urn:iControl}Networking.ProfileWCCPGRE.WCCPGREForwarding" => 1,
    "{urn:iControl}Networking.RouteDomainV2.RoutingProtocol" => 1,
    "{urn:iControl}Networking.STPInstance.PathCostType" => 1,
    "{urn:iControl}Networking.STPInstanceV2.PathCostType" => 1,
    "{urn:iControl}Networking.SelfIPPortLockdown.AllowMode" => 1,
    "{urn:iControl}Networking.SelfIPV2.AllowMode" => 1,
    "{urn:iControl}Networking.Trunk.DistributionHashOption" => 1,
    "{urn:iControl}Networking.Trunk.LACPTimeoutOption" => 1,
    "{urn:iControl}Networking.Trunk.LinkSelectionPolicy" => 1,
    "{urn:iControl}Networking.Tunnel.TunnelDirection" => 1,
    "{urn:iControl}Networking.VLAN.VLANCMPHash" => 1,
    "{urn:iControl}Networking.VLANGroup.VLANGroupTransparency" => 1,
    "{urn:iControl}Networking.iSessionLocalInterface.NatSourceAddress" => 1,
    "{urn:iControl}Networking.iSessionPeerDiscovery.DiscoveryMode" => 1,
    "{urn:iControl}Networking.iSessionPeerDiscovery.FilterMode" => 1,
    "{urn:iControl}Networking.iSessionRemoteInterface.NatSourceAddress" => 1,
    "{urn:iControl}Networking.iSessionRemoteInterface.OriginState" => 1,
    "{urn:iControl}Networking.iSessionRemoteInterfaceV2.NatSourceAddress" => 1,
    "{urn:iControl}Networking.iSessionRemoteInterfaceV2.OriginState" => 1,
    "{urn:iControl}Networking.FilterAction" => 1,
    "{urn:iControl}Networking.FlowControlType" => 1,
    "{urn:iControl}Networking.IPCompAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecDiffieHellmanGroup" => 1,
    "{urn:iControl}Networking.IPsecDirection" => 1,
    "{urn:iControl}Networking.IPsecDynSaEncryptAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecIkeEncrAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecIkeHashAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecIkeLogLevel" => 1,
    "{urn:iControl}Networking.IPsecIkePeerCertType" => 1,
    "{urn:iControl}Networking.IPsecIkePeerGeneratePolicy" => 1,
    "{urn:iControl}Networking.IPsecIkePeerIDType" => 1,
    "{urn:iControl}Networking.IPsecIkePeerMode" => 1,
    "{urn:iControl}Networking.IPsecIkePeerNatTraversal" => 1,
    "{urn:iControl}Networking.IPsecManSaEncrAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecMode" => 1,
    "{urn:iControl}Networking.IPsecProtocol" => 1,
    "{urn:iControl}Networking.IPsecSaAuthAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecSaManAlgorithm" => 1,
    "{urn:iControl}Networking.IPsecSaMethod" => 1,
    "{urn:iControl}Networking.IPsecTrafficSelectorAction" => 1,
    "{urn:iControl}Networking.LearningMode" => 1,
    "{urn:iControl}Networking.MediaStatus" => 1,
    "{urn:iControl}Networking.MemberTagType" => 1,
    "{urn:iControl}Networking.MemberType" => 1,
    "{urn:iControl}Networking.PhyMasterSlaveMode" => 1,
    "{urn:iControl}Networking.RouteEntryType" => 1,
    "{urn:iControl}Networking.STPLinkType" => 1,
    "{urn:iControl}Networking.STPModeType" => 1,
    "{urn:iControl}Networking.STPRoleType" => 1,
    "{urn:iControl}Networking.STPStateType" => 1,
    "{urn:iControl}Networking.TunnelProtocol" => 1,
    "{urn:iControl}PEM.Policy.FilterOperationType" => 1,
    "{urn:iControl}PEM.Policy.GateStatusType" => 1,
    "{urn:iControl}PEM.Policy.L2EndpointType" => 1,
    "{urn:iControl}PEM.Policy.ProtocolType" => 1,
    "{urn:iControl}PEM.Policy.ReportGranularityType" => 1,
    "{urn:iControl}PEM.ServiceChainEndpoint.ServiceOptionType" => 1,
    "{urn:iControl}PEM.Subscriber.SessionDBPolicyType" => 1,
    "{urn:iControl}PEM.Subscriber.SessionDBSubscriberType" => 1,
    "{urn:iControl}PEM.Subscriber.SubscriberIdType" => 1,
    "{urn:iControl}PEM.PersistenceType" => 1,
    "{urn:iControl}Security.DoSDevice.DoSDeviceVector" => 1,
    "{urn:iControl}Security.FirewallWeeklySchedule.FWWeekDay" => 1,
    "{urn:iControl}Security.LogProfile.DNSStorageFormat" => 1,
    "{urn:iControl}Security.LogProfile.EntryLength" => 1,
    "{urn:iControl}Security.LogProfile.FilterKey" => 1,
    "{urn:iControl}Security.LogProfile.LogicOperation" => 1,
    "{urn:iControl}Security.LogProfile.NetworkStorageFormat" => 1,
    "{urn:iControl}Security.LogProfile.RemoteFacility" => 1,
    "{urn:iControl}Security.LogProfile.RemoteProtocol" => 1,
    "{urn:iControl}Security.LogProfile.RemoteStorage" => 1,
    "{urn:iControl}Security.LogProfile.ResponseLogging" => 1,
    "{urn:iControl}Security.LogProfile.SIPStorageFormat" => 1,
    "{urn:iControl}Security.LogProfile.StorageFormat" => 1,
    "{urn:iControl}Security.ProfileDoS.Anomaly" => 1,
    "{urn:iControl}Security.ProfileDoS.DNSQuery" => 1,
    "{urn:iControl}Security.ProfileDoS.NetworkAttackVector" => 1,
    "{urn:iControl}Security.ProfileDoS.OperationMode" => 1,
    "{urn:iControl}Security.ProfileDoS.SIPAttackVector" => 1,
    "{urn:iControl}Security.ProfileIPIntelligence.Action" => 1,
    "{urn:iControl}Security.HeaderOpcode" => 1,
    "{urn:iControl}Security.QueryType" => 1,
    "{urn:iControl}System.ConfigSync.ConfigExcludeComponent" => 1,
    "{urn:iControl}System.ConfigSync.ConfigIncludeComponent" => 1,
    "{urn:iControl}System.ConfigSync.LoadMode" => 1,
    "{urn:iControl}System.ConfigSync.SaveMode" => 1,
    "{urn:iControl}System.ConfigSync.SyncMode" => 1,
    "{urn:iControl}System.Disk.APPVOwner" => 1,
    "{urn:iControl}System.Disk.APPVPreservabilityMode" => 1,
    "{urn:iControl}System.Disk.LogicalDiskUserMode" => 1,
    "{urn:iControl}System.Disk.RAIDStatus" => 1,
    "{urn:iControl}System.Failover.FailoverMode" => 1,
    "{urn:iControl}System.Failover.FailoverState" => 1,
    "{urn:iControl}System.HAGroup.HAGroupClusterAttribute" => 1,
    "{urn:iControl}System.HAGroup.HAGroupPoolAttribute" => 1,
    "{urn:iControl}System.HAGroup.HAGroupTrunkAttribute" => 1,
    "{urn:iControl}System.HAStatus.Feature" => 1,
    "{urn:iControl}System.Services.ServiceAction" => 1,
    "{urn:iControl}System.Services.ServiceStatusType" => 1,
    "{urn:iControl}System.Services.ServiceType" => 1,
    "{urn:iControl}System.Session.ReturnedPath" => 1,
    "{urn:iControl}System.Statistics.GtmIQueryState" => 1,
    "{urn:iControl}System.Statistics.GtmPathStatisticObjectType" => 1,
    "{urn:iControl}System.VCMP.VCMPGuestState" => 1,
    "{urn:iControl}System.VCMP.VCMPNetworkMode" => 1,
    "{urn:iControl}System.VCMP.VCMPOperatingSystem" => 1,
    "{urn:iControl}System.VCMP.VCMPSlotAllocation" => 1,
    "{urn:iControl}System.VCMP.VCMPStatus" => 1,
    "{urn:iControl}System.VCMP.VirtualDiskStatus" => 1,
    "{urn:iControl}System.CPUMetricType" => 1,
    "{urn:iControl}System.ChassisSlotState" => 1,
    "{urn:iControl}System.ConnectionType" => 1,
    "{urn:iControl}System.FanMetricType" => 1,
    "{urn:iControl}System.HardwareType" => 1,
    "{urn:iControl}System.PSMetricType" => 1,
    "{urn:iControl}System.TemperatureMetricType" => 1,
    "{urn:iControl}WebAccelerator.Applications.ETag" => 1,
    "{urn:iControl}WebAccelerator.Applications.InfoHeader" => 1,
    "{urn:iControl}iCall.GeneralHandlerState" => 1,
    "{urn:iControl}iCall.MatchAlgorithm" => 1,
    "{urn:iControl}iCall.PerpetualHandlerState" => 1,
	}
}
sub END {}
no warnings 'redefine';
#Implement Typecast for iControl enumeration Elements
sub SOAP::Deserializer::typecast
{
	my ($self, $value, $name, $attrs, $children, $type) = @_;
	my $retval = undef;
	if (defined $type) {
    if (defined $urnMap->{$type} )
	  {
		  $retval = $value;
	  } else {
      # print "-- undef iControl type: $type \n";
    }
  }
	return $retval;
}
# End Of File

