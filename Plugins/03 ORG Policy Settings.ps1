# Start of Settings 
# End of Settings

$Org | Foreach {
	$_ | Select Name, `
	@{N="vAppMaxRuntimeLeaseDays";E={(New-Timespan -Seconds $_.ExtensionData.Settings.vAppLeaseSettings.DeploymentLeaseSeconds).TotalDays}}, `
	@{N="vAppMaxStorageLeaseDays";E={(New-Timespan -Seconds $_.ExtensionData.Settings.vAppLeaseSettings.StorageLeaseSeconds).TotalDays}}, `
	@{N="vAppStorageCleanup";E={If ($_.ExtensionData.Settings.vAppLeaseSettings.DeleteOnStorageLeaseExpiration) { "Delete" } Else { "Move"}}}, `
	@{N="TemplateMaxStorageLeaseDays";E={(New-Timespan -Seconds $_.ExtensionData.Settings.vAppTemplateLeaseSettings.StorageLeaseSeconds).TotalDays}}, `
	@{N="TemplateStorageCleanup";E={If ($_.ExtensionData.Settings.vAppTemplateLeaseSettings.DeleteOnStorageLeaseExpiration) { "Delete" } Else { "Move"}}}, `
	@{N="RunningVMQuota";E={$_.DeployedVMQuota}}, `
	@{N="StoredVMQuota";E={$_.StoredVMQuota}} `
}
	

$Title = "Org Policy Settings"
$Header =  "List of all Orgs and their Policy Settings"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
