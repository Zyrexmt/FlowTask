# FlowTask 🎯

Aplicativo mobile desenvolvido em Flutter como parte do **Simulado 01 — Módulo #02** de treinamento para a modalidade **#08 – Desenvolvimento de Aplicativos Móveis** (WorldSkills).

## 📱 Sobre o projeto

Aplicativo de organização de tarefas no formato Kanban, com cadastro de atividades, priorização, movimentação entre colunas e geração de relatório exportável.

## 🖥️ Telas

- **Home (Menu Principal)** — acesso às funcionalidades: Cadastrar atividade, Ver Kanban, Gerar relatório
- **Cadastro de Atividade** — campo de nome + seleção de prioridade (Baixa, Média, Alta) via dropdown, validação de campo obrigatório, inserção automática na coluna "To do"
- **Kanban** — três colunas fixas (To do / Doing / Done), cards com tag colorida de prioridade (verde/amarelo/vermelho), botões de avançar/voltar respeitando o fluxo (uma coluna por vez), rolagem vertical independente por coluna
- **Geração de Relatório** — exportação em `.txt`, estruturado por seção (To do, Doing, Done), refletindo o estado atual do quadro no momento da exportação

## 📄 Formato do relatório (.txt)

```
To do:
- atividade 01
- atividade 03

Doing:
- atividade 02

Done:
- atividade 04
- atividade 05
```

## 🎨 Paleta de cores (sugerida)

| Cor | Hex |
|---|---|
| Fundo claro | `#F7F7F7` |
| Fundo secundário | `#EDEDED` |
| Azul claro | `#AED6F1` |
| Verde água | `#A2DED0` |
| Texto/escuro | `#333333` |

Tags de prioridade: 🟢 Baixa · 🟡 Média · 🔴 Alta

## ⚙️ Tecnologias

- Flutter
- Persistência local do estado do quadro (atividades e posições mantidas entre sessões)
- Exportação/geração de arquivo local (.txt)

## 📦 Requisitos técnicos atendidos

- Navegação entre telas via interação com elementos da interface
- Sem rolagem horizontal em nenhuma tela
- Bloqueio de avanço/retorno fora do fluxo (ex.: não avançar além de "Done")
- Logo limitada a 20% da largura, foto de usuário com cantos arredondados (quando aplicável)
- Alinhamento de texto justificado em todas as telas
- Ícone de aplicação customizado (não padrão de desenvolvimento)

## ▶️ Como executar

```bash
flutter pub get
flutter run
```

## 📝 Entrega

Desenvolvimento versionado via Git, com no mínimo um commit por funcionalidade/tela.
