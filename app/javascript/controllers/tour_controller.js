import { Controller } from "@hotwired/stimulus"
import { driver } from "driver.js"

export default class extends Controller {
  connect() {
    if (window.tourEstaRodando) return;
    window.tourEstaRodando = true;

    // Destrói rastros se o Turbo falhar
    if (document.querySelector('.driver-active-element')) {
      const activeDriver = window.driver?.(); 
      if(activeDriver) activeDriver.destroy();
    }

    const path = window.location.pathname;
    const isTelaInicial = path === "/children";
    const isTelaRelatorio = path.match(/^\/children\/\d+$/); // Verifica se a URL é /children/NUMERO (Tela de Detalhes)
    const forcarTour = window.location.search.includes("tour=true");

    // Verifica qual tour rodar baseado na página
    if (isTelaInicial) {
      if (!localStorage.getItem("tour_inicial_concluido") || forcarTour) {
        setTimeout(() => { this.iniciarTourPrincipal(); }, 300);
      }
    } else if (isTelaRelatorio) {
      if (!localStorage.getItem("tour_relatorio_concluido")) {
        // O Atraso aqui precisa ser maior por causa do banco de dados (800ms)
        setTimeout(() => { this.iniciarTourRelatorio(); }, 800);
      }
    }
  }

  disconnect() {
    window.tourEstaRodando = false;
    if (this.driverObj) this.driverObj.destroy();
  }

  // --- TOUR DA TELA INICIAL ---
  iniciarTourPrincipal() {
    this.driverObj = driver({
      showProgress: true,
      allowClose: true,
      doneBtnText: 'Entendi!',
      nextBtnText: 'Próximo →',
      prevBtnText: '← Voltar',
      popoverClass: 'driverjs-theme',
      onDestroyStarted: () => {
        if (!this.driverObj.hasNextStep() || confirm("Tem certeza que deseja fechar as dicas?")) {
          localStorage.setItem("tour_inicial_concluido", "true");
          this.driverObj.destroy();
          if (window.location.search.includes('tour=true')) {
            window.history.replaceState({}, document.title, window.location.pathname);
          }
        }
      }
    });

    let steps = [
      { popover: { title: '👋 Bem-vindo(a)!', description: 'Vamos fazer um tour rápido para você aprender a extrair o máximo do nosso sistema.' } },
      { element: '#passo-aprenda', popover: { title: '📚 Base Científica', description: 'O nosso sistema é fundamentado na literatura médica.', side: "bottom", align: 'start' } },
      { element: '#passo1-cadastrar', popover: { title: '👶 1. Adicionar Criança', description: 'Comece clicando aqui para criar o perfil do seu filho(a).', side: "bottom", align: 'start' } }
    ];

    if (document.querySelector('#passo2-marcos')) {
      steps.push({ element: '#passo2-marcos', popover: { title: '📈 2. Avaliar os Marcos', description: 'Clique aqui para marcar as habilidades da criança.', side: "bottom" } });
    }

    this.driverObj.setSteps(steps);
    this.driverObj.drive();
  }

  // --- TOUR DA TELA DE DETALHES (RELATÓRIO E MARCOS) ---
  iniciarTourRelatorio() {
    this.driverObj = driver({
      showProgress: true,
      allowClose: true,
      doneBtnText: 'Entendi!',
      nextBtnText: 'Próximo →',
      prevBtnText: '← Voltar',
      popoverClass: 'driverjs-theme',
      onDestroyStarted: () => {
        localStorage.setItem("tour_relatorio_concluido", "true");
        this.driverObj.destroy();
      }
    });

    let steps = [];

    const primeiroMarco = document.querySelector('.tour-alvo-marcar');
    const elementoAlvo = primeiroMarco ? primeiroMarco : '#progresso_geral_container';

    steps.push({ 
      element: elementoAlvo, 
      popover: { 
        title: '✅ Como Avaliar', 
        description: 'Clique no card da habilidade! Se a criança já consegue fazer, marque como "Adquiriu". Se notar uma piora, marque "Regressão".', 
        side: "top" 
      } 
    });

    const relatorioBtn = document.querySelector('#passo3-relatorio');
    if (relatorioBtn) {
      steps.push({ element: '#passo3-relatorio', popover: { title: '📄 Relatório para o Pediatra', description: 'Sempre que for a uma consulta, clique aqui. O sistema vai gerar um Prontuário Médico profissional!', side: "left" } });
    }

    if (steps.length > 0) {
      this.driverObj.setSteps(steps);
      this.driverObj.drive();
    }
  }

  // --- O BOTÃO MÁGICO DE AJUDA NA NAVBAR ---
  reiniciar(event) {
    event.preventDefault();
    event.stopPropagation();
    
    // Apaga a memória dos dois tours
    localStorage.removeItem("tour_inicial_concluido");
    localStorage.removeItem("tour_relatorio_concluido");

    if (document.querySelector('#passo1-cadastrar')) {
      this.iniciarTourPrincipal();
    } else {
      window.location.href = "/children?tour=true";
    }
  }
}