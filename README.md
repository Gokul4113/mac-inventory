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
mac-inventory                        # output → ./osq_out/final_inventory.json
mac-inventory -o ~/Desktop/audit     # custom output directory
mac-inventory --version              # print version
mac-inventory --help                 # show help
mac-inventory -f csv                 # get CSV files instead
mac-inventory -f all                 # get both JSON + CSV
```

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
