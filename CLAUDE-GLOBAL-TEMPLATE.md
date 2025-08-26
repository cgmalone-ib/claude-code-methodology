# Claude Session Bootstrap Instructions - Global Template

## Core Expertise Declaration
<!-- Customize this section based on your primary domains -->
You are an expert at [CUSTOMIZE: list your primary technical domains - e.g., "devops, aws, bash, terraform, ci/cd, jenkins, k8s/eks, springboot, react"].

You do not jump the gun and make assertions unless they have been verified to be true.

I prefer discussing concepts before diving into implementation and only need generated artifacts/scripts when I ask for them.

## Knowledge Space Structure
<!-- Define your project organization structure -->

**Knowledge Space**: Restricted to specific directories within the current working directory:

- **[CUSTOMIZE]**: `[path]/` - [description of purpose]
- **[CUSTOMIZE]**: `[path]/` - [description of purpose]

Do not venture into other directories outside this knowledge space, unless otherwise instructed.

## Session Continuity Protocol

**Purpose**: Enable seamless work continuation when Claude sessions hit message limits.

### Session Marker Files

- **Location**: Knowledge space root directory (current working directory)
- **Format**: `.claude-session-{project}-{work-description}-{date}`
- **Examples**:
  - `.claude-session-[project]-[feature]-[YYYYMMDD]`
  - `.claude-session-[project]-bug[###]-[description]-[YYYYMMDD]`

### Bootstrap Program Loading Methodology

**Paradigm**: Load complete state first, then execute main() - not sequential script execution

**Token Efficiency**: Comprehensive loading prevents redundant operations and enables optimal decision-making
**Maintainability**: Declarative state with explicit dependencies, change-resistant architecture

#### Program Loading Phase

**Load ALL context before any execution decisions:**

1. **Session State Loading**

   ```bash
   # Load session markers
   glob .claude-session-*
   ```

2. **Knowledge State Loading**

   ```bash
   # Customize these paths based on your knowledge structure
   Read: [path-to-session-management-docs]
   Read: [path-to-project-knowledge-index]
   ```

3. **Context State Analysis**
   - Session marker analysis (interrupted work context)
   - Index-guided navigation to relevant documents as needed
   - Project status assessment from index
   - Process methodology state validation

#### Main() Execution Phase

**With complete loaded state, determine execution path:**

- **If session markers found**: Continue interrupted work using loaded context
- **If no markers**: Execute fresh session initialization
- **If multiple markers**: Prioritize most recent work context
- **All decisions**: Made with complete state visibility, index-guided document access
- **Finish reading the remaining sections in CLAUDE.md**
- **State that you understand all of the instructions**

### Session Management

- **Create marker** when starting significant work on specific issues
- **Maintain marker** throughout active work session
- **Clean up marker** when work completes or transitions to different focus
- **Use marker context** for session resumption and work continuity

## Compression Rules

### Infrastructure Output Compression

**Rule**: "Compress all output from all scripts. Preserve results, errors and error blocks."

**Massive Token Savings Proven**:

- Full deployment: 160,000+ tokens → 500 tokens (99.7+ reduction)
- Enables unlimited infrastructure iteration without token anxiety
- Preserves all critical information: results, errors, access credentials, timing

**What Gets Compressed**:

- State refresh noise (repetitive status lines)
- Repetitive CLI output
- Verbose progress indicators
- Standard operational logging

**What Gets Preserved**:

- Final results and success/failure status
- All error messages and warnings in full detail
- Critical access information (URLs, credentials, endpoints)
- Performance timing and metrics
- Decision-critical information

**Impact**: Transforms infrastructure management from token-prohibitive to token-trivial, enabling rapid development iteration.

### Knowledge Curation Compression

**Rule**: Apply compression during knowledge curation to enable comprehensive processing of all session artifacts.

**Massive Efficiency Gains Proven**:

- Traditional curation: 50,000+ tokens to process multiple documents
- Compression-enhanced: 5,000-8,000 tokens for complete knowledge base updates
- 85%+ reduction in curation process token consumption
- Enables comprehensive vs selective knowledge preservation

**Curation Process**:

- Extract key insights from verbose session artifacts
- Synthesize technical breakthroughs from lengthy troubleshooting logs
- Apply targeted updates to master documents efficiently
- Preserve critical technical details while compressing routine information

**What Gets Compressed During Curation**:

- Lengthy investigation timelines → breakthrough moments
- Repetitive troubleshooting steps → solution patterns
- Verbose session transcripts → essential insights and decisions
- Multiple failed attempts → working solution methodology

**What Gets Preserved**:

- Technical solution details and implementation steps
- Root cause analysis and validation results
- Performance metrics and success criteria
- Operational procedures and access information

**Impact**: Transforms knowledge curation from selective (token-limited) to comprehensive (token-efficient), ensuring no breakthrough discoveries are lost.

## Web Content Caching Protocol

**Rule**: "Cache all web content downloads locally to avoid redundant requests and token waste."

**Cache Location**:

- Store in project `.cache/webcontent/` directory
- Filename: SHA256 hash of URL
- Content: Raw downloaded content

**Problem Solved**:

- Redundant web content calls to same URL within sessions
- Large document downloads processed multiple times
- Token waste from reprocessing identical content
- Bandwidth and latency waste from repeated downloads

**Caching Strategy**:

- **File-based cache**: Simple local file storage
- **URL-to-file mapping**: Hash URL to generate cache filename
- **No automatic expiration**: Manual cleanup as part of maintenance
- **Session persistent**: Cache survives across Claude sessions

**Implementation**:

1. **Check cache first**: Before web download, check if local cache file exists
2. **Use cached content**: If cache hit, process cached content instead of new download
3. **Cache on miss**: If cache miss, download and save to cache file
4. **Multiple queries**: Single download supports multiple different queries

**Manual Cleanup**:

- Part of periodic maintenance workflow
- Remove stale or oversized cache files
- No automatic TTL - user controls cleanup timing

**Benefits**:

- **Token efficiency**: Process large docs once, query multiple times
- **Bandwidth savings**: Eliminate redundant large downloads
- **Session continuity**: Cached content available across sessions
- **Resource optimization**: Better utilization of downloads

**Example Workflow**:

```bash
# Cache miss - download and cache
Web request: https://docs.example.com/... → downloads content, saves to cache
Query 1: "Find command documentation" → processes from cache
Query 2: "Find configuration differences" → processes from cache (no redownload)
```

## Project-Specific Customizations
<!-- Add your project-specific instructions here -->

### Custom Expertise Areas
<!-- List any specialized domains beyond the core expertise -->

### Project-Specific Protocols
<!-- Add any custom workflows or methodologies -->

### Tool and Framework Preferences
<!-- Document preferred tools, libraries, testing frameworks, etc. -->

### Development Standards
<!-- Code style, documentation requirements, testing standards, etc. -->

## Usage Instructions

1. **Initial Setup**: Customize the bracketed sections with your specific:
   - Technical expertise domains
   - Knowledge space directory structure
   - Project-specific protocols and preferences

2. **Session Management**: Use the session marker system for complex multi-session work

3. **Compression**: Leverage compression rules for token-efficient operations

4. **Caching**: Implement web content caching for repeated documentation access

5. **Knowledge Base**: Maintain index documents for efficient context loading

---

**Template Version**: 1.0
**Based on**: Proven methodologies for session continuity and token optimization
