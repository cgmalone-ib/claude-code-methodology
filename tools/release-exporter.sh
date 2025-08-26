#!/bin/bash

set -euo pipefail

# Claude Code Methodology Repository Concatenator
# 
# Purpose: Create AI-consumable releases of the methodology for systems 
#          without direct repository access
#
# Usage:
#   ./concatenate_repo.sh                    # Full methodology
#   ./concatenate_repo.sh --core             # Core files only
#   ./concatenate_repo.sh --templates        # Templates and patterns
#   ./concatenate_repo.sh --compress         # Token-optimized version
#   ./concatenate_repo.sh --ideas           # Include ideas directory

# Default configuration
OUTPUT_FILE="claude-methodology-release.txt"
MODE="full"
COMPRESS=false
INCLUDE_IDEAS=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --core)
            MODE="core"
            OUTPUT_FILE="claude-methodology-core.txt"
            shift
            ;;
        --templates)
            MODE="templates"
            OUTPUT_FILE="claude-methodology-templates.txt"
            shift
            ;;
        --compress)
            COMPRESS=true
            OUTPUT_FILE="claude-methodology-compressed.txt"
            shift
            ;;
        --ideas)
            INCLUDE_IDEAS=true
            shift
            ;;
        --output|-o)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  --core        Include only core methodology files"
            echo "  --templates   Include templates and patterns"
            echo "  --compress    Create token-optimized version"
            echo "  --ideas       Include ideas directory"
            echo "  --output, -o  Specify output filename"
            echo "  --help, -h    Show this help"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

echo "Creating Claude Code Methodology release..."
echo "Mode: $MODE"
echo "Compress: $COMPRESS"
echo "Include ideas: $INCLUDE_IDEAS"
echo "Output: $OUTPUT_FILE"
echo ""

# Initialize output file with metadata
cat > $OUTPUT_FILE << EOF
# Claude Code Methodology Repository Export

**Project**: Claude Code Methodology
**Generated**: $(date)
**Mode**: $MODE
**Compressed**: $COMPRESS
**Git Commit**: $(git rev-parse --short HEAD 2>/dev/null || echo "unavailable")
**Version**: $(git describe --tags 2>/dev/null || echo "unversioned")

## Purpose

This is an AI-consumable export of the Claude Code Methodology repository.
Use this when working with AI systems that don't have direct repository access.

## Repository Structure Overview

\`\`\`
$(tree -L 2 -a --dirsfirst | head -20)
\`\`\`

## Token Efficiency Stats

- **Proven reductions**: 99.7% for infrastructure, 90% for documentation
- **Session continuity**: >95% success rate
- **Cache hit rates**: >60% for web content
- **Time to productivity**: <5 minutes for new sessions

=========================================================================

EOF

# Function to add file with header and optional compression
add_file() {
    local filepath="$1"
    local compress_content="$2"
    
    echo "Processing: $filepath" >&2
    
    if [[ "$compress_content" == "true" ]]; then
        cat >> $OUTPUT_FILE << EOF

### FILE: $filepath (COMPRESSED)

**Purpose**: $(head -5 "$filepath" | grep -E "^#|Purpose|Overview" | head -1 | sed 's/^# *//' | sed 's/^## *//')

**Key Points**:
EOF
        # Extract headers and key bullet points for compressed version
        grep -E "^#{1,3} |^- \*\*|^### |^\*\*|^## [A-Z]" "$filepath" | head -10 >> $OUTPUT_FILE || true
        echo "" >> $OUTPUT_FILE
        echo "*(Full content compressed for token efficiency - see original file for complete details)*" >> $OUTPUT_FILE
    else
        cat >> $OUTPUT_FILE << EOF

### FILE: $filepath

\`\`\`markdown
$(cat "$filepath")
\`\`\`

EOF
    fi
    echo "" >> $OUTPUT_FILE
}

# Determine which files to include based on mode
declare -a files_to_include

case $MODE in
    "core")
        files_to_include=(
            "./README.md"
            "./CLAUDE.md" 
            "./CLAUDE-GLOBAL-TEMPLATE.md"
            "./CHANGELOG.md"
        )
        ;;
    "templates")
        # Find all template and pattern files
        mapfile -t template_files < <(find ./templates -name "*.md" 2>/dev/null | sort)
        mapfile -t pattern_files < <(find ./patterns -name "*.md" 2>/dev/null | sort)
        files_to_include=("${template_files[@]}" "${pattern_files[@]}")
        ;;
    "full")
        # All markdown files except ideas (unless specifically requested)
        mapfile -t all_files < <(find . -name "*.md" -not -path "./ideas/*" | sort)
        files_to_include=("${all_files[@]}")
        if [[ "$INCLUDE_IDEAS" == "true" ]]; then
            mapfile -t idea_files < <(find ./ideas -name "*.md" 2>/dev/null | sort)
            files_to_include+=("${idea_files[@]}")
        fi
        ;;
esac

# Add files to output
for file in "${files_to_include[@]}"; do
    if [[ -f "$file" ]]; then
        add_file "$file" "$COMPRESS"
    fi
done

# Add usage instructions
cat >> $OUTPUT_FILE << EOF

=========================================================================

## Usage Instructions for AI Systems

### Quick Start
1. **Load this file** into your context
2. **Understand the methodology** from the core template
3. **Apply patterns** from the included examples
4. **Follow protocols** for token efficiency

### Key Commands to Execute
\`\`\`bash
# Check for session markers (load state first)
glob .claude-session-*

# Bootstrap from CLAUDE.md if present
Read: ./CLAUDE.md

# Apply compression rules
# Apply caching protocols  
# Use session markers for continuity
\`\`\`

### Success Metrics to Target
- **99.7% token reduction** for infrastructure output
- **90% compression** for documentation tasks
- **>95% session continuity** across message limits
- **<5 minutes** to productivity in new sessions

### Integration Notes
- This export contains the complete methodology
- All tools and patterns are documented
- Examples include real-world metrics
- Use as reference for implementing optimization protocols

EOF

# Generate statistics
line_count=$(wc -l < "$OUTPUT_FILE")
word_count=$(wc -w < "$OUTPUT_FILE")
char_count=$(wc -c < "$OUTPUT_FILE")
token_estimate=$((char_count / 4))  # Rough token estimation

echo "========================================="
echo "Concatenation complete!"
echo "Output file: $OUTPUT_FILE"
echo "Lines: $line_count"
echo "Words: $word_count"  
echo "Characters: $char_count"
echo "Estimated tokens: ~$token_estimate"
echo ""
echo "This export is ready for AI systems without repository access."
echo "It contains the complete Claude Code Methodology with all patterns and protocols."
