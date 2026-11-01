# Awesome OPD

A reading collection on **on-policy distillation (OPD)** for language models and agents, covering general OPD, agent training, efficiency, latent context, and on-policy self-distillation.

**34 papers**, each with an English TL;DR explaining the problem and core insight. Every entry links to its versioned arXiv page and an archived PDF; available LaTeX sources and original source archives are included.

## Contents

| Category | Focus | Papers |
| --- | --- | ---: |
| [OPD](#opd) | General methods, optimization, supervision reliability, teacher selection, and analysis. | 13 |
| [Agent OPD](#agent-opd) | Distillation for multi-turn interaction, tool use, trajectory correction, and agent credit assignment. | 10 |
| [Efficient OPD](#efficient-opd) | Data efficiency, example selection, prefix training, and compute allocation. | 5 |
| [LatentOPD](#latentopd) | Learned latent privileged context for on-policy self-distillation. | 1 |
| [OPSD](#opsd) | On-policy self-distillation with privileged information, including its mechanisms and failure modes. | 5 |

Papers are listed once under their primary topic, ordered by arXiv identifier within each group. Related RL and SFT papers are explicitly marked as **background**. The five categories overlap conceptually; placement reflects each paper’s main contribution.

## OPD

General methods, optimization, supervision reliability, teacher selection, and analysis.

### Recovering Reliable Supervision via Critique-Guided On-Policy Distillation

[arXiv: 2610.20572v1](https://arxiv.org/abs/2610.20572v1) · [PDF](papers/opd/2610.20572v1/paper.pdf) · [LaTeX source](papers/opd/2610.20572v1/source)

**TL;DR:** A teacher can recognize student errors yet follow them when continuing an incorrect prefix, undermining OPD supervision. CriticOPD has the teacher critique a failed rollout and the student revise it; the teacher scores the revision with the critique as privileged context, while the student trains without that context. This uses error recognition to recover reliable supervision on mathematical reasoning tasks.

### Transfer-Stratified On-Policy Distillation for RL-Improved Reasoning Teachers

[arXiv: 2610.05974v1](https://arxiv.org/abs/2610.05974v1) · [PDF](papers/opd/2610.05974v1/paper.pdf) · [LaTeX source](papers/opd/2610.05974v1/source)

**TL;DR:** RL improvements in a teacher do not transfer uniformly to smaller students. TS-OPD stratifies problems by joint teacher–student success, uses gated forward KL for knowledge acquisition and gated reverse KL for consolidation, and adds an entropy brake. The insight is to match supervision to the student’s learning need; gains in average correctness need not translate uniformly to pass@K.

### Towards Understanding On-Policy Distillation through the Lens of Test-Time Scaling

[arXiv: 2608.11829v3](https://arxiv.org/abs/2608.11829v3) · [PDF](papers/opd/2608.11829v3/paper.pdf) · [LaTeX source](papers/opd/2608.11829v3/source)

**TL;DR:** An OPD model can improve pass@1 yet lose pass@K at larger sampling budgets, even with a more accurate teacher. This work analyzes that reversal and proposes Teacher Advantage Score at K to compare candidate teachers before training. The insight is to select teachers for the intended inference budget, since stronger average accuracy does not guarantee better sampled coverage.

### Pass the Baton: Trajectory-Relayed On-Policy Distillation

[arXiv: 2607.26057v1](https://arxiv.org/abs/2607.26057v1) · [PDF](papers/opd/2607.26057v1/paper.pdf) · [LaTeX source](papers/opd/2607.26057v1/source)

**TL;DR:** After a wrong reasoning turn, student continuations can waste compute and receive unreliable supervision. Relay-OPD detects teacher–student continuation asymmetry and briefly hands generation to the teacher before returning control to the student. A limited relay budget targets critical early positions, improving mathematical reasoning while shortening training trajectories in the evaluated settings.

### Demystifying On-Policy Distillation: Roles, Pathologies, and Regulations

[arXiv: 2607.13399v1](https://arxiv.org/abs/2607.13399v1) · [PDF](papers/opd/2607.13399v1/paper.pdf) · [LaTeX source](papers/opd/2607.13399v1/source)

**TL;DR:** Why can a stronger teacher or more OPD training still produce worse reasoning? This study identifies student–teacher mismatch and length exploitation as failures of the dense supervision signal. Advantage clipping and log-scale compression suppress extreme signals while preserving useful preferences. Its experiments frame OPD as an exploration catalyst whose success depends on signal quality and compatibility rather than teacher size alone.

### Trust Region On-Policy Distillation

[arXiv: 2606.01249v3](https://arxiv.org/abs/2606.01249v3) · [PDF](papers/opd/2606.01249v3/paper.pdf) · [LaTeX source](papers/opd/2606.01249v3/source)

**TL;DR:** Large teacher–student distribution gaps can make sampled reverse-KL supervision unreliable and destabilize OPD. TrOPD restricts on-policy learning to trustworthy regions, treats outliers with alternative estimators or attenuation, and guides exploration using teacher prefixes. The insight is to distinguish where teacher feedback is locally reliable from where the student first needs help reaching a learnable state.

### KL for a KL: On-Policy Distillation with Control Variate Baseline

[arXiv: 2605.07865v1](https://arxiv.org/abs/2605.07865v1) · [PDF](papers/opd/2605.07865v1/paper.pdf) · [LaTeX source](papers/opd/2605.07865v1/source)

**TL;DR:** Single-sample OPD gradients can have high variance and destabilize training. vOPD subtracts a detached control variate baseline computed from the per-token negative reverse KL, using the existing forward pass without an additional critic. Approximating this action-independent baseline with top-k tokens preserves unbiasedness while reducing cost; experiments show improved stability and competitive reasoning performance.

### Rethinking On-Policy Distillation of Large Language Models: Phenomenology, Mechanism, and Recipe

[arXiv: 2604.13016v2](https://arxiv.org/abs/2604.13016v2) · [PDF](papers/opd/2604.13016v2/paper.pdf)

**TL;DR:** Why can OPD fail with a stronger teacher yet work with a weaker one? This study links successful transfer to compatible thinking patterns, genuinely new teacher capabilities, and progressive alignment on shared high-probability tokens. Off-policy cold starts and teacher-aligned prompt selection can rescue failures. The insight is that teacher accuracy alone does not measure how learnable its supervision is for a particular student.

### Entropy-Aware On-Policy Distillation of Language Models

[arXiv: 2603.07079v3](https://arxiv.org/abs/2603.07079v3) · [PDF](papers/opd/2603.07079v3/paper.pdf) · [LaTeX source](papers/opd/2603.07079v3/source)

**TL;DR:** Reverse-KL distillation can collapse generation diversity and become unstable where the teacher is uncertain. Entropy-Aware OPD adds forward KL selectively at high-teacher-entropy positions while retaining reverse KL elsewhere. The insight is that teacher uncertainty can encode multiple useful reasoning paths: mode-covering guidance preserves those alternatives instead of forcing premature commitment to one continuation.

### Learning beyond Teacher: Generalized On-Policy Distillation with Reward Extrapolation

[arXiv: 2602.12125v2](https://arxiv.org/abs/2602.12125v2) · [PDF](papers/opd/2602.12125v2/paper.pdf) · [LaTeX source](papers/opd/2602.12125v2/source)

**TL;DR:** Standard OPD implicitly fixes the balance between a dense teacher-derived reward and KL regularization. G-OPD exposes this balance and the reference model as explicit choices; ExOPD strengthens the reward through extrapolation. The insight is that teacher matching is one constrained-RL operating point, and adjusting it can improve transfer or surpass domain teachers in the tested expert-merging setting.

### Related background

These papers provide relevant context rather than an OPD algorithm.

#### Finetuning with Sampling: SFT Learns Better Than You Think

[arXiv: 2610.02140v1](https://arxiv.org/abs/2610.02140v1) · [PDF](papers/opd/2610.02140v1/paper.pdf) · [LaTeX source](papers/opd/2610.02140v1/source) · **Background**

**TL;DR:** SFT can struggle because expert traces are poorly matched to the learner’s distribution. This work uses MCMC sampling to rewrite off-policy traces into semantically equivalent, more model-compatible data before ordinary SFT. Its insight is to improve learnability by changing the data distribution, allowing expert information to transfer while reducing forgetting and improving generalization in the evaluated settings.

#### Reinforcement Learning with Verifiable Rewards Implicitly Incentivizes Correct Reasoning in Base LLMs

[arXiv: 2506.14245v2](https://arxiv.org/abs/2506.14245v2) · [PDF](papers/opd/2506.14245v2/paper.pdf) · [LaTeX source](papers/opd/2506.14245v2/source) · **Background**

**TL;DR:** Does answer-only RLVR improve reasoning itself, or just final-answer sampling? This work introduces CoT-Pass@K to assess both answers and intermediate reasoning, and studies training dynamics alongside a theoretical incentive analysis. Its insight is that verifiable outcome rewards can encourage correct reasoning under the analyzed conditions; reasoning-aware evaluation can reveal gains that final-answer pass@K alone obscures.

#### Does Reinforcement Learning Really Incentivize Reasoning Capacity in LLMs Beyond the Base Model?

[arXiv: 2504.13837v5](https://arxiv.org/abs/2504.13837v5) · [PDF](papers/opd/2504.13837v5/paper.pdf) · [LaTeX source](papers/opd/2504.13837v5/source) · **Background**

**TL;DR:** This study asks whether RLVR discovers reasoning abilities beyond the base model or mainly makes existing solutions easier to sample. Across the evaluated models, pass@k and trajectory analyses show that small-budget gains can coexist with narrower large-budget coverage. The insight is to distinguish sampling efficiency from reasoning coverage; the findings concern the tested RLVR recipes rather than a universal limit on RL.

## Agent OPD

Distillation for multi-turn interaction, tool use, trajectory correction, and agent credit assignment.

### UOPD: Uncertainty-Aware Intervention for On-Policy Distillation of Multi-Turn Agents

[arXiv: 2609.34036v1](https://arxiv.org/abs/2609.34036v1) · [PDF](papers/agent-opd/2609.34036v1/paper.pdf) · [LaTeX source](papers/agent-opd/2609.34036v1/source)

**TL;DR:** A single bad action can derail later observations, leaving ordinary OPD to supervise an already corrupted trajectory. UOPD identifies uncertain turns using low teacher confidence in student actions, executes teacher actions there, and trains imitation on those corrections; other turns use standard OPD. The insight is that selective trajectory repair can improve the future states from which the student learns.

### Dense Is Not Enough: Hierarchical Supervision Allocation for Long-Horizon On-Policy Distillation

[arXiv: 2609.33409v1](https://arxiv.org/abs/2609.33409v1) · [PDF](papers/agent-opd/2609.33409v1/paper.pdf) · [LaTeX source](papers/agent-opd/2609.33409v1/source)

**TL;DR:** Uniform token matching can waste supervision on guidance that has little future benefit or is beyond the student’s current ability. LENS-OPD allocates supervision hierarchically: locate an intervention, validate its benefit for the student’s subsequent behavior, then refine the policy on decisive token conflicts. The insight is to jointly track future utility and current learnability as the student improves.

### SAGE-OPD: Selective Agent-Guided Intervention for Multi-Turn On-Policy Distillation

[arXiv: 2606.19659v1](https://arxiv.org/abs/2606.19659v1) · [PDF](papers/agent-opd/2606.19659v1/paper.pdf) · [LaTeX source](papers/agent-opd/2606.19659v1/source)

**TL;DR:** Uniform token-level distillation can overcorrect valid actions and propagate unreliable guidance after multi-turn errors. SAGE-OPD uses environment feedback and teacher judgment to select turns needing supervision, then weights that supervision by teacher confidence and normalizes the loss. The insight is to allocate guidance where it is both necessary and reliable while keeping trajectories student-generated.

### On-Policy Distillation with Curriculum Turn-level Guidance for Multi-turn Agents

[arXiv: 2606.15912v2](https://arxiv.org/abs/2606.15912v2) · [PDF](papers/agent-opd/2606.15912v2/paper.pdf) · [LaTeX source](papers/agent-opd/2606.15912v2/source)

**TL;DR:** Small agent errors compound across turns and push rollouts outside the teacher’s reliable state distribution. Guided-OPD mixes teacher- and student-generated turns, gradually reducing teacher intervention to zero. The insight is that early guidance keeps trajectories learnable, while withdrawing it progressively restores the student-controlled histories required for independent multi-turn behavior.

### Keep Policy Gradient in Charge: Sibling-Guided Credit Distillation for Long-Horizon Tool-Use Agents

[arXiv: 2606.12634v3](https://arxiv.org/abs/2606.12634v3) · [PDF](papers/agent-opd/2606.12634v3/paper.pdf) · [LaTeX source](papers/agent-opd/2606.12634v3/source)

**TL;DR:** Direct self-distillation can reinforce shortcuts and even collapse tool use because imitation does not identify which actions earn rewards. SGCD contrasts successful and failed sibling rollouts to construct a training-only credit reference, then uses detached divergence for bounded token-level advantage weighting. Its insight is to let distillation refine credit assignment while reward-grounded policy gradients retain control of the update direction.

### Self-Distilled Agentic Reinforcement Learning

[arXiv: 2605.15155v1](https://arxiv.org/abs/2605.15155v1) · [PDF](papers/agent-opd/2605.15155v1/paper.pdf) · [LaTeX source](papers/agent-opd/2605.15155v1/source)

**TL;DR:** Naively adding self-distillation to agent RL can destabilize learning when retrieved skills provide imperfect privileged guidance. SDAR keeps RL as the main objective and gates an auxiliary distillation loss using detached teacher–student probability gaps. Its asymmetric gate trusts teacher endorsements more than rejections, because a privileged teacher may reject useful behavior when skill retrieval or utilization fails.

### SOD: Step-wise On-policy Distillation for Small Language Model Agents

[arXiv: 2605.07725v3](https://arxiv.org/abs/2605.07725v3) · [PDF](papers/agent-opd/2605.07725v3/paper.pdf) · [LaTeX source](papers/agent-opd/2605.07725v3/source)

**TL;DR:** Erroneous tool calls can abruptly shift an agent into states where teacher supervision becomes unreliable. SOD measures student–teacher divergence at each interaction step and adaptively downweights steps with growing mismatch, alongside outcome-based RL. Its insight is that supervision reliability changes across tool interactions, so uniform distillation can amplify cascading errors instead of correcting them.

### Related background

These papers provide relevant context rather than an OPD algorithm.

#### Multi-Turn Reinforcement Learning for Tool-Calling Agents with Iterative Reward Calibration

[arXiv: 2604.02869v1](https://arxiv.org/abs/2604.02869v1) · [PDF](papers/agent-opd/2604.02869v1/paper.pdf) · [LaTeX source](papers/agent-opd/2604.02869v1/source) · **Background**

**TL;DR:** Dense per-turn rewards can hurt multi-turn tool learning when their discriminative value conflicts with the resulting advantage direction. This work combines MT-GRPO with GTPO and iteratively calibrates rewards using rollout analysis. Its insight is that more frequent reward is useful only when credit assignment preserves the relationship between local behavior and final task success.

#### A Simple "Try Again" Can Elicit Multi-Turn LLM Reasoning

[arXiv: 2507.14295v2](https://arxiv.org/abs/2507.14295v2) · [PDF](papers/agent-opd/2507.14295v2/paper.pdf) · [LaTeX source](papers/agent-opd/2507.14295v2/source) · **Background**

**TL;DR:** Single-turn RL can produce models that repeat failed reasoning instead of revising it across turns. Unary Feedback as Observation (UFO) trains with minimal feedback such as "try again" after an incorrect answer. The key insight is that multi-turn interaction and suitable rewards can teach alternative-path exploration and self-correction without detailed corrective feedback.

#### RAGEN: Understanding Self-Evolution in LLM Agents via Multi-Turn Reinforcement Learning

[arXiv: 2504.20073v2](https://arxiv.org/abs/2504.20073v2) · [PDF](papers/agent-opd/2504.20073v2/paper.pdf) · [LaTeX source](papers/agent-opd/2504.20073v2/source) · **Background**

**TL;DR:** Multi-turn agent RL can enter an "Echo Trap" with repetitive behavior, collapsing reward variation, and unstable gradients. RAGEN provides the StarPO training framework and studies stabilization through trajectory filtering, a critic, and gradient control. Its insight is that rollout diversity, interaction granularity, and reasoning-aware reward signals shape whether agent training develops useful reasoning or shallow strategies.

## Efficient OPD

Data efficiency, example selection, prefix training, and compute allocation.

### 1% of Tokens Can Be Enough: On Gradient Estimation in On-Policy Distillation

[arXiv: 2609.24432v1](https://arxiv.org/abs/2609.24432v1) · [PDF](papers/efficient-opd/2609.24432v1/paper.pdf) · [LaTeX source](papers/efficient-opd/2609.24432v1/source)

**TL;DR:** Useful teacher guidance can still produce noisy sampled-token gradient estimates. This work derives an information-efficiency ratio from a signal-to-noise decomposition under an optimal scalar baseline and approximates it for sparse token selection. Combining usefulness with estimation reliability matches or exceeds full OPD in some mathematical and medical reasoning settings using only 0.1%–1% token budgets.

### What Matters in On-Policy Distillation? A Perspective on Data Efficiency and Data Selection

[arXiv: 2609.05198v2](https://arxiv.org/abs/2609.05198v2) · [PDF](papers/efficient-opd/2609.05198v2/paper.pdf) · [LaTeX source](papers/efficient-opd/2609.05198v2/source)

**TL;DR:** This work asks which examples make OPD data-efficient. Its analyses link harder prompts’ gains to longer reasoning trajectories rather than high token entropy alone: long rollouts support extended alignment and expose reflection patterns. Selecting just eight hard examples can match a 17K-example baseline in the evaluated settings, even when selected problems are unsolvable for the teacher.

### Rethinking On-Policy Distillation of Large Language Models II: One Training Example

[arXiv: 2609.04172v1](https://arxiv.org/abs/2609.04172v1) · [PDF](papers/efficient-opd/2609.04172v1/paper.pdf) · [LaTeX source](papers/efficient-opd/2609.04172v1/source)

**TL;DR:** How much training data does OPD actually need? Repeated rollouts from one query recover most full-data gains, while a small diverse set can match full-data training. State-coverage and alignment analyses suggest that rollouts expose broad teacher supervision quickly but the student absorbs it slowly. The insight is that effective state coverage and optimization efficiency can matter more than raw query count.

### Prune-OPD: Efficient and Reliable On-Policy Distillation for Long-Horizon Reasoning

[arXiv: 2605.07804v3](https://arxiv.org/abs/2605.07804v3) · [PDF](papers/efficient-opd/2605.07804v3/paper.pdf) · [LaTeX source](papers/efficient-opd/2605.07804v3/source)

**TL;DR:** Long student prefixes can drift beyond the region where teacher rewards remain useful, wasting both generation and scoring compute. Prune-OPD measures local student–teacher compatibility, downweights unreliable suffix supervision, and adapts the rollout budget. The insight is to allocate compute according to supervision reliability rather than a fixed length cap; experiments report 37.6%–68.0% less training time while preserving or improving performance.

### Fast and Effective On-policy Distillation from Reasoning Prefixes

[arXiv: 2602.15260v1](https://arxiv.org/abs/2602.15260v1) · [PDF](papers/efficient-opd/2602.15260v1/paper.pdf) · [LaTeX source](papers/efficient-opd/2602.15260v1/source)

**TL;DR:** Full OPD spends substantial compute generating long student responses, even when much of the useful supervision is near the beginning. This work distills only student-generated reasoning prefixes and stops training rollouts early, optionally increasing prefix length over time. The insight is that learning how to begin a reasoning trajectory can transfer to longer inference-time solutions; experiments report 2×–47× lower training FLOPs.

## LatentOPD

Learned latent privileged context for on-policy self-distillation.

### Latent On-Policy Self-Distillation

[arXiv: 2608.13040v1](https://arxiv.org/abs/2608.13040v1) · [PDF](papers/latent-opd/2608.13040v1/paper.pdf) · [LaTeX source](papers/latent-opd/2608.13040v1/source)

**TL;DR:** Existing self-distillation methods depend on hand-designed privileged artifacts such as answers, skills, or feedback. Latent On-Policy Self-Distillation retrieves experiences and learns to compress them into continuous latent tokens that condition a self-teacher. A privileged-margin objective regulates this context learning. The insight is to learn what information makes the teacher useful, rather than fix the privileged context format by hand.

## OPSD

On-policy self-distillation with privileged information, including its mechanisms and failure modes.

Here, **OPSD** means **on-policy self-distillation**: a privileged view of the model supplies supervision to a student view that acts without that privileged context. This section also includes analyses and alternatives that address its limitations, and online self-distillation from an exponential-moving-average teacher.

### Mitigating the Length-Scaling Tax with Online Distillation

[arXiv: 2609.38854v1](https://arxiv.org/abs/2609.38854v1) · [PDF](papers/opsd/2609.38854v1/paper.pdf) · [LaTeX source](papers/opsd/2609.38854v1/source)

**TL;DR:** RL post-training can make already-solved queries unnecessarily verbose without improving accuracy. Length Self-Distillation routes solved prompts to on-policy distillation from an exponential-moving-average teacher while retaining RL for unsolved prompts. The insight is to preserve concise successful behavior while allowing exploration on harder problems, without requiring an external teacher.

### From Self-Distillation to Self-Practice: Privileged Information for Multi-Turn Agents

[arXiv: 2609.29051v1](https://arxiv.org/abs/2609.29051v1) · [PDF](papers/opsd/2609.29051v1/paper.pdf) · [LaTeX source](papers/opsd/2609.29051v1/source)

**TL;DR:** In multi-turn agents, matching a privileged teacher can teach confidence unsupported by the student’s observations. Privileged Self-Practice instead uses short, task-specific instructions to resample mostly failing tasks and trains those contextualized rollouts with plain GRPO. The insight is to use privileged information to improve exploration and experience collection, rather than impose a teacher-matching loss across unequal information states.

### Privileged, but Biased: How PI-Conditioned Teachers Break Self-Distillation

[arXiv: 2608.04794v1](https://arxiv.org/abs/2608.04794v1) · [PDF](papers/opsd/2608.04794v1/paper.pdf) · [LaTeX source](papers/opsd/2608.04794v1/source)

**TL;DR:** A falling self-distillation loss need not imply better task performance. This study finds that privileged conditioning can bias the teacher toward one reference trajectory and concentrate supervision on stylistic or low-information tokens, even penalizing useful exploration. Its insight is that standalone teacher matching can become decoupled from correctness, especially in the difficult settings examined.

### RLCSD: Reinforcement Learning with Contrastive On-Policy Self-Distillation

[arXiv: 2606.11709v2](https://arxiv.org/abs/2606.11709v2) · [PDF](papers/opsd/2606.11709v2/paper.pdf) · [LaTeX source](papers/opsd/2606.11709v2/source)

**TL;DR:** Privileged hints can shift self-distillation toward assertive phrasing and formatting rather than correctness, causing premature shortening or unstable training. RLCSD contrasts teacher predictions conditioned on correct and incorrect hints to suppress shared stylistic shifts, then uses the signal to modulate verifier-based advantages. Its insight is that contrastive supervision should isolate task-relevant evidence while preserving reward-grounded update direction.

### Privileged Information Distillation for Language Models

[arXiv: 2602.04942v3](https://arxiv.org/abs/2602.04942v3) · [PDF](papers/opsd/2602.04942v3/paper.pdf) · [LaTeX source](papers/opsd/2602.04942v3/source)

**TL;DR:** Frontier agents may expose successful actions while hiding the reasoning needed for conventional distillation. This paper turns action trajectories into training-only privileged information and introduces π-Distill, which jointly trains privileged and unprivileged views of a shared model, plus an OPSD alternative using RL with reverse-KL regularization. The insight is to transfer the benefit of informative context without requiring frontier chain-of-thought traces.

## Archive

- [papers/](papers/) contains one directory per paper, grouped by the five categories above.
- Each directory contains `paper.pdf` and `metadata.json`; the 33 papers with local sources also include `source/` and `source.tar.gz`.
- [papers.json](papers.json) provides the categorized index, TL;DRs, file sizes, and SHA-256 checksums.
- The two *Rethinking On-Policy Distillation* papers are archived separately: the first studies mechanisms and recipes; Part II studies one-example training.
- PDFs and sources correspond to the arXiv versions shown in the entries. Existing download metadata is preserved; archive paths and checksums are recorded in `papers.json`.

Paper copyrights and any licenses embedded in the archived materials remain with their respective authors and rights holders.
