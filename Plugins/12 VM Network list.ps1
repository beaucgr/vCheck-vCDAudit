# Start of Settings 
# End of Settings

$Report = @()
Foreach ($VM in $CIVM) {
	($VM.ExtensionData.Section | Where {$_.GetType().Name -eq "NetworkConnectionSection" }).NetworkConnection | Foreach {
		$Details = "" | Select Name, Network, IsConnected, IPAddress, MACAddress, IPAddressAllocationMode
		$Details.Name = $VM.Name
		$Details.Network = $_.Network
		$Details.IsConnected = $_.IsConnected
		$Details.IPAddress = $_.IPAddress
		$Details.MACAddress = $_.MACAddress
		$Details.IPAddressAllocationMode = $_.IPAddressAllocationMode
		$Report += $Details
	}
}
$Report


$Title = "VMs and Network Settings"
$Header =  "VMs and Network Settings"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
