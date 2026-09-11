# Paper + SI Workflow

一个面向科研文献批量交付的开放方法论 Skill：公开渠道先取，科研通互助补缺，正文与 Supporting Information 分开验收。

**少做重复操作，明确报告缺项，不把“程序执行成功”当成“文献已收齐”。**

## 项目是什么

输入确定的 DOI / 文献清单，以及用户指定的输出目录；由具备文件、网页和必要浏览器操作能力的 AI 助手，按本 Skill 管理获取、等待、收件、验收和归档。

这是初始方法论版本，提供可安装的 `SKILL.md`、操作参考、任务模板、记录示例和既有实测摘要。**不包含独立下载引擎、科研通 API 客户端、后台调度器或已经通过端到端验证的浏览器自动化实现。** 安装 Skill 不会自动获得浏览器控制、数据库订阅或科研通账号。

## 为什么做

单个下载工具往往只能解决某些出版社或某些文件类型。真实任务还需要避免重复求助、控制积分、区分正文与 SI、等待应助、保护旧文件，并告诉使用者哪些材料仍然缺失。

本项目将这些环节组织为统一流程，不替代科研通本身，也不是科研通官方项目，与平台没有隶属关系。

## 工作流

```text
确定清单、正文/SI 范围、目录及预算
                  |
            本地身份核对与去重
                  |
     公开资源 / 已获授权的资源先获取
                  |
       缺失正文批量求助 + SI 独立补缺
                  |
           保存记录，等待并集中收件
                  |
       文件身份核对 + 已知附件清单核对
                  |
          按用户目录归档并报告缺项
```

可直接下载的 SI 与正文求助等待交错进行；不因一篇待应助阻塞其他条目。若用户指定只用某一渠道，应遵循用户范围，而不是强制遍历全部渠道。

## 核心约束

- DOI 与请求类型联合去重，正文求助不等于 SI 求助。
- 旧论文默认只读，复用时复制，不移动、不覆盖。
- 积分和批量限制以执行时平台页面为准，不硬编码历史价格。
- 发布结果不明时先核对既有求助，不直接再次提交。
- 文件实际保存并核对通过后，才记录为已下载。
- 下载完整度必须说明依据；“找到的都下载了”不等于“全部附件”。
- “未找到 SI”“确认无 SI”“用户接受缺项”是三种不同结果。
- 不导出登录状态，不把密码、Cookie、下载令牌或论文文件放入开源仓库。

## 安装与调用

将仓库中的 `skills/paper-si-workflow` 整个文件夹安装到你的技能目录。例如 Codex 的 `~/.codex/skills/paper-si-workflow`。其他支持 `SKILL.md` 的客户端按各自技能目录安装。

不需要为本方法论安装 Python 依赖；文件解析、下载与浏览器控制由宿主环境及可选工具提供。

调用示例：

```text
使用 $paper-si-workflow 处理这份文献清单，正文和全部 SI 都需要。
保留现有论文不动，优先复用；缺项允许通过我的科研通账号求助。
输出按清单中的分类和文件名，积分总预算为我确认的额度。
发布前先告诉我本批次的预计积分；遇到验证码由我接手。
```

续接示例：

```text
使用 $paper-si-workflow 从已有任务记录继续，只收取已应助文件，
不要重新发布，不增加积分支出；报告仍待应助和缺失的 SI。
```

只整理文件也可明确要求“不联网、不发布求助”。

## 文件导航

- [Skill 入口](skills/paper-si-workflow/SKILL.md)：任务流程与能力边界。
- [科研通工作规范](skills/paper-si-workflow/references/ablesci.md)：预算、发布、等待和收件。
- [记录与验收约定](skills/paper-si-workflow/references/manifest.md)：状态、文件证据和完成判定。
- [任务模板](skills/paper-si-workflow/assets/tasks.example.csv)：仅含虚构示例，不是真实下载任务。
- [记录示例](skills/paper-si-workflow/assets/manifest.example.json)：只展示结构，不是运行配置或可执行程序。
- [实测背景](docs/benchmark.md)：35 篇文献的既有对照结果与局限。
- [贡献指南](CONTRIBUTING.md)：可复现问题与隐私要求。

## 实测带来的启发

在一次既有的本地测试中，两个开源项目合计匹配了参照集中 41 个已知 SI 文件中的 22 个，覆盖 31 篇有已知 SI 的论文中 17 篇的全部已知 SI。这说明公开获取工具值得作为第一轮，但不足以据此承诺完整交付。

这不是本 Skill 的端到端成功率，不是科研通成功率，也不是开源项目充分配置后的能力上限。详见 [测试范围与局限](docs/benchmark.md)。

## 合规与隐私

仅处理用户明确指定、允许获取和使用的资料。优先使用开放许可资源及用户合法授权渠道，遵守出版社、机构和互助平台的访问与分享规则。具备机构阅读权限不自动意味着可以再分发。科研通适配必须遵循其实际规则；不要把未公开的内部接口当成获准调用的 API。

遇到登录、验证码或安全挑战，保留现场并让用户处理，不绕过访问控制。没有持续调度能力时，不承诺关闭任务后仍会自动等候或收件。

仓库不提供论文资源，不承诺百分之百下载，也没有证明比任何商业服务普遍更便宜。MIT 许可证只覆盖本项目原创材料，不覆盖文献、第三方项目或平台服务。

## 致谢与参考

- [科研通官方互助指南](https://www.ablesci.com/post/detail?id=lQR9by)
- [科研通帮助中心](https://www.ablesci.com/knowledge/index)
- [SI-Merge](https://github.com/HengyuLi-Ozaki-lab/SI-Merge)
- [manuscript-harvest](https://github.com/Lattice-Data/manuscript-harvest)

本仓库不捆绑上述项目代码。集成时需分别遵守其许可证和服务条款。

## English summary

An open methodology skill for delivering batches of academic papers and supporting information. Reuse verified local files, retrieve openly available or legitimately authorized materials, use AbleSci mutual aid for approved gaps, and track identity, completeness, cost and provenance separately. This initial release contains instructions and templates, not a standalone downloader or a guarantee of access. It is independent of AbleSci and does not redistribute papers or credentials.
