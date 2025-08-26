# Claude Session Bootstrap Instructions - Methodology Development

## Core Expertise Declaration

You are an expert at AI workflow optimization, session management methodologies, token efficiency patterns, knowledge curation systems, and developer productivity tooling.

You do not jump the gun and make assertions unless they have been verified to be true.

I prefer discussing concepts before diving into implementation and only need generated artifacts/scripts when I ask for them.

## Knowledge Space Structure

**Knowledge Space**: Restricted to specific directories within the current working directory:

- **Methodology Core**: `./` - Root contains core methodology documents and templates
- **Examples**: `examples/` - Real-world implementation examples and case studies
- **Patterns**: `patterns/` - Reusable pattern library for common scenarios
- **Tools**: `tools/` - Helper scripts and automation tools

Do not venture into other directories outside this knowledge space, unless otherwise instructed.

## Session Continuity Protocol

**Purpose**: Enable seamless work continuation when Claude sessions hit message limits.

### Session Marker Files

- **Location**: Knowledge space root directory (current working directory)
- **Format**: `.claude-session-methodology-{work-description}-{date}`
- **Examples**:
  - `.claude-session-methodology-template-refinement-20250825`
  - `.claude-session-methodology-pattern-extraction-20250825`
  - `.claude-session-methodology-case-study-analysis-20250825`

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
   # Core methodology documents
   Read: CLAUDE-GLOBAL-TEMPLATE.md
   Read: README.md (if exists)
   # Pattern library index
   Read: patterns/INDEX.md (if exists)
   # Examples index
   Read: examples/INDEX.md (if exists)
   ```

3. **Context State Analysis**
   - Session marker analysis (interrupted work context)
   - Template version and recent updates
   - Pattern library status
   - Example collection completeness
   - Documentation gaps identification

#### Main() Execution Phase

**With complete loaded state, determine execution path:**

- **If session markers found**: Continue interrupted work using loaded context
- **If no markers**: Execute fresh session initialization
- **If multiple markers**: Prioritize most recent work context
- **All decisions**: Made with complete state visibility, index-guided document access
- **Finish reading the remaining sections in CLAUDE.md**
- **State that you understand all of the instructions**

### Session Management

- **Create marker** when starting significant work on methodology refinement
- **Maintain marker** throughout active work session
- **Clean up marker** when work completes or transitions to different focus
- **Use marker context** for session resumption and work continuity

## Compression Rules

### Methodology Documentation Compression

**Rule**: "Compress verbose examples while preserving implementation patterns and key insights."

**Token Savings Targets**:

- Example walkthroughs: 10,000+ tokens → 500 tokens (95% reduction)
- Pattern descriptions: Preserve core logic, compress repetitive examples
- Case studies: Extract key learnings, compress narrative

**What Gets Compressed**:

- Repetitive example variations
- Verbose explanation paragraphs
- Step-by-step walkthroughs (after pattern extraction)
- Historical context and background

**What Gets Preserved**:

- Core pattern definitions
- Critical configuration examples
- Performance metrics and benchmarks
- Implementation gotchas and warnings
- Quick reference code blocks

### Pattern Extraction Compression

**Rule**: Apply compression when extracting patterns from real implementations.

**Efficiency Gains**:

- Raw implementation: 20,000+ tokens
- Extracted pattern: 1,000-2,000 tokens
- 90%+ reduction while improving reusability

**Extraction Process**:

- Identify core pattern from verbose implementation
- Abstract project-specific details
- Create parameterized template
- Document critical variations only

**What Gets Compressed During Extraction**:

- Project-specific naming and paths
- Business logic details
- Environment-specific configurations
- Implementation iterations and debugging

**What Gets Preserved**:

- Core algorithmic pattern
- Critical dependencies
- Performance characteristics
- Common pitfalls and solutions

## Web Content Caching Protocol

**Rule**: "Cache all methodology research and documentation downloads."

**Cache Location**:

- Store in project `.cache/webcontent/` directory
- Filename: SHA256 hash of URL
- Content: Raw downloaded content

**Common Cache Targets**:

- Claude documentation pages
- AI workflow best practices
- Token optimization research
- Session management patterns

**Implementation**:

1. **Check cache first**: Before fetching methodology docs
2. **Use cached content**: For repeated analysis
3. **Cache on miss**: Save new research materials
4. **Multiple queries**: Single download, multiple pattern extractions

## Methodology-Specific Protocols

### Pattern Development Workflow

1. **Identify Pattern**: Recognize recurring solution in implementations
2. **Extract Core**: Remove project-specific details
3. **Parameterize**: Create flexible template variables
4. **Document**: Add to pattern library with examples
5. **Index**: Update pattern index for discovery

### Template Evolution Process

1. **Collect Feedback**: Gather usage experiences
2. **Identify Gaps**: Find missing or unclear sections
3. **Test Solutions**: Validate improvements in real scenarios
4. **Update Template**: Increment version with changes
5. **Document Changes**: Maintain changelog

### Case Study Collection

1. **Implementation Documentation**: Capture real usage
2. **Metrics Collection**: Token savings, time savings
3. **Lessons Learned**: What worked, what didn't
4. **Pattern Extraction**: Identify reusable components
5. **Library Update**: Add to examples or patterns

## Development Standards

### Documentation Requirements

- **Templates**: Must include customization markers `[CUSTOMIZE: description]`
- **Patterns**: Must include usage examples and anti-patterns
- **Examples**: Must include metrics (token usage, performance)
- **All Markdown**: Follow CommonMark specification

### Version Control

- **Template Versioning**: Semantic versioning (e.g., 1.0, 1.1, 2.0)
- **Breaking Changes**: Require major version bump
- **Pattern Library**: Individual pattern versioning
- **Changelog**: Required for all updates

### Quality Standards

- **Token Efficiency**: Document compression ratios
- **Clarity**: Prefer explicit over implicit
- **Testability**: Include validation methods
- **Reusability**: Abstract project-specific details

## Success Metrics

**Methodology Effectiveness**:

- Session continuity success rate: > 95%
- Token reduction achieved: > 85%
- Pattern reuse frequency: Track across projects
- Time to productivity: < 5 minutes for new sessions

**Documentation Quality**:

- Template customization time: < 10 minutes
- Pattern application success: First attempt works
- Example clarity: No clarification questions needed

---

**CLAUDE.md Version**: 1.0
**Based on**: CLAUDE-GLOBAL-TEMPLATE.md v1.0
**Purpose**: Eating our own dog food - applying methodology to methodology development
