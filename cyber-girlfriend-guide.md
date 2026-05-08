# 赛博女友搭建方案

> 2026-05-28 整理，待实操

## 整体架构

**AstrBot（中间层）+ ex-skill（人格蒸馏）→ 微信个人号**

流程：聊天记录 → ex-skill 蒸馏出人格/记忆 → persona.md 喂给 AstrBot 当系统 prompt → 微信小号变成赛博前任

---

## ex-skill：前任人格蒸馏

### 仓库

<https://github.com/therealXiaomanChu/ex-skill>

### 安装

```bash
git clone https://github.com/therealXiaomanChu/ex-skill.git ~/.claude/skills/create-ex
```

### 命令速查

| 命令 | 作用 |
|---|---|
| `/create-ex` | 创建新前任 skill |
| `/{代号}` | 聊天 |
| `/{代号}-memory` | 只带记忆模式 |
| `/{代号}-persona` | 只带人格模式 |
| `/list-exes` | 列出所有 |
| `/update-ex {代号}` | 追加新聊天记录、照片等 |
| `/ex-rollback {代号} {版本}` | 回滚 |
| `/delete-ex {代号}` | 删除 |
| `/let-go {代号}` | 温柔删除（同上） |

### 创建流程

1. `/create-ex` 启动 → 起代号 + 基本信息（MBTI、星座、性格标签，可跳过）
2. 喂素材：
   - 微信：WeChatMsg / PyWxDump 导出的 txt/html
   - QQ：txt/mht 导出
   - 微博/朋友圈截图
   - 照片（EXIF 提取时间地点）
   - 直接口述也行
3. 自动分析：记忆提取（共同经历、内部梗、时间线）+ 人格蒸馏（说话风格、情绪模式、依恋类型）
4. 预览确认（5-8 行摘要）
5. 生成到 `exes/<代号>/`：persona.md + memory.md + SKILL.md

### 纠错机制

聊天时说 "ta不会这样说" → 自动记录纠错 → 后续回复调整。越聊越像。

### 关键提醒

- 聊天记录质量决定还原度，深夜对话、吵架记录、日常消息最能暴露真实人格
- 项目定位：个人回忆与情感疗愈，禁止骚扰/跟踪/隐私侵犯
- 沉迷者会被提醒寻求专业帮助

---

## AstrBot：微信接入

### 仓库

<https://github.com/AstrBotDevs/AstrBot>

### 安装

```bash
# uv 方式
uv tool install astrbot && astrbot init && astrbot

# Docker 方式
docker run -d --name astrbot -p 6161:6161 -v ./data:/usr/src/app/data soulter/astrbot:latest
```

WebUI：`http://localhost:6161`，默认账号密码 `astrbot`

### 三步接入微信

1. **对接 LLM**：WebUI → 服务提供商 → 添加（DeepSeek / Claude / Ollama 等）
2. **接微信个人号**：WebUI → 机器人 → 创建 → 个人微信 → 扫码授权
3. **写人格 prompt**：WebUI → 人格与情景 → 粘贴 persona.md 内容

### 版本要求

- iOS ≥ 8.0.70，Android ≥ 8.0.69
- PC ≥ 4.1.8.67

### 局限

- 默认不支持主动发消息（需 `wxclawbot-cli` 工具）
- 微信/QQ 协议常变，掉线先检查更新

### 文档

- 接入个人微信：<https://docs.astrbot.app/platform/weixin_oc.html>

---

## 两者结合路径

1. 用 ex-skill 蒸馏出 persona.md
2. 打开 persona.md，拷贝五层人格描述
3. 粘贴到 AstrBot 的人格与情景系统 prompt
4. memory.md 内容精简后作为上下文或 RAG 知识库
5. 微信小号 → AstrBot → LLM + 前女友人格 = 赛博前任

局限：ex-skill 的纠错层、版本回滚、增量更新等交互功能在 AstrBot 里走不了，但作为静态人格设定完全够用。
