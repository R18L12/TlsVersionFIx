# 🛡️ Rex Connectivity Assistant

**Rex Connectivity Assistant** is a streamlined utility designed to automatically configure Windows TLS security protocols for the campus network. This tool ensures your device meets the security standards required to connect to the internet.

---

### ✨ Features

* **One-Click Fix:** Automatically edits the necessary registry keys for TLS 1.2/1.3 support.
* **Safety First:** Includes a visual progress indicator and checks for Administrator privileges automatically.
* **Student Friendly:** No command line required—just a simple, clean interface.
* **Preventative:** Prompts users to save their work before allowing a restart.

---

## 🚀 How to Use

1.  **Launch**
    Double-click `Rex-Connect.exe`.
    > *Note: If prompted by Windows User Account Control (UAC), click **Yes** to allow Administrator access.*

2.  **Apply Fix**
    Click the **"🔒 Apply Security Fix"** button. The tool will verify your registry settings (this takes a few seconds).

3.  **Success**
    Once the progress bar reaches 100%, the status text will turn **Green**.

4.  **Finish**
    Click **"Restart Computer"** to finalize the changes.
    * ⚠️ *Make sure to save any open Word docs or homework before clicking this!*

---

## 🛠️ Build Instructions (For IT Staff)

To compile the updated GUI script into a standalone executable, use the following `ps2exe` parameters.

**Note:** The `-noConsole` flag is critical to ensure the black PowerShell window does not appear behind the app.

```powershell
ps2exe `
  -InputFile ".\Rex-Connect.ps1" `
  -OutputFile ".\Rex-Connect.exe" `
  -noConsole `
  -requireAdmin `
  -title "Rex Connectivity Assistant" `
  -description "Campus Network TLS Configuration Utility" `
  -version "2.0.0" `
  -copyright "IT Support Services"