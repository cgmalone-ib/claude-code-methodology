# Claude Code Methodology

A proven methodology for optimizing Claude Code sessions with 99.7% token reduction, session continuity, and intelligent caching.

## Quick Start

1. **Copy the template** to your project root as `CLAUDE.md`
2. **Customize** the marked sections for your domain
3. **Start Claude Code** - it will auto-load your configuration

```bash
# Get started in 30 seconds
cp templates/default/CLAUDE.md ./CLAUDE.md
# Edit CLAUDE.md to customize your expertise areas
claude
```

## Key Features

### 🚀 99.7% Token Reduction

Transform verbose infrastructure output from 160,000+ tokens to under 500 tokens while preserving all critical information.

### 🔄 Session Continuity

Seamlessly resume work across Claude sessions using intelligent marker files and state management.

### 💾 Web Content Caching

Eliminate redundant downloads with smart HTTP validation, saving thousands of tokens per session.

### 👤 Profile System

Switch between development, production, and research modes with profile-specific optimizations.

## What's Included

- **CLAUDE-GLOBAL-TEMPLATE.md** - The core template ready for customization
- **templates/** - Pre-configured templates for common use cases
- **profiles/** - Profile configurations for different work modes
- **patterns/** - Reusable methodology patterns with examples
- **tools/** - Helper scripts for caching, metrics, and automation
- **examples/** - Real-world implementations with metrics

## Token Savings Examples

| Operation | Without Methodology | With Methodology | Savings |
|-----------|-------------------|------------------|---------|
| Terraform Deploy | 160,000 tokens | 500 tokens | 99.7% |
| Knowledge Curation | 50,000 tokens | 5,000 tokens | 90% |
| Web Documentation | 2,100 tokens/fetch | 0 tokens (cached) | 100% |
| Session Bootstrap | 10,000 tokens | 1,000 tokens | 90% |

## Installation

### Option 1: Simple Copy

```bash
# Copy the template to your project
curl -O https://raw.githubusercontent.com/[org]/claude-code-methodology/main/CLAUDE-GLOBAL-TEMPLATE.md
mv CLAUDE-GLOBAL-TEMPLATE.md CLAUDE.md
# Customize for your project
```

### Option 2: Full Installation

```bash
# Clone the entire methodology
git clone https://github.com/[org]/claude-code-methodology.git ~/.claude-methodology

# Link tools to your path
ln -s ~/.claude-methodology/tools/web-cache-manager.sh /usr/local/bin/claude-cache
ln -s ~/.claude-methodology/tools/session-bootstrap.sh /usr/local/bin/claude-bootstrap
```

### Option 3: Profile-Based Setup

```bash
# Install with profile support
curl -sSL https://raw.githubusercontent.com/[org]/claude-code-methodology/main/install.sh | bash

# Start with a profile
claude --profile development
```

## Core Concepts

### Bootstrap Methodology

Load complete state before execution - treat session initialization like a program bootstrap, not sequential scripting.

### Compression Rules

Aggressively compress verbose output while preserving decision-critical information:

- Infrastructure logs: Compress progress, preserve errors
- Documentation: Extract patterns, compress narratives
- Session artifacts: Synthesize insights, compress timelines

### Session Markers

Maintain work continuity with intelligent session markers:

```bash
.claude-session-myproject-feature-20250825
.claude-session-myproject-bugfix-20250825
```

### Web Caching Protocol

Cache all web content with HTTP validation:

```bash
# Automatic caching with validation
URL → SHA256 hash → Check cache → Validate with HEAD → Use cache or fetch
```

## Templates

### Available Templates

- **default/** - Basic template for general use
- **infrastructure/** - AWS, Terraform, Kubernetes focused
- **web-development/** - React, Node.js, full-stack
- **data-science/** - Python, ML, data pipelines
- **enterprise/** - Compliance, audit trails, strict protocols

### Using Templates

```bash
# Use infrastructure template
cp templates/infrastructure/CLAUDE.md ./CLAUDE.md

# Or web development template
cp templates/web-development/CLAUDE.md ./CLAUDE.md
```

## Profiles

Switch between different work modes:

```bash
# Development mode - verbose, debugging enabled
claude --profile development

# Production mode - strict protocols, minimal output
claude --profile production

# Research mode - flexible, exploration enabled
claude --profile research
```

## Tools

### Web Cache Manager

```bash
# Fetch with caching
./tools/web-cache-manager.sh fetch https://docs.example.com/guide.html

# Check cache status
./tools/web-cache-manager.sh stats
# Output: 15.4M tokens saved, 470 cache hits, 60% hit rate
```

### Session Bootstrap

```bash
# Auto-load CLAUDE.md and check session markers
./tools/session-bootstrap.sh
```

### Metrics Reporter

```bash
# View token usage and savings
./tools/metrics-reporter.sh --summary
# Output: Session: 45K saved, Lifetime: 15.4M saved
```

## Examples

See the `examples/` directory for real-world implementations:

- AWS infrastructure deployment with 99.7% compression
- React application with automated session management
- Data pipeline with intelligent caching

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Areas for Contribution

- New templates for different domains
- Pattern extraction from your use cases
- Tool improvements and integrations
- Documentation and examples

## Metrics & Success Stories

- **99.7% token reduction** on infrastructure deployments
- **>95% session continuity** success rate
- **10:1 token savings ratio** average across all operations
- **<5 minutes** to productivity for new sessions

## Version History

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

- **v1.0.0** - Production ready with core features
- **v0.4.0** - Web caching protocol
- **v0.3.0** - Compression rules
- **v0.2.0** - Session management
- **v0.1.0** - Initial release

## License

MIT License - See [LICENSE](LICENSE) for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/[org]/claude-code-methodology/issues)
- **Discussions**: [GitHub Discussions](https://github.com/[org]/claude-code-methodology/discussions)
- **Examples**: See `examples/` directory

---

**Start saving tokens today!** Copy the template, customize for your project, and experience 99.7% token reduction.
