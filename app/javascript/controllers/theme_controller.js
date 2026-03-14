import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Quando a página carrega, aplica o tema salvo ou a preferência do sistema
    this.applyTheme();
    console.log("Tema carregado!");
  }

  toggle() {
    // Alterna a classe 'dark' no elemento html (<html>)
    if (document.documentElement.classList.contains('dark')) {
      document.documentElement.classList.remove('dark');
      localStorage.setItem('theme', 'light');
    } else {
      document.documentElement.classList.add('dark');
      localStorage.setItem('theme', 'dark');
    }
  }

  applyTheme() {
    const theme = localStorage.getItem('theme');
    if (theme === 'dark' || (!theme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }
}