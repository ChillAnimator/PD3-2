$name = @("Spooler", "wuauserv")
$log = "Services.log"
foreach ($Sname in $name) {
	$name = get-service -name $Sname -erroraction SilentlyContinue
	if ($name) {
		$time = get-date -format "yyyy-MM-dd HH:mm:ss"
		$entry = "[$time] Serviss [$($name.Name)] ir [$($name.Status)]."
		add-content -path $log -value $entry
	}
	else {
		write-warning "Serviss $Sname not found šaja sistema!"
	}
}
