# Skill 发现来源

找新 skill 时优先查这些地方。

## 社区目录

| 来源 | 说明 | 地址 |
|------|------|------|
| skills.sh | Agent Skills 生态排行榜，社区发现入口，按安装数排序 | https://skills.sh |
| awesome-claude-skills (ComposioHQ) | 1000+ Skills 社区目录，59K stars | https://github.com/ComposioHQ/awesome-claude-skills |
| awesome-claude-skills (BehiSecc) | 另一个社区目录 | https://github.com/BehiSecc/awesome-claude-skills |
| claude-code-infrastructure-showcase | Claude Code 基础设施案例 | https://github.com/diet103/claude-code-infrastructure-showcase |
| best-skills (xstongxue) | 精选通用 Skill（论文、PPT、图表、开发流、公众号等），1.3K stars | https://github.com/xstongxue/best-skills |

## 高质量垂直系列（本仓库已使用）

按主题分片的系列，质量稳定，按需补充同系列其他 skill。

| 系列 | 覆盖范围 | 已用 |
|------|----------|------|
| `anthropics/skills` | Office 三件套、frontend-design、skill-creator、webapp-testing | docx, xlsx, pptx, frontend-design, skill-creator, webapp-testing, web-artifacts-builder |
| `samber/cc-skills-golang` | Go 全栈（错误处理、并发、测试、性能、风格、gRPC、设计模式、文档、lint、命名、安全、context、struct/interface、项目布局、可观测性、数据库） | 全部 16 个 |
| `vuejs-ai/skills` | Vue 全套（最佳实践、调试、Pinia、Router、测试、composable） | 全部 6 个 |
| `jimliu/baoyu-skills` | 宝玉文档美化系列（Markdown 转 HTML、图表、URL 转 MD、格式化、翻译） | url-to-markdown, format-markdown, translate, markdown-to-html, diagram |
| `obra/superpowers` | 工作流方法论（brainstorming、plans、debugging、code-review） | brainstorming, writing-plans, executing-plans, systematic-debugging, finishing-a-development-branch |
| `mattpocock/skills` | TypeScript 老兵的方法论 | tdd, prototype, improve-codebase-architecture |
| `vercel-labs/agent-skills` | UI/UX 审查、React 最佳实践 | web-design-guidelines |
| `wshobson/agents` | 综合 agent 集合，覆盖语言/模式/防御性编程 | bash-defensive-patterns, shellcheck-configuration |
| `xixu-me/skills` | Linux 部署、GitHub Actions（每个都 144K+ 安装） | secure-linux-web-hosting |

## 搜索优先级

找新 skill 的判断顺序：

1. **`anthropics/skills@*`** — 官方出品，安装数往往最高，质量最稳
2. **垂直系列**（如上）— 按主题切片，粒度刚好让 Claude 按需触发
3. **综合集合**（`wshobson/agents`、`mindrally/skills` 等）— 找不到垂直系列时的兜底
4. **个人作品** — 安装数低（< 500）的慎用，质量没保证

## 已评估但未加入的 skill

按系列归类，**有需要时再加**。

### 跟当前 Go + Vue 栈不直接相关

- **Firebase 系列**（10+ 个）：firebase-basics、firebase-auth、firebase-hosting、firestore、firebase-data-connect、developing-genkit 等 — 用 Firebase 时再加
- **Convex 系列**（5 个）：convex-quickstart、convex-performance-audit、convex-setup-auth、convex-migration-helper、convex-create-component — 用 Convex 时再加
- **Azure 系列**（20+ 个）：覆盖云服务全系列 — 用 Azure 时再加
- **Next.js**（`vercel-labs/next-skills`）：next-best-practices — 不写 Next.js 不需要

### 已评估，跟现有 skill 重叠

- **vercel-react-best-practices** (385K)、**vercel-composition-patterns** (166K)：React 性能/组合模式，跟 Vue 栈不重叠但用户不写 React
- **shadcn** (132K)：shadcn/ui 最佳实践 —— 已被 `web-artifacts-builder` 覆盖（内含 shadcn）
- **better-auth-best-practices** (47K)：认证库 —— 项目用到再加
- **playwright-best-practices** (currents-dev, 36K)：跟已装 `webapp-testing` 重叠
- **leonxlnx 设计系列**：high-end-visual-design、redesign-existing-projects 等 —— 跟已装 `frontend-design` 重叠

### 已评估，决定自写胜出（2026-05-23）

这一轮重写/新增 custom skill 时调研过的同主题外部候选。每个都不如自写版贴合用户场景（语言无关、Go 后端方向、强 default 判断）。

- **wshobson/agents@api-design-principles** (21.3K)：REST + GraphQL 通用，缺 RFC 7807 / cursor 分页 / graceful shutdown / 中间件顺序 — 自写 `custom/rest-api-design`
- **rmyndharis/antigravity-skills@database-architect** (84 安装，低于阈值)：宏观偏 partition / replication，缺命名约定 / PK 选型 / timestamp / 复合索引列序等细节 — 自写 `custom/database-schema-design`
- **supercent-io/skills-template@security-best-practices** (14.1K)：Node/Express 专属（Helmet / Joi / DOMPurify），缺 password hashing / timing 攻击 / 幂等性 / 文件上传 — 自写 `custom/backend-safety-checklist`
- **sergiodxa/agent-skills@owasp-security-check** (860)：audit/review 视角，60% 内容跟 backend-safety-checklist 重叠，TS 代码示例风格 — 不装；其中 HTTP 安全头部分独立自写 `custom/web-security-headers`
- **bobmatnyc/claude-mpm-skills@golang-database-patterns**：综合 DB skill（sqlx/pgx + repo + 连接池），migration 只一句话 — 跟已装 `samber/cc-skills-golang@golang-database` 重叠，不装
- **onewave-ai/claude-skills@database-migrator**：实为跨 DB 平台迁移（PG → MySQL 翻译），不是 schema 演进版本管理 — 不装

### skills.sh 缺失主题（已自写补盘）

skills.sh 搜遍无现成可用，全部自写。下次需要同主题时直接看 `custom/`。

- **韧性模式**（circuit breaker / bulkhead / rate limit / retry+backoff / fallback / load shedding） — 自写 `custom/resilience-patterns`
- **可观测性设计层**（SLI / SLO / error budget / 4 golden signals / log level 受众策略 / trace 采样 4 种） — 自写 `custom/observability-design`
- **Go 数据库迁移**（goose / Atlas / golang-migrate 选型 / 多步零停机 / dirty 恢复） — 自写 `custom/golang-db-migration`

### 工具/集成类（按场景启用）

- **Firecrawl 系列**（6 个）：scrape、search、agent、crawl、map、download — 爬虫场景启用
- **飞书系列**（larksuite/cli, 6 个）：lark-doc、lark-approval、lark-slides、lark-attendance、lark-okr、lark-openapi-explorer — 公司用飞书启用
- **Caveman 系列**（5 个）：commit、review、compress、help — 中文工作流，跟 `git-workflow-and-versioning` 重叠
- **Marketing 系列**（coreyhaines31/marketingskills, 25+ 个）：SEO、CRO、邮件营销、广告 — 做营销/独立产品时加
- **xixu-me 其他**：github-actions-docs、openclaw-secure-linux-cloud、develop-userscripts、opensource-guide-coach — 按场景

### 访问受限

- **Sentry** (`sentry/dev/sentry-cli`)：仓库可能私有，git clone 失败
- **jssfy/k-skills**（曾尝试 go-backend-reviewer）：私有仓库，git clone 失败
