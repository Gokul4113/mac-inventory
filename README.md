# mac-inventory

> Collect a complete macOS software inventory into a single JSON file — one command, zero config.

## Installation

### Via Homebrew (recommended)

```bash
brew tap Gokul4113/mac-inventory
brew install mac-inventory
```

### Manual

```bash
git clone https://github.com/Gokul4113/mac-inventory.git
cd mac-inventory
brew install osquery jq
chmod +x bin/mac-inventory
./bin/mac-inventory
```

## Usage

```bash
mac-inventory [OPTIONS]
```

### Options

| Flag | Description |
| :--- | :--- |
| `-o, --output DIR` | Specify output directory (default: `./osq_out`) |
| `-f, --format FMT` | Output format: `json` (default), `csv`, or `all` |
| `-s, --scan`       | **New:** Run vulnerability scan against NVD (Internet required) |
| `--scan-json`      | Run scan AND export detailed JSON report |
| `-v, --version`    | Show version |
| `-h, --help`       | Show help message |

### Examples

**1. Standard Inventory (JSON):**
```bash
mac-inventory
# Output: ./osq_out/final_inventory.json
```

**2. Inventory + CSV Export:**
```bash
mac-inventory -f all
# Output: ./osq_out/csv/*.csv
```

**3. Vulnerability Scan (Security Audit):**
```bash
mac-inventory --scan
# Output: ./osq_out/security_audit.csv
```

> **Note:** The scan takes a few minutes as it respects the NVD API rate limits. It filters out system apps to focus on user-installed software. All data processing happens locally; only software names/versions are sent to the NVD API.

## What It Collects

- GUI Applications (name, version, path)
- Homebrew Packages
- macOS PKG Receipts
- Startup Items
- Kernel Extensions
- Safari Extensions
- OS Version & Architecture
- Running Processes
- Launch Daemons & Agents

Everything is exported into one `final_inventory.json` file with device metadata (hostname, serial, OS version, architecture).

## Notes

- Safari Extensions may require **Full Disk Access** in System Settings → Privacy & Security.
- The tool is **read-only** — it does not modify anything on your system.

## License

MIT — see [LICENSE](LICENSE)
