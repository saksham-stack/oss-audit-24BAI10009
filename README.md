# oss-audit-24BAI10009 — Open Source / Linux Audit Scripts

A small collection of **Bash** scripts that demonstrate basic Linux/WSL system auditing tasks (system identity, package inspection, directory audit, log analysis, and generating a short “open-source manifesto”).

> Repository: `saksham-stack/oss-audit-24BAI10009`  
> Scripts live in: `scripts/`  
> Example outputs/screenshots live in: `screenshots/`

---

## Table of Contents

- [Project Overview](#project-overview)
- [Repository Structure](#repository-structure)
- [Environment Setup](#environment-setup)
  - [Recommended OS](#recommended-os)
  - [Prerequisites](#prerequisites)
  - [Clone the Repository](#clone-the-repository)
- [Dependencies (Table)](#dependencies-table)
- [How to Run](#how-to-run)
  - [Make scripts executable](#make-scripts-executable)
  - [Run a script](#run-a-script)
- [Scripts Description](#scripts-description)
  - [Script 1 — System Identity Report](#script-1--system-identity-report)
  - [Script 2 — FOSS Package Inspector (Git)](#script-2--foss-package-inspector-git)
  - [Script 3 — Disk and Permission Auditor](#script-3--disk-and-permission-auditor)
  - [Script 4 — Log File Analyzer](#script-4--log-file-analyzer)
  - [Script 5 — Open Source Manifesto Generator](#script-5--open-source-manifesto-generator)
- [Notes / Troubleshooting](#notes--troubleshooting)
- [License](#license)

---

## Project Overview

This repository contains **5 Bash scripts** that:
- Print **system identity** information (kernel, user, uptime, etc.)
- Check whether an **open-source package (Git)** is installed and show package metadata
- Audit **directory permissions and disk usage** for common system paths
- Scan a system log file for a keyword and report match counts
- Interactively generate a short **manifesto text file** based on user input

---

## Repository Structure

```text
oss-audit-24BAI10009/
├── LICENSE
├── README.md
├── scripts/
│   ├── script1_system_identity.sh
│   ├── script2_PackageInspector.sh
│   ├── script3_Disk_Permission_Auditor.sh
│   ├── script4_fileAnalyzer.sh
│   └── script5_manifestoGenerator.sh
└── screenshots/
    ├── script1_output.png
    ├── script2_output.png
    ├── script3_output.png
    ├── script4_output.png
    └── script5_output.png
```

---

## Environment Setup

### Recommended OS
These scripts are designed for:
- **Ubuntu / Debian-based Linux**, or
- **WSL (Windows Subsystem for Linux)** running Ubuntu/Debian

Some commands (like `dpkg`) assume a Debian-based environment.

### Prerequisites
- A Bash shell (`bash`)
- Basic GNU/Linux utilities (most are installed by default on Ubuntu)
- Optional but recommended: `git` (also inspected by Script 2)

### Clone the Repository
```bash
git clone https://github.com/saksham-stack/oss-audit-24BAI10009.git
cd oss-audit-24BAI10009
```

---

## Dependencies (Table)

| Script / Component | Commands Used | Package / Source | Notes |
|---|---|---|---|
| All scripts | `bash` | system (Bash shell) | Scripts have `#!/bin/bash` shebang |
| Script 1: `script1_system_identity.sh` | `uname`, `whoami`, `uptime`, `date`, env var `HOME` | coreutils / procps (typical default) | Prints identity + kernel + uptime + date |
| Script 2: `script2_PackageInspector.sh` | `dpkg`, `grep`, `dpkg -l`, `dpkg -s` | `dpkg` (Debian/Ubuntu) | Will not work as-is on Fedora/Arch/macOS |
| Script 3: `script3_Disk_Permission_Auditor.sh` | `ls`, `awk`, `du`, `cut` | coreutils + awk | Audits `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp` |
| Script 4: `script4_fileAnalyzer.sh` | `grep`, `tail`, `while read` | grep/coreutils | Reads `/var/log/alternatives.log` and searches keyword |
| Script 5: `script5_manifestoGenerator.sh` | `read`, `whoami`, `date`, `cat` | bash + coreutils | Writes `manifesto_<user>.txt` in repo directory |

---

## How to Run

### Make scripts executable
From the repo root:
```bash
chmod +x scripts/*.sh
```

### Run a script
Examples:
```bash
./scripts/script1_system_identity.sh
./scripts/script2_PackageInspector.sh
./scripts/script3_Disk_Permission_Auditor.sh
./scripts/script4_fileAnalyzer.sh
./scripts/script5_manifestoGenerator.sh
```

---

## Scripts Description

### Script 1 — System Identity Report
**File:** `scripts/script1_system_identity.sh`

**What it does**
- Prints a header and basic machine/user information:
  - Kernel version (`uname -r`)
  - Current user (`whoami`)
  - Home directory (`$HOME`)
  - Uptime (`uptime -p`)
  - Date/time (`date`)
- Includes a short note about GNU GPL licensing.

**Run**
```bash
./scripts/script1_system_identity.sh
```

---

### Script 2 — FOSS Package Inspector (Git)
**File:** `scripts/script2_PackageInspector.sh`

**What it does**
- Checks whether **Git** is installed using `dpkg`
- If installed:
  - prints package status and selected metadata (Version/License/Description)
- Prints a short “philosophy” statement using a `case` statement

**Run**
```bash
./scripts/script2_PackageInspector.sh
```

**Note**
- This script assumes a Debian/Ubuntu system because it uses `dpkg`.

---

### Script 3 — Disk and Permission Auditor
**File:** `scripts/script3_Disk_Permission_Auditor.sh`

**What it does**
- Iterates over common directories:
  - `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`
- For each directory that exists, prints:
  - Permissions + owner/group (via `ls -ld` and `awk`)
  - Total size (via `du -sh`)

**Run**
```bash
./scripts/script3_Disk_Permission_Auditor.sh
```

---

### Script 4 — Log File Analyzer
**File:** `scripts/script4_fileAnalyzer.sh`

**What it does**
- Reads `/var/log/alternatives.log` line-by-line
- Counts how many lines match a keyword (case-insensitive)
- Displays the last 3 matching lines

**Current configuration**
- `LOGFILE="/var/log/alternatives.log"`
- `KEYWORD="status"`

**Run**
```bash
./scripts/script4_fileAnalyzer.sh
```

**Note**
- If `alternatives.log` does not exist on your distro, change `LOGFILE` to a log file that exists (for example `/var/log/syslog` on Ubuntu).

---

### Script 5 — Open Source Manifesto Generator
**File:** `scripts/script5_manifestoGenerator.sh`

**What it does**
- Prompts the user for 3 inputs:
  - open-source tool used daily
  - what “freedom” means (one word)
  - what the user would build and share
- Writes a file named:
  - `manifesto_<username>.txt`
- Prints the saved manifesto

**Run**
```bash
./scripts/script5_manifestoGenerator.sh
```

**Output**
- A text file is created in the **current directory** (usually repo root if run from there).

---

## Notes / Troubleshooting

- **Permission denied** when running scripts:
  ```bash
  chmod +x scripts/*.sh
  ```
- **Script 2 fails on non-Ubuntu/non-Debian**:
  - Replace `dpkg` usage with your distro equivalent (e.g., `rpm -qi`, `pacman -Qi`, etc.).
- **Script 4 log file not found**:
  - Edit `LOGFILE` inside `scripts/script4_fileAnalyzer.sh` to a valid log path for your system.

---

## License

See [`LICENSE`](LICENSE).
