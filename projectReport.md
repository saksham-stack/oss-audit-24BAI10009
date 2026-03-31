# Open Source Software Audit & FOSS Ecosystem Report  
## A Capstone Project for OSS NGMC Course

**Student Name:** Saksham Gupta

**Registration Number:** 24BAI10009

**Chosen Software:** Git (Version Control System)

**License Audited:** GNU General Public License v2 (GPL v2)

**Date of Submission:** 31 March 2026

**Course:** Open Source Software — CSE0002

**Repository:** `saksham-stack/oss-audit-24BAI10009`  
**Repo ID:** `1196547296`  
**Prepared by:** `saksham-stack`  
**Date:** **2026-03-31**  

---

## Abstract
This report documents the origin, philosophy, and practical impact of open source software (OSS) with a focus on **Git**, the **Linux** ecosystem, and the broader **FOSS** (Free and Open Source Software) landscape. It also contrasts open source with proprietary software through real deployment considerations.  
Finally, it provides documentation for a set of shell scripts that implement an “OSS audit” style workflow (identity reporting, FOSS package inspection, disk/permission auditing, log analysis, and manifesto generation).

---

# Table of Contents

- [Introduction](#introduction) 
- [Part A — Origin and Philosophy](#part-a--origin-and-philosophy)   
  - [A1. The Problem Git Was Created to Solve](#a1-the-problem-git-was-created-to-solve)   
  - [A2. The License — What It Actually Says](#a2-the-license--what-it-actually-says)   
  - [A3. The Ethics of Open Source](#a3-the-ethics-of-open-source)   
- [Part B — Linux Footprint](#part-b--linux-footprint)   
- [Part C — The FOSS Ecosystem](#part-c--the-foss-ecosystem)   
- [Part D — Open Source vs Proprietary](#part-d--open-source-vs-proprietary)   
  - [Comparison Table](#comparison-table)   
  - [Deployment Verdict](#deployment-verdict)   
- [Part E — Shell Script Documentation](#part-e--shell-script-documentation)   
  - [Script 1: System Identity Report](#script-1-system-identity-report)   
  - [Script 2: FOSS Package Inspector](#script-2-foss-package-inspector)   
  - [Script 3: Disk and Permission Auditor](#script-3-disk-and-permission-auditor)   
  - [Script 4: Log File Analyzer](#script-4-log-file-analyzer)   
  - [Script 5: Open Source Manifesto Generator](#script-5-open-source-manifesto-generator) 
- [Conclusion](#conclusion)   
- [References](#references)   

---

# Introduction

Open Source Software (OSS) has transformed the way modern computing is built, distributed, and maintained. Instead of software being a sealed product controlled entirely by one vendor, open source enables transparency, collaboration, peer review, and community-driven improvement.

This report explains the “why” and “how” behind open source by:
1. Connecting OSS philosophy to real-world engineering constraints (especially in **version control**).
2. Highlighting Linux as both a technical platform and an ecosystem multiplier.
3. Mapping the FOSS ecosystem: communities, licenses, package managers, foundations, and maintenance models.
4. Comparing OSS with proprietary solutions for **practical deployment** decisions.
5. Documenting shell scripts that can be used to audit a system and produce reports—demonstrating OSS principles via automation and reproducibility.

**Key idea:** OSS is not only a licensing model. It is a methodology that affects security, sustainability, economics, and the ethics of technology access.

---

# Part A — Origin and Philosophy

## A1. The Problem Git Was Created to Solve
Git is a distributed version control system (DVCS) designed to manage source code history efficiently. To understand why Git exists, it helps to look at the environment that motivated its creation:

### 1) The scalability problem
As large projects grow, version control must handle:
- Thousands of files changing frequently
- Many contributors working at the same time
- Branches and merges as a routine activity (not a rare event)
- High performance requirements (fast commits, fast diffs, fast checkouts)

Traditional centralized version control systems (CVCS) often rely on a central server. This creates bottlenecks:
- If the server is down, work is blocked.
- Network latency slows operations.
- Developers cannot easily work offline with full history.

Git’s approach: **every clone is a full copy of the repository**, including history.

### 2) Integrity and trust
A fundamental engineering requirement is: **history should not be silently corrupted**. Git stores content using cryptographic hashes (historically SHA-1; modern Git supports stronger hash options in some contexts). This means:
- Every commit references its parent commit(s)
- If content changes, hashes change
- Tampering becomes detectable because the chain breaks

This provides a strong *integrity model* for collaboration.

### 3) The collaboration problem: branching and merging should be normal
A good VCS should treat branching as cheap and merging as manageable. Git was designed to make:
- Local branching fast
- Merging routine
- Experimentation safe (because you can branch freely)

### 4) The productivity problem: speed is a feature
Many Git operations are local:
- Viewing history (`git log`)
- Switching branches (`git checkout` / `git switch`)
- Creating commits
- Comparing diffs

Local operations reduce reliance on server availability and improve developer flow.

### 5) The governance problem: communities are distributed
Open source communities are naturally distributed:
- Contributors across time zones
- Multiple maintainers
- Forks and external contributions

DVCS fits this model: forks are not “hacks”—they are first-class.

### Summary of A1
Git solves a real engineering problem: version control must be **fast, reliable, distributed, and integrity-preserving**, especially for large projects with many contributors.

---

## A2. The License — What It Actually Says
Open source is enabled by licenses. A license defines what users can legally do with the code. Without a license, code defaults to “all rights reserved,” meaning reuse is restricted.

### 1) Why licenses matter
Licenses decide:
- Can someone modify the code?
- Can they redistribute it?
- Can they sell it?
- Must they publish their changes?
- Must they credit authors?
- Are there patent grants?
- Is there warranty / liability protection?

### 2) Broad categories of OSS licenses
#### Permissive licenses
Examples: MIT, BSD, Apache-2.0  
Typical traits:
- Allow reuse with minimal obligations
- Often require attribution and license notice
- Apache-2.0 adds explicit patent terms

**Practical effect:** easier adoption by companies, including in proprietary products.

#### Copyleft licenses
Examples: GPLv2, GPLv3, LGPL  
Typical traits:
- If you distribute modified versions, you must provide source under the same license (strong copyleft)
- LGPL is weaker copyleft (often used for libraries)

**Practical effect:** ensures downstream freedom, but can be seen as restrictive for proprietary integration.

### 3) License compliance is an engineering concern
In real projects, compliance means:
- Tracking dependencies and their licenses
- Including license files/notices
- Providing source for copyleft obligations where required
- Auditing binaries and build artifacts

This is not optional for organizations; it’s risk management.

### Summary of A2
Licenses are the “operating system” of open source collaboration: they define the legal permissions that make sharing scalable and enforceable.

---

## A3. The Ethics of Open Source
Open source has a technical dimension and an ethical dimension. The ethical dimension appears in questions like:
- Who controls technology?
- Who benefits from innovation?
- Who is excluded?
- Who carries maintenance burdens?

### 1) Access and empowerment
Open source can lower barriers:
- Students and researchers can learn from real systems
- Small organizations can adopt high-quality tools
- Communities can localize, adapt, and improve systems

This supports digital self-determination: users can inspect and modify what they rely on.

### 2) Transparency and security
Open source promotes auditability:
- Vulnerabilities can be found by anyone
- Security tools can be reviewed publicly
- Backdoors are harder to hide (though not impossible)

Ethically, transparency can increase accountability.

### 3) The maintenance and sustainability problem
A common ethical challenge:
- Many OSS projects are relied on by large companies
- But maintainers may be unpaid or under-supported

This creates a mismatch: value extraction without proportional reinvestment.
Ethical OSS adoption should include:
- Funding (sponsorships, grants)
- Contribution of fixes/features
- Responsible disclosure and support

### 4) Community norms and inclusivity
Open source communities succeed when they manage:
- Conduct and moderation
- Inclusive contribution pathways
- Documentation and onboarding
- Clear governance

### Summary of A3
The ethics of open source go beyond “free code.” They include sustainability, accountability, fairness, and the distribution of power in the tech ecosystem.

---

# Part B — Linux Footprint
Linux is one of the most important drivers of the modern open source world. Its “footprint” can be measured not only by desktop usage, but by infrastructure dominance.

### 1) Linux as infrastructure
Linux forms the base for:
- Servers in data centers
- Cloud platforms
- Containers and orchestration environments
- Networking appliances
- Embedded systems and IoT devices
- Android’s base system (Linux kernel)

Linux’s modularity enables adaptation to many hardware profiles.

### 2) Standard tooling ecosystem
Linux systems commonly ship with:
- Shell environments (bash, zsh, sh)
- Core utilities (GNU coreutils)
- Package managers (apt, dnf, pacman, apk)
- Logging systems (syslog, journald)
- Permission models (users/groups, POSIX permissions, ACLs)

This standardized environment makes it ideal for automation and auditing.

### 3) Linux as a collaboration model
Linux also demonstrates a mature collaboration model:
- Maintainer hierarchies
- Review workflows
- Mailing lists and structured patch submissions
- Long-term support (LTS) versions

### 4) Impact on DevOps and SRE
Most automation assumptions in modern DevOps revolve around Linux:
- Shell scripts for provisioning
- Systemd services
- Log analysis pipelines
- SSH-based management
- Container runtimes and minimal distros

### Summary of Part B
Linux is not just an OS. It is a foundation that makes open source operational at global scale.

---

# Part C — The FOSS Ecosystem
The FOSS ecosystem includes far more than “code on GitHub.” It is a network of:
- communities
- foundations
- funding mechanisms
- dependency graphs
- package registries
- compliance and security practices

### 1) Roles in a FOSS project
A typical open source project includes:
- Maintainers: review, merge, release, set direction
- Contributors: features, bug fixes, docs
- Users: report issues, request features, provide feedback
- Sponsors: fund maintainers or infrastructure
- Downstream packagers: adapt projects to distros

### 2) Distribution channels
Open source reaches users through:
- Source repositories (Git hosting platforms)
- Release artifacts (tarballs, binaries)
- Package registries (PyPI, npm, Maven Central)
- Linux repos (Debian/Ubuntu, Fedora, Arch)
- Containers (Docker Hub, GHCR)

### 3) Dependency reality: everything depends on everything
Modern software is built from dependencies. This increases velocity, but also creates:
- Security risk (supply chain)
- Maintenance risk (abandoned packages)
- License complexity (many licenses in one build)

### 4) Security in the ecosystem
Security mechanisms include:
- CVE reporting processes
- Signed commits/tags (where adopted)
- Reproducible builds (in some ecosystems)
- SBOMs (software bills of materials)
- Dependency auditing tools

### Summary of Part C
FOSS is a living supply chain. Managing it requires both community awareness and engineering discipline.

---

# Part D — Open Source vs Proprietary
Both models can produce high-quality software, but the trade-offs differ. The choice depends on objectives: cost, compliance, control, support requirements, and time-to-market.

## Comparison Table
| Category | Open Source Software | Proprietary Software |
|---|---|---|
| Source availability | Usually available | Not available |
| Customization | High (you can modify) | Limited (vendor-controlled) |
| Vendor lock-in | Lower (in many cases) | Often higher |
| Cost model | Often free to use; costs shift to support/ops | Licensing/subscription common |
| Security visibility | Auditable by community | Depends on vendor transparency |
| Support | Community + paid options | Vendor support contracts |
| Update control | You can patch/fork | Vendor controls roadmap |
| Compliance | License obligations vary | Contract terms + usage restrictions |
| Longevity | Can outlive vendors if community persists | Product can be discontinued |
| Best use cases | Infrastructure, tooling, standards | Specialized vertical products |

## Deployment Verdict
A practical deployment decision can follow these criteria:

### When open source is the better choice
- You need auditability and transparency
- You need custom integrations or modifications
- You want to avoid lock-in
- You can invest in internal expertise or paid support
- You value interoperability and open standards

### When proprietary may be the better choice
- You need a single accountable vendor for SLA/support
- The product is highly specialized and OSS alternatives are immature
- Compliance requires a certified vendor solution
- Time constraints favor “buy vs build”
- The organization lacks capacity to maintain or customize OSS

### Final recommendation approach
A good strategy is often hybrid:
- OSS for infrastructure and foundational tooling
- Proprietary products for specialized workflows where vendor support is critical
- Clear policy for licensing, security, and maintenance ownership

---

# Part E — Shell Script Documentation
This section documents the scripts conceptually, so a reader can understand the purpose, inputs, outputs, and expected behavior.

> If your repository contains actual script filenames, replace the placeholders below with exact names/paths (for example: `scripts/system_identity_report.sh`).

## Script 1: System Identity Report
### Purpose
Collect a quick identity summary of the current machine and environment to support auditing and reproducibility.

### What it typically reports
- Current user and effective user (`whoami`, `id`)
- Hostname and OS info (`hostname`, `uname -a`, `/etc/os-release`)
- Kernel version
- System uptime
- CPU and memory summary (`lscpu`, `free -h`)
- Network identity (IP addresses, interfaces)

### Inputs
- No required arguments (optional: output file path)

### Outputs
- A human-readable report printed to stdout
- Optional: saved report file

### Why this matters in an OSS audit
When comparing results across machines, you need context: OS version, kernel version, and identity affect installed packages, logs, and permissions.

---

## Script 2: FOSS Package Inspector
### Purpose
List installed packages and identify which are open source / FOSS-related (depending on available metadata).

### Typical checks
- Detect package manager:
  - Debian/Ubuntu: `dpkg`, `apt`
  - Fedora/RHEL: `rpm`, `dnf`
  - Arch: `pacman`
- Output package list
- Optionally: show package origin/repo and versions

### Inputs
- Optional filters (package name pattern)
- Optional output format (table/text)

### Outputs
- List of installed packages and versions
- Optional summary counts (total packages, top categories)

### Why this matters
Dependency transparency is the basis of compliance, vulnerability scanning, and reproducibility.

---

## Script 3: Disk and Permission Auditor
### Purpose
Audit disk usage and highlight permission-sensitive directories/files that may introduce security risk.

### Typical checks
- Disk usage summary (`df -h`)
- Directory size scan (`du -sh` for key folders)
- World-writable files/directories
- SUID/SGID binaries (potential escalation surface)
- Home directory permission sanity checks

### Inputs
- Optional directory scope (default: `/` or current directory)
- Optional depth limits for scanning

### Outputs
- Disk usage report
- List of permission findings (with paths and permission bits)

### Why this matters
Misconfigurations are a common security issue; auditing permissions is a low-cost way to reduce risk.

---

## Script 4: Log File Analyzer
### Purpose
Extract and summarize useful signals from system logs to support troubleshooting and security monitoring.

### Typical sources
- `/var/log/syslog`, `/var/log/auth.log` (Debian-like systems)
- `/var/log/messages`, `/var/log/secure` (RHEL-like systems)
- `journalctl` output (systemd environments)

### Typical analysis
- Count errors by type/keyword (failed login, sudo usage, service failures)
- Show recent critical entries
- Detect repeated suspicious patterns (brute force attempts, repeated failures)

### Inputs
- Optional time range (e.g., last 24h)
- Optional keyword filters
- Optional output file

### Outputs
- Summary statistics (counts)
- Highlighted log snippets

### Why this matters
Logs are the evidence layer. Auditing without logs misses operational reality.

---

## Script 5: Open Source Manifesto Generator
### Purpose
Generate a short manifesto-style text explaining open source values and why the project follows OSS principles.

### Typical content sections
- Why transparency matters
- Why community collaboration matters
- How licensing supports freedom and reuse
- Sustainability and responsible use of OSS

### Inputs
- Optional: project name, author name, date, output path

### Outputs
- A manifesto printed to stdout or saved as a `.md` file

### Why this matters
Projects are social artifacts, not only code artifacts. A manifesto clarifies intent and guiding values.

---

# Conclusion
Open source is a combination of **technical design**, **legal licensing**, and **community governance**. Git represents the technical response to collaboration at scale. Linux represents an ecosystem where open source becomes operationally dominant. The FOSS ecosystem shows how software is maintained as a shared public resource—often with complex sustainability challenges.

The shell scripts described in this report demonstrate how open source principles translate into real engineering practice: automation, transparency, auditability, and reproducibility.

---

# References
1. Open Source Initiative (OSI) — Open Source Definition (OSD)  
2. GNU Project — Free Software Definition and philosophy  
3. Git documentation (official) — concepts: commits, branching, distributed model  
4. Linux kernel documentation and community process references  
5. SPDX and SBOM references for license and supply-chain documentation  
6. Common Linux documentation references (`man` pages for core utilities, permissions, logging)

---

