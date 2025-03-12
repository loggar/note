# GIT branch names

## Types

Here's a comprehensive list of branch name prefixes following best practices:

### Core Types

- `feature/` - New functionality or enhancements
- `bugfix/` or `fix/` - Bug corrections
- `hotfix/` - Critical fixes needing immediate deployment to production
- `release/` - Release preparation branches
- `chore/` - Maintenance tasks not affecting production code
- `docs/` - Documentation-only changes

### Additional Types

- `refactor/` - Code changes that neither fix bugs nor add features
- `test/` - Adding or modifying tests
- `style/` - Code style/formatting changes without logic changes
- `perf/` - Performance improvements
- `config/` - Configuration changes
- `build/` - Changes to build system or dependencies
- `ci/` or `infra/` - CI/CD pipeline or infrastructure changes
- `tooling/` - Development tooling changes
- `wip/` - Work in progress
- `experiment/` or `poc/` - Experimental features or proof of concepts
- `backend/` - Backend-specific changes
- `frontend/` - Frontend-specific changes
- `db/` - Database-related changes
- `security/` - Security-related changes
- `i18n/` or `l10n/` - Internationalization/localization changes

### Tips for Usage

- Keep consistent naming across the team
- Follow the prefix with a descriptive but concise name
- Use hyphens instead of spaces (e.g., `feature/add-user-authentication`)
- Include ticket numbers when applicable (e.g., `bugfix/JIRA-123-fix-login-issue`)
- Keep branch names under 50 characters when possible
