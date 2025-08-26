# Web Cache Manager Implementation Plan

## Overview

A token-efficient web content cache manager for Claude Code that uses HTTP validation to minimize redundant downloads and track token savings.

## Core Features

### 1. Smart Caching with HTTP Validation

- **Cache files**: Store content with SHA256 hash as filename
- **Metadata files**: Store HTTP headers (ETag, Last-Modified) as `.meta` files
- **Validation**: Use HEAD requests with If-None-Match/If-Modified-Since
- **304 Not Modified**: Keep cache, update timestamp only
- **200 OK**: Fetch new content only when actually changed

### 2. Token Efficiency

- **Quiet by default**: No output except content and minimal status to stderr
- **Direct output**: Return content directly (no separate Read operation needed)
- **Token tracking**: Show immediate savings (e.g., `CACHE:HIT:~525K_tokens_saved`)
- **Verbose mode**: Optional `-v` flag for detailed operations

### 3. Cache Operations

#### Core Commands

```bash
fetch <url> [ttl_days]     # Get content (cache-aware)
check <url>                 # Return HIT|MISS|EXPIRED
list                        # List cached URLs
clean [ttl_days]           # Remove expired entries
clear                      # Wipe entire cache
prune                      # Reduce to size limit
stats [--perf]             # Show token savings and performance
```

#### Output Format (stderr)

```bash
# Successful operations
CACHE:HIT:~45K_tokens_saved
CACHE:MISS:~45K_tokens_used
CACHE:VALIDATED:~0_tokens_used:~525K_tokens_saved

# Batch summary
CACHE:BATCH:3_hits:2_misses:~600K_tokens_saved:~50K_tokens_used
```

### 4. State Tracking

#### `.cache/webcontent/.stats.json`

```json
{
  "lifetime": {
    "tokens_saved": 15483200,
    "tokens_used": 854200,
    "cache_hits": 470,
    "cache_misses": 120,
    "bytes_saved": 61932800,
    "bytes_fetched": 3416800
  },
  "session": {
    "tokens_saved": 45000,
    "tokens_used": 2000,
    "started": "2025-08-11T10:00:00Z"
  },
  "performance": {
    "manifest_reads": 245,
    "manifest_writes": 89,
    "hash_computations": 156,
    "file_stat_calls": 489
  },
  "urls": {
    "https://docs.anthropic.com/...": {
      "hits": 12,
      "tokens_saved_total": 540000
    }
  }
}
```

### 5. Hook Integration

#### `.claude/settings.json`

```json
{
  "hooks": {
    "before_tool_use": "./hooks/cache-intercept.sh"
  },
  "environment": {
    "CLAUDE_CACHE_ENABLED": "true",
    "CACHE_DIR": ".cache/webcontent",
    "CACHE_TTL_DAYS": "7"
  }
}
```

#### `hooks/cache-intercept.sh`

- Intercept WebFetch calls
- Check cache before allowing fetch
- Return cached content if available
- Store results after successful fetch

### 6. Environment Control

```bash
# Enable/disable via environment
CLAUDE_CACHE_ENABLED=false claude

# Or via profiles
claude --profile cache-enabled
claude --profile cache-disabled
```

## Implementation Order

1. **Core cache functions**
   - URL to hash conversion
   - Basic fetch and store
   - TTL checking

2. **HTTP validation**
   - HEAD request validation
   - ETag/Last-Modified handling
   - 304 response processing

3. **Token tracking**
   - Token estimation (bytes/4)
   - Stats file management
   - Summary output formatting

4. **Management commands**
   - List, clean, clear, prune
   - Stats reporting
   - Performance metrics

5. **Hook integration**
   - Intercept script
   - Settings configuration
   - Environment variable support

## Directory Structure

```text
.cache/webcontent/
├── .stats.json                    # Token and performance tracking
├── .manifest.json                 # URL to hash mapping (optional)
├── {hash}                         # Cached content file
├── {hash}.meta                    # HTTP headers metadata
└── ...
```

## Efficiency Optimizations

### Order of Operations

1. Check local cache existence (fast)
2. Check TTL if configured (fast)
3. If "expired", validate with HEAD request (1KB)
4. If 304, keep cache and update timestamp
5. If 200 or miss, fetch full content

### Token Savings Example

- Document: 2.1MB (~525K tokens)
- Without validation: Expired = full re-download
- With validation: 304 = 0 bytes downloaded
- Savings: ~525K tokens per validation

## Future Enhancements (TODO)

### URL Blacklist Patterns

```bash
# TODO: Add configurable patterns for URLs to never cache
# Use case: Dynamic APIs, timestamp parameters
# Example: *api.github.com/repos/*/issues*, *timestamp=*
CACHE_BLACKLIST_PATTERNS=()
```

### Persistent TODOs

```bash
# TODO: Implement persistent TODO tracking across Claude sessions
# - Store in .claude/todos.json or session markers
# - Load during bootstrap from CLAUDE.md
# - Enable work continuity across session boundaries
```

## Integration with CLAUDE.md

### Add to CLAUDE.md

```markdown
## Web Content Caching Protocol

Before any WebFetch operation:
1. Check cache: `content=$(./web-cache-manager.sh fetch "$URL")`
2. Use cached content if available
3. Track savings in .cache/webcontent/.stats.json

Cache is automatically managed with HTTP validation to prevent unnecessary downloads.
```

### Bootstrap Instructions

```markdown
## Session Initialization
1. Check cache stats: `./web-cache-manager.sh stats`
2. Clean expired entries: `./web-cache-manager.sh clean`
3. Review token savings from previous sessions
```

## Success Metrics

- Token savings ratio > 10:1
- Cache hit rate > 60%
- Average operation time < 50ms
- 304 validation rate > 80% for "expired" content

## Testing Plan

1. Test basic fetch/cache/retrieve cycle
2. Verify HTTP validation with real URLs
3. Test token counting accuracy
4. Verify hook interception
5. Test environment variable toggling
6. Validate performance metrics collection
