$days = 3
$name = "Application"
$dpath = [Environment]::GetFolderPath("MyDocuments")
$fpath = join-path -path $dpath -childpath "Warnings.txt"
$startTime = (get-date).AddDays(-$days)
get-eventlog -logname $name -after $startTime |
	where-object { $_.EntryType -eq "Warning" } |
	out-file -filepath $fpath -force
"`n`n--- Top 3 Warning Sources ---`n" | out-file -filepath $fpath -append
get-eventlog -logname $name -after $startTime |
	where-object { $_.EntryType -eq "Warning" } |
	group-object -property Source |
	sort-object -property Count -descending |
	select-object -First 3 |
	out-file -filepath $fpath -append
