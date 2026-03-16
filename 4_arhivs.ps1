$downloads = "$env:USERPROFILE\Downloads"
$documents = "$env:USERPROFILE\Documents"
$cutoff = (get-date).AddHours(-48)
$pdfs = get-childitem -path $downloads -filter *.pdf -recurse | where-object {
	$_.LastWriteTime -gt $cutoff
}

if($pdfs) {
	$zip = "$documents\PDF_Backup.zip"
	compress-archive -path $pdfs.FullName -destinationpath $zip -force
}
else {
	write-host "Nav atrasts nekads PDF files in the last 48 hours"
}