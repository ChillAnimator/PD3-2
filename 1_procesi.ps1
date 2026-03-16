$ram = 150 * 1MB
$elimination = "msedge"
$process = get-process | where-object {
	$_.WorkingSet -gt $ram -and $_.ProcessName -ne $elimination
}
$process | select-object Name, Id, WorkingSet |
	export-csv -path "$env:USERPROFILE\Documents\LielieProcesi.csv" -NoTypeInformation