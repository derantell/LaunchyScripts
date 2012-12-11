param($text)

$bytes = [System.Text.Encoding]::GetEncoding("Cyrillic").GetBytes($text)
$result = [System.Text.Encoding]::ASCII.GetString($bytes).ToLower()

$rx = [System.Text.RegularExpressions.Regex]
$result = $rx::Replace($result, "[^a-z0-9\s-]", "")
$result = $rx::Replace($result, "\s+", " ").Trim(); 
$result = $rx::Replace($result, "\s", "-");
$result | clip
