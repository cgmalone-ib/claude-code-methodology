# Claude Code Methodology Tools

Helper scripts and utilities to support the methodology in practice.

## Available Tools

### `release-exporter.sh` - Repository Release Generator

Creates AI-consumable exports of the methodology for systems without direct repository access.

**Purpose**: Convert the repository into different formats optimized for AI consumption and token efficiency.

**Usage**:

```bash
# Full methodology export
./tools/release-exporter.sh

# Core files only (fast loading)
./tools/release-exporter.sh --core

# Templates and patterns (implementation focused)
./tools/release-exporter.sh --templates

# Token-compressed version (80-90% smaller)
./tools/release-exporter.sh --compress

# Include ideas directory
./tools/release-exporter.sh --ideas

# Custom output file
./tools/release-exporter.sh --core -o my-export.txt
```

**Output Examples**:

- `claude-methodology-release.txt` - Full methodology (~50K tokens)
- `claude-methodology-core.txt` - Essential files only (~5K tokens)
- `claude-methodology-compressed.txt` - Token-optimized (~8K tokens)

**Features**:

- Includes repository metadata (git commit, version, structure)
- Provides AI-specific usage instructions
- Shows token estimates upfront
- Multiple compression levels
- Selective file inclusion

### `web-cache-manager.sh` (Planned)

Smart web content caching with HTTP validation to minimize redundant downloads.

**Features** (from implementation plan):

- SHA256-based file caching
- HTTP ETag/Last-Modified validation
- Token savings tracking
- Batch operations
- TTL management

### `session-bootstrap.sh` (Planned)

Auto-loads CLAUDE.md and checks for session markers.

**Features**:

- Automatic CLAUDE.md loading
- Session marker detection
- Profile support
- Validation checkpoints

### `metrics-reporter.sh` (Planned)

Token usage analytics and methodology effectiveness tracking.

**Features**:

- Session vs lifetime statistics
- Compression ratio analysis
- Cache hit rate reporting
- Profile performance comparison

## Installation

### Individual Tools

```bash
# Make executable and add to PATH
chmod +x tools/release-exporter.sh
ln -s $(pwd)/tools/release-exporter.sh /usr/local/bin/claude-export
```

### Full Installation

```bash
# Link all tools
for tool in tools/*.sh; do
    tool_name=$(basename "$tool" .sh)
    ln -s "$(pwd)/$tool" "/usr/local/bin/claude-$tool_name"
done
```

## Tool Development Guidelines

### Naming Convention

- Use kebab-case for filenames: `web-cache-manager.sh`
- Link to PATH with claude- prefix: `claude-web-cache-manager`

### Token Efficiency Standards

- **Quiet by default**: Minimal output except results
- **Verbose option**: `-v` flag for detailed operation info
- **Status to stderr**: Keep stdout clean for piping
- **Token reporting**: Show savings when applicable

### Common Patterns

```bash
# Standard help
--help|-h    # Usage information

# Output control
--verbose|-v # Detailed operation info
--quiet|-q   # Suppress all non-essential output

# Token optimization
--compress   # Apply compression rules
--stats      # Show token/performance metrics
```

### Integration Points

- Hook support for automatic operation
- Environment variable configuration
- Profile system integration
- Session marker awareness

## Contributing Tools

### Requirements

- Follow token efficiency principles
- Include help text (`--help`)
- Provide usage examples in comments
- Include token impact metrics where applicable
- Test with different profile modes

### Template Structure

```bash
#!/bin/bash
# Tool purpose and description
# Usage: ./tool.sh [options]

set -euo pipefail

# Configuration defaults
VERBOSE=false
OUTPUT_FILE=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --verbose|-v) VERBOSE=true; shift ;;
        --help|-h) show_help; exit 0 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# Implementation with token awareness
```

## Future Tools

Based on enhancement plans and usage patterns:

- **profile-manager.sh** - Profile switching and management
- **pattern-extractor.sh** - Extract reusable patterns from implementations
- **template-generator.sh** - Create custom CLAUDE.md templates
- **audit-reporter.sh** - Protocol compliance checking
- **token-optimizer.sh** - Analyze and optimize token usage

---

**Philosophy**: Tools should embody the methodology - token-efficient, compression-aware, and optimized for AI workflows.
