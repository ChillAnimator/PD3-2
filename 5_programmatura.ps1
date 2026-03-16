$output = winget list --source msstore --accept-source-agreements
$lines = $output -split "'r'n"
$count = 0
$data = $false
foreach ($line in $lines) {
	if ($line -match "^-") { $data = $true; continue }
	if ($data -and $line.Trim() -ne "") { $count++ }
}
write-host "Sistēmā ir instalētas $count aplikācijas no Microsoft Store."