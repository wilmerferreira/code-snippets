$CanonicalName = "CanonicalName"
$SamAccountName = "SamAccountName"
$SID = "SID"

[PSCustomObject]@{ GroupPath = $CanonicalName; GroupName = $SamAccountName; UserID = $SID } | FT