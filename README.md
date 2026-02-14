# mac-inventory

> Collect a complete macOS software inventory into a single JSON file.

Uses [osquery](https://osquery.io/) under the hood to gather installed apps, Homebrew packages, PKG receipts, startup items, kernel extensions, Safari extensions, running processes, and launchd entries — all in one command.

## Installation

### Via Homebrew (recommended)

```bash
brew tap Gokul4113/mac-inventory
brew install mac-inventory
```

This automatically installs the required dependencies (`osquery` and `jq`).

### Manual

```bash
git clone https://github.com/Gokul4113/mac-inventory.git
cd mac-inventory
chmod +x bin/mac-inventory
# Make sure osquery and jq are installed
brew install osquery jq
# Run directly
./bin/mac-inventory
```

## Usage

```bash
# Default: output goes to ./osq_out/final_inventory.json
mac-inventory

# Specify a custom output directory
mac-inventory -o ~/Desktop/audit

# Print version
mac-inventory --version

# Show help
mac-inventory --help
```

## What It Collects

| Category           | osquery Table        | Details                          |
|--------------------|----------------------|----------------------------------|
| GUI Applications   | `apps`               | Name, version, build, path       |
| PKG Receipts       | `package_receipts`   | Package ID, version, install time|
| Homebrew Packages  | `homebrew_packages`  | Name, version, path              |
| Startup Items      | `startup_items`      | Name, type, status               |
| Kernel Extensions  | `kernel_extensions`  | Name, version, path              |
| Safari Extensions  | `safari_extensions`  | Name, identifier, version        |
| OS Version         | `os_version`         | Name, version, build, arch       |
| Running Processes  | `processes`          | Name, PID, path, cmdline         |
| Launch Daemons     | `launchd`            | Name, path, run_at_load          |

## Output Format

The tool produces a single `final_inventory.json`:

```json
{
  "metadata": {
    "collected_at": "2026-02-14T12:00:00Z",
    "device": {
      "hostname": "MyMacBook",
      "serial_number": "C02...",
      "os": "macOS",
      "os_version": "15.3",
      "os_build": "24D60",
      "arch": "arm64"
    },
    "generator": {
      "tool": "mac-inventory",
      "tool_version": "1.0.0",
      "engine": "osqueryi",
      "format": "mac-inventory-pack-v1"
    }
  },
  "data": {
    "os_version": [...],
    "apps": [...],
    "package_receipts": [...],
    "homebrew_packages": [...],
    "startup_items": [...],
    "kernel_extensions": [...],
    "safari_extensions": [...],
    "processes": [...],
    "launchd": [...]
  }
}
```

## Requirements

- **macOS** (tested on Sonoma / Sequoia)
- **osquery** — `brew install osquery`
- **jq** — `brew install jq`

Both are installed automatically when using `brew install mac-inventory`.

## Notes

- **Safari Extensions** may require **Full Disk Access** to be granted to your terminal in **System Settings → Privacy & Security → Full Disk Access**.
- The tool is read-only — it only queries system information and writes JSON files. It does not modify anything on your system.

## Publishing Your Own Homebrew Tap

1. **Create the main repo** on GitHub: `mac-inventory`
   - Push this project to it

2. **Create a tag & release**:
   ```bash
   git tag -a v1.0.0 -m "Initial release"
   git push origin v1.0.0
   ```

3. **Get the SHA256** of the release tarball:
   ```bash
   curl -sL https://github.com/Gokul4113/mac-inventory/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
   ```

4. **Create the tap repo** on GitHub: `homebrew-mac-inventory`
   - Copy `Formula/mac-inventory.rb` into it
   - Update the `url` and `sha256` in the formula

5. **Users can now install**:
   ```bash
   brew tap Gokul4113/mac-inventory
   brew install mac-inventory
   ```

## License

MIT — see [LICENSE](LICENSE)
