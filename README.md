# 🔍 Super OSINT Checker

**Author**: [Lee Page]  
**Platform**: Kali Linux  
**Version**: 1.0  
**License**: For personal and investigative use only. Not for unauthorized surveillance.

## 🚀 Overview

**Super OSINT Checker** is a multi-platform reconnaissance tool designed to identify the presence of **email addresses**, **usernames**, and **phone numbers** across a wide range of **dating**, **social**, and **communication platforms**.

The tool is ideal for:
- Digital footprint mapping
- Infidelity investigations
- Identity verification
- Cybersecurity OSINT (Open Source Intelligence) workflows

> Outputs include: Account presence, redirect metadata, HTTP response codes, hints (username fragments), and last login info (when available).

---

## 📌 Features

- ✅ Checks **50+ platforms** (Tinder, Ashley Madison, WhatsApp, Skype, Twilio, Plenty of Fish, etc.)
- ✅ Validates **email**, **username**, and **phone number** presence
- ✅ Detects redirect behavior, metadata, and HTTP 200/302/403/405 indicators
- ✅ Logs output to both terminal and `results/` folder with highlights
- ✅ Fully bash-compatible and works natively in Kali Linux

---

## 🛠️ Requirements

- **Operating System**: Kali Linux or any modern Debian-based distro
- **Dependencies**:
  - `curl`
  - `jq` (for JSON parsing if used)
  - `grep`, `awk`, `sed`
  - `bash` (v5.0+ recommended)
  - `whois` (optional for IP lookups)

Install dependencies (if needed):
```bash
sudo apt update && sudo apt install curl jq whois
