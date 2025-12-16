# Contributing to Pharma Logistics BI

Thank you for your interest in contributing! We welcome improvements, bug fixes, and suggestions.

## Code of Conduct

Be respectful, inclusive, and constructive in all interactions.

## How to Contribute

### Reporting Issues

1. Check if the issue already exists
2. Provide detailed description of the problem
3. Include steps to reproduce
4. Attach screenshots if applicable
5. Specify your Power BI version and OS

**Issue Template:**
```
**Environment:**
- Power BI Version: [e.g., 2.131.xxx]
- OS: [Windows/Mac/Linux]
- Database: [SQL Server version]

**Description:**
[Clear description of the issue]

**Steps to Reproduce:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Expected Behavior:**
[What should happen]

**Actual Behavior:**
[What actually happens]

**Screenshots:**
[If applicable]
```

### Suggesting Enhancements

1. Use clear, descriptive title
2. Provide detailed use case
3. Explain expected benefits
4. Link to related issues if any

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit with clear messages (`git commit -m 'Add amazing feature'`)
5. Push to your branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

**PR Guidelines:**
- Clear title and description
- Reference related issues
- Include test results/validation
- Update documentation if needed
- Keep commits atomic and clean

## Development Standards

### DAX Measures
- Use clear, descriptive names (e.g., `Revenue_MTD` vs `Rev`)
- Add description/comments for complex formulas
- Test across all date periods (MTD, YTD, PM, PY)
- Verify regional filtering works correctly

### Power BI Visuals
- Use consistent color palette (#0074D9, #FF4136, #FFB347)
- Apply consistent formatting
- Add meaningful titles and data labels
- Test with various data volumes

### Documentation
- Update README for user-facing changes
- Update CHANGELOG with version info
- Add examples for new features
- Keep docs in sync with code

## Review Process

1. Automated checks run
2. Code review by maintainers
3. Approval from at least 2 reviewers
4. Merge to main branch

## Questions?

Open an issue or contact the maintainers directly.

---

**Thank you for contributing!** 🙏
