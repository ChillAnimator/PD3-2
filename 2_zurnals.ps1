$days = 3
$logName = "Application"
$docPath = [Environment]::GetFolderPath("MyDocuments")
$filePath = Join-Path -Path $docPath -ChildPath "Warnings.txt"
$startTime = (Get-Date).AddDays(-$days)
Get-EventLog -LogName $logName -After $startTime |
	Where-Object { $_.EntryType -eq "Warning" } |
	Out-File -FilePath $filePath -Force
"`n`n--- Top 3 Warning Sources (Count) ---`n" | Out-File -FilePath $filePath -Append
Get-EventLog -LogName $logName -After $startTime |
	Where-Object { $_.EntryType -eq "Warning" } |
	Group-Object -Property Source |
	Sort-Object -Property Count -Descending |
	Select-Object -First 3 |
	Out-File -FilePath $filePath -Append
