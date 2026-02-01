Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- 1. ADMIN CHECK (Essential for Professional Scripts) ---
# If not admin, restart the script as admin automatically.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# --- Configuration ---
$regPath = "HKLM:\SYSTEM\ControlSet001\Services\RasMan\PPP\EAP\13"
$BrandColor = [System.Drawing.Color]::FromArgb(163, 22, 33) # A professional "University Crimson"
$AccentColor = [System.Drawing.Color]::FromArgb(45, 52, 54) # Dark Slate Grey

# --- Main Window Setup ---
$form = New-Object System.Windows.Forms.Form
$form.Text = "Rex Connectivity Assistant"
$form.Size = New-Object System.Drawing.Size(450, 550)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle" # Prevents resizing glitches
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::White

# --- Header Section (Modern Flat Design) ---
$header = New-Object System.Windows.Forms.Panel
$header.Size = New-Object System.Drawing.Size(450, 130)
$header.BackColor = $BrandColor
$form.Controls.Add($header)

# Icon/Logo (Using Unicode to avoid external image dependencies)
$icon = New-Object System.Windows.Forms.Label
$icon.Text = "🛡️" 
$icon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 40)
$icon.ForeColor = [System.Drawing.Color]::White
$icon.AutoSize = $true
$icon.BackColor = [System.Drawing.Color]::Transparent
$icon.Location = New-Object System.Drawing.Point(190, 15)
$header.Controls.Add($icon)

$headerText = New-Object System.Windows.Forms.Label
$headerText.Text = "REX CONNECT"
$headerText.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$headerText.ForeColor = [System.Drawing.Color]::White
$headerText.AutoSize = $false
$headerText.TextAlign = "MiddleCenter"
$headerText.Size = New-Object System.Drawing.Size(450, 40)
$headerText.Location = New-Object System.Drawing.Point(0, 85)
$header.Controls.Add($headerText)

# --- Friendly Instructions ---
$subHeader = New-Object System.Windows.Forms.Label
$subHeader.Text = "Network Security Update"
$subHeader.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$subHeader.ForeColor = $AccentColor
$subHeader.Location = New-Object System.Drawing.Point(30, 150)
$subHeader.AutoSize = $true
$form.Controls.Add($subHeader)

$infoLabel = New-Object System.Windows.Forms.Label
$infoLabel.Text = "To access the campus network, we need to update your PC's TLS security protocols.`n`nThis is a one-time fix. Please follow the steps below."
$infoLabel.Location = New-Object System.Drawing.Point(30, 180)
$infoLabel.Size = New-Object System.Drawing.Size(380, 60)
$infoLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$infoLabel.ForeColor = [System.Drawing.Color]::DimGray
$form.Controls.Add($infoLabel)

# --- Visual Progress Bar (Psychology: Makes it feel like it's working) ---
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(35, 250)
$progressBar.Size = New-Object System.Drawing.Size(360, 10)
$progressBar.Style = "Continuous"
$form.Controls.Add($progressBar)

# --- Status Label ---
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Status: Waiting to apply fix..."
$statusLabel.Location = New-Object System.Drawing.Point(30, 270)
$statusLabel.Size = New-Object System.Drawing.Size(380, 30)
$statusLabel.TextAlign = "MiddleCenter"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Italic)
$statusLabel.ForeColor = [System.Drawing.Color]::Gray
$form.Controls.Add($statusLabel)

# --- Action Buttons (Modern Styling) ---
$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Text = "🔒  Apply Security Fix"
$btnApply.Location = New-Object System.Drawing.Point(85, 320)
$btnApply.Size = New-Object System.Drawing.Size(260, 50)
$btnApply.BackColor = $AccentColor
$btnApply.ForeColor = [System.Drawing.Color]::White
$btnApply.FlatStyle = "Flat"
$btnApply.FlatAppearance.BorderSize = 0
$btnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnApply.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($btnApply)

$btnRestart = New-Object System.Windows.Forms.Button
$btnRestart.Text = "Restart Computer"
$btnRestart.Location = New-Object System.Drawing.Point(85, 385)
$btnRestart.Size = New-Object System.Drawing.Size(260, 50)
$btnRestart.Enabled = $false
$btnRestart.BackColor = [System.Drawing.Color]::WhiteSmoke
$btnRestart.ForeColor = [System.Drawing.Color]::LightGray # Dimmed out
$btnRestart.FlatStyle = "Flat"
$btnRestart.FlatAppearance.BorderSize = 1
$btnRestart.FlatAppearance.BorderColor = [System.Drawing.Color]::LightGray
$btnRestart.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$form.Controls.Add($btnRestart)

# --- Footer (Copyright/Help) ---
$footer = New-Object System.Windows.Forms.Label
$footer.Text = "IT Support | v1.0 Student Edition"
$footer.AutoSize = $false
$footer.TextAlign = "MiddleCenter"
$footer.Dock = "Bottom"
$footer.Padding = New-Object System.Windows.Forms.Padding(0,0,0,10)
$footer.ForeColor = [System.Drawing.Color]::Silver
$footer.Font = New-Object System.Drawing.Font("Segoe UI", 8)
$form.Controls.Add($footer)

# --- LOGIC ---

$btnApply.Add_Click({
    # 1. Simulate "Thinking" (User psychology: instant clicks feel broken)
    $btnApply.Enabled = $false
    $form.Cursor = [System.Windows.Forms.Cursors]::WaitCursor
    $statusLabel.Text = "Checking registry configuration..."
    
    for($i=0; $i -le 100; $i+=10){
        $progressBar.Value = $i
        Start-Sleep -Milliseconds 50
        [System.Windows.Forms.Application]::DoEvents()
    }

    try {
        # 2. The Actual Work
        if (-not (Test-Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
        New-ItemProperty -Path $regPath -Name "TlsVersion" -PropertyType DWord -Value 0xFC0 -Force | Out-Null
        
        # 3. Success State
        $progressBar.Value = 100
        $statusLabel.Text = "SUCCESS: Security protocols updated."
        $statusLabel.ForeColor = [System.Drawing.Color]::Green
        $statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
        
        $btnApply.Text = "✅  Fix Applied"
        $btnApply.BackColor = [System.Drawing.Color]::SeaGreen

        # Enable Restart Button
        $btnRestart.Enabled = $true
        $btnRestart.Cursor = [System.Windows.Forms.Cursors]::Hand
        $btnRestart.BackColor = $BrandColor
        $btnRestart.ForeColor = [System.Drawing.Color]::White
        $btnRestart.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
        
        [System.Windows.Forms.MessageBox]::Show("Great! The fix is applied.`n`nPlease restart your computer to finalize the connection.", "Success")
    }
    catch {
        $statusLabel.Text = "Error: Something went wrong."
        $statusLabel.ForeColor = [System.Drawing.Color]::Red
        [System.Windows.Forms.MessageBox]::Show("Error details: $($_.Exception.Message)", "Error")
    }
    finally {
        $form.Cursor = [System.Windows.Forms.Cursors]::Default
    }
})

$btnRestart.Add_Click({
    $res = [System.Windows.Forms.MessageBox]::Show("This will restart your computer immediately.`n`nPlease save any open homework or files first.`n`nReady to restart?", "Restart Required", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($res -eq "Yes") {
        Restart-Computer -Force
    }
})

# --- Run ---
$form.ShowDialog()