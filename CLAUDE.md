# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 仓库定位

Agent Stack：AI Agent 工具安装 + Skill 地址簿 + 雷达（有趣 AI 项目 watchlist）。

- **安装**：`install.sh` 自包含脚本，一键装齐 AI Agent 工具。用法：`git clone` 本仓库后 `bash install.sh`
- **Skills 地址簿**：`skills/README.md` 按主题分组，记录去哪个 `owner/repo` 找 skill。本仓库不含 CLI、不维护缓存
- **雷达**：`radar/` 目录记录关注中的 AI 项目，观察成熟度后决定是否实装

调研笔记（如 `cyber-girlfriend-guide.md`）跟核心机制无关，不要混进 `README.md` 的索引表。

## 装 skill

用户说"装 `<分组>`" / "装 `<skill-name>`"时：

1. 从 `skills/README.md` 找对应分组的 repo（或含目标 skill 的 repo）。
2. **打开该 repo 的 README，按它自己的安装方式装**。多数是 `git clone` 后把 `skills/<name>` symlink 到 `<target>/.claude/skills/<name>`；少数提供 `npx` / `uv` 安装器。
3. 选 `<target>`：
   - **项目级** `<project>/.claude/skills/`：只当前项目可用。绝大多数业务 skill 选这里。
   - **全局级** `~/.claude/skills/`：所有项目可用。适合工具型（`skill-creator` / `find-skills`）。
4. 多 repo 可并行，但**别混用安装方式**——一个 repo 按一个 repo 的来。
5. 装完汇总：哪些 skill 装到了哪个位置。

## 约束

- 不维护统一缓存。需要 clone 的 repo 直接放到目标 `.claude/skills/.repos/<owner>/<repo>/`（被 `.gitignore` 屏蔽），或 repo README 指定的位置。
- 改 `skills/README.md` 时保持表格分组结构（核心 / 软件开发 / 前端设计 / 内容创作 / 信息获取 / 内容处理）。
- 不主动 commit / push / 开 PR，等用户明说。
