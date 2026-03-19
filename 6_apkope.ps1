$name = @("Spooler"﻿, "wuauserv")
$logfile = "$env:USERPROFILE\Documents\Servisi.log"
$time = get-date -format "yyyy-MM-dd HH:mm:ss"
foreach ($svc in $name) {
  $status = (get-service -name $svc -erroraction SilentlyContinue).Status
  if (-not $status) { $status = "Nav atrasts" }
  "$time Serviss $svc ir $status." | out-file -filepath $logfile -append
}
