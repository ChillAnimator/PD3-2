$status = get-mpcomputerstatus
$score = 100
if (-not $status.RealTimeProtectionEnabled) { $score -= 50 }
if ($status.AntivirusSignatureAge -gt 3) { $score -= 20 }
if ($status.QuickScanAge -gt 7) { $score -= 20 }
write-host "Drosibas ratings: $score / 100"