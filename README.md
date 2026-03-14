# 👶 Marcos do Desenvolvimento - HealthTech App

**Marcos do Desenvolvimento** é uma plataforma SaaS (Software as a Service) voltada para o acompanhamento pediátrico e familiar do desenvolvimento infantil. O sistema permite monitorar marcos cognitivos, motores, sociais e de linguagem, considerando janelas temporais de desenvolvimento típico e atípico (Síndrome de Down).

Este projeto foi desenvolvido como **Trabalho de Conclusão de Curso (TCC)** e validado como uma Prova de Conceito (PoC) para uso clínico.

---

## 🚀 Principais Funcionalidades

* **👩‍⚕️ Relatórios Clínicos Inteligentes:** Geração de Prontuários Médicos otimizados para impressão/PDF, compilando os dados registrados pela família para facilitar a análise do pediatra.
* **⚠️ Sistema de Alerta Precoce:** Lógica de negócio baseada em literatura médica que sinaliza automaticamente atrasos de desenvolvimento ou regressões (perda de habilidades previamente adquiridas).
* **📱 Progressive Web App (PWA):** Instalável diretamente na tela inicial de smartphones (iOS/Android), funcionando com experiência de aplicativo nativo.
* **🌙 Dark Mode Nativo:** Interface responsiva com alternância dinâmica para Modo Escuro, garantindo acessibilidade visual.
* **📊 Dashboards em Tempo Real:** Acompanhamento visual do progresso da criança através de gráficos dinâmicos e "Mural de Conquistas".

---

## 🔐 Segurança e Arquitetura

O sistema foi rigorosamente testado e blindado contra as vulnerabilidades mais comuns do mercado web (OWASP Top 10):
* **Proteção contra IDOR (Insecure Direct Object Reference):** Consultas baseadas em escopo (`current_user.children`) garantem isolamento total de dados entre diferentes famílias.
* **Prevenção de XSS (Cross-Site Scripting):** Entradas de diário de bordo e anotações higienizadas nativamente.
* **Mass Assignment:** Bloqueado via padrão *Strong Parameters* na camada de controle.
* **Defesa CSRF:** Tokens de autenticidade obrigatórios em todas as requisições de mutação de estado.

---

## 🛠️ Tecnologias Utilizadas

* **Backend:** Ruby on Rails 8
* **Frontend:** TailwindCSS, Hotwire (Turbo & Stimulus)
* **Banco de Dados:** PostgreSQL / SQLite
* **Gráficos:** Chartkick + Chart.js

---

## 💻 Como rodar o projeto localmente

Pré-requisitos: Ruby (v3.2+) e Node.js instalados.

1. Clone este repositório:
   ```bash
   git clone [https://github.com/ayslanhugo/marcos_desenvolvimento.git](https://github.com/ayslanhugo/marcos_desenvolvimento.git)
   cd marcos_desenvolvimento

2. Instale as dependências:

    Bash
    bundle install
3. Prepare o banco de dados:

    Bash
    rails db:create db:migrate

# Opcional: Popular banco com dados fictícios para testes
    rails db:seed
4. Inicie o servidor de desenvolvimento:

    Bash
    bin/dev
5. Acesse no navegador: http://localhost:3000

Desenvolvido por Ayslan Hugo - 2026.