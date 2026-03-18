# db/seeds.rb

puts "--- Iniciando a limpeza do banco de dados ---"

Progress.delete_all
Milestone.delete_all

puts "--- Semeando Marcos de Desenvolvimento (Referência: Papalia & Feldman) ---"

# --- 1. DESENVOLVIMENTO TÍPICO ---
tipico_milestones = [
  # 0-2 MESES
  { titulo: "Reflexo de sucção", categoria: "motor", idade_minima_meses: 0, idade_maxima_meses: 2, descricao: "Reflexo essencial para a alimentação inicial." },
  { titulo: "Reflexo de preensão palmar", categoria: "motor", idade_minima_meses: 0, idade_maxima_meses: 2, descricao: "Fecha a mão ao toque na palma." },
  { titulo: "Reflexo de Moro", categoria: "motor", idade_minima_meses: 0, idade_maxima_meses: 2, descricao: "Reação de sobressalto a sons ou movimentos bruscos." },
  { titulo: "Fixação visual em rostos", categoria: "social", idade_minima_meses: 0, idade_maxima_meses: 2, descricao: "Fixa o olhar brevemente em rostos humanos." },
  { titulo: "Reconhecimento da voz materna", categoria: "cognitivo", idade_minima_meses: 0, idade_maxima_meses: 2, descricao: "Demonstra reação ao ouvir a voz da mãe." },
  { titulo: "Choro comunicativo", categoria: "linguagem", idade_minima_meses: 0, idade_maxima_meses: 2, descricao: "O choro é a principal forma de expressar necessidades." },

  # 2-3 MESES
  { titulo: "Primeiro sorriso social", categoria: "social", idade_minima_meses: 2, idade_maxima_meses: 3, descricao: "Sorri intencionalmente em resposta à interação." },
  { titulo: "Levantar a cabeça em bruços", categoria: "motor", idade_minima_meses: 2, idade_maxima_meses: 3, descricao: "Consegue erguer a cabeça por curtos períodos quando deitado de barriga para baixo." },
  { titulo: "Seguir objetos com os olhos", categoria: "cognitivo", idade_minima_meses: 2, idade_maxima_meses: 3, descricao: "Inicia o rastreamento visual de objetos em movimento." },
  { titulo: "Emissão de sons guturais", categoria: "linguagem", idade_minima_meses: 2, idade_maxima_meses: 3, descricao: "Produz pequenos ruídos e sons com a garganta." },

  # 3-4 MESES
  { titulo: "Sustentação cefálica", categoria: "motor", idade_minima_meses: 3, idade_maxima_meses: 4, descricao: "Sustenta melhor a cabeça sem apoio." },
  { titulo: "Levar mãos à boca", categoria: "motor", idade_minima_meses: 3, idade_maxima_meses: 4, descricao: "Exploração motora inicial levando as mãos à boca." },
  { titulo: "Riso social", categoria: "social", idade_minima_meses: 3, idade_maxima_meses: 4, descricao: "Ri alto em resposta a estímulos e brincadeiras." },

  # 4-5 MESES
  { titulo: "Rolar (Abdômen para costas)", categoria: "motor", idade_minima_meses: 4, idade_maxima_meses: 5, descricao: "Consegue virar o corpo de bruços para cima." },
  { titulo: "Diferenciação de rostos", categoria: "social", idade_minima_meses: 4, idade_maxima_meses: 5, descricao: "Começa a distinguir entre cuidadores e estranhos." },

  # 5-6 MESES
  { titulo: "Sentar com apoio", categoria: "motor", idade_minima_meses: 5, idade_maxima_meses: 6, descricao: "Mantém-se sentado quando apoiado por almofadas ou cuidadores." },
  { titulo: "Alcançar objetos", categoria: "motor", idade_minima_meses: 5, idade_maxima_meses: 6, descricao: "Tenta e consegue pegar objetos voluntariamente." },
  { titulo: "Início do balbucio", categoria: "linguagem", idade_minima_meses: 5, idade_maxima_meses: 6, descricao: "Produção de sons repetitivos e exploração vocal." },

  # 6-7 MESES
  { titulo: "Transferir objetos entre mãos", categoria: "motor", idade_minima_meses: 6, idade_maxima_meses: 7, descricao: "Passa um brinquedo de uma mão para a outra." },
  { titulo: "Responder ao próprio nome", categoria: "linguagem", idade_minima_meses: 6, idade_maxima_meses: 7, descricao: "Vira a cabeça ou reage quando é chamado pelo nome." },

  # 7-8 MESES
  { titulo: "Sentar sem apoio", categoria: "motor", idade_minima_meses: 7, idade_maxima_meses: 8, descricao: "Mantém o equilíbrio sentado de forma independente." },
  { titulo: "Permanência do objeto inicial", categoria: "cognitivo", idade_minima_meses: 7, idade_maxima_meses: 8, descricao: "Procura objetos que foram parcialmente escondidos." },
  { titulo: "Ansiedade de estranhos", categoria: "social", idade_minima_meses: 7, idade_maxima_meses: 8, descricao: "Demonstra receio ou choro ao ser segurado por desconhecidos." },

  # 8-9 MESES
  { titulo: "Ficar em pé com apoio", categoria: "motor", idade_minima_meses: 8, idade_maxima_meses: 9, descricao: "Usa móveis ou mãos de adultos para se sustentar em pé." },
  { titulo: "Pinça grosseira", categoria: "motor", idade_minima_meses: 8, idade_maxima_meses: 9, descricao: "Tenta pegar pequenos objetos usando os dedos de forma rudimentar." },

  # 9-10 MESES
  { titulo: "Engatinhar coordenado", categoria: "motor", idade_minima_meses: 9, idade_maxima_meses: 10, descricao: "Desloca-se pelo ambiente de forma independente." },
  { titulo: "Uso de gestos (Tchau/Apontar)", categoria: "linguagem", idade_minima_meses: 9, idade_maxima_meses: 10, descricao: "Usa as mãos para comunicar desejos ou despedidas." },

  # 11-12 MESES
  { titulo: "Primeiros passos", categoria: "motor", idade_minima_meses: 11, idade_maxima_meses: 13, descricao: "Pode dar passos curtos sem apoio." },
  { titulo: "Pinça fina", categoria: "motor", idade_minima_meses: 11, idade_maxima_meses: 12, descricao: "Pega pequenos objetos com precisão usando polegar e indicador." },
  { titulo: "Primeiras palavras", categoria: "linguagem", idade_minima_meses: 11, idade_maxima_meses: 13, descricao: "Diz palavras simples com significado (ex: 'papá', 'mamá')." },

  # 12-18 MESES
  { titulo: "Andar com estabilidade", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 18, descricao: "Caminha com firmeza e explora o ambiente." },
  { titulo: "Imitação de ações adultas", categoria: "cognitivo", idade_minima_meses: 12, idade_maxima_meses: 18, descricao: "Tenta repetir o que vê os adultos fazendo (ex: falar ao telefone)." },
  { titulo: "Alimentar-se com as mãos", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 18, descricao: "Leva comida à boca de forma autônoma." },

  # 18-24 MESES
  { titulo: "Pensamento simbólico", categoria: "cognitivo", idade_minima_meses: 18, idade_maxima_meses: 24, descricao: "Início do faz-de-conta e compreensão de símbolos." },
  { titulo: "Explosão de vocabulário", categoria: "linguagem", idade_minima_meses: 18, idade_maxima_meses: 24, descricao: "Aumento rápido no número de palavras conhecidas (50 ou mais)." },
  { titulo: "Frases de duas palavras", categoria: "linguagem", idade_minima_meses: 18, idade_maxima_meses: 24, descricao: "Combina termos para formar frases simples (ex: 'quer água')." },
  { titulo: "Correr", categoria: "motor", idade_minima_meses: 18, idade_maxima_meses: 24, descricao: "Consegue correr, embora ainda de forma descoordenada." }
]

tipico_milestones.each do |m|
  Milestone.create!(m.merge(tipo_desenvolvimento: :tipico))
end

# --- 2. SÍNDROME DE DOWN (T21) ---
down_milestones = [
  { titulo: "Sustentar a cabeça (T21)", categoria: "motor", idade_minima_meses: 3, idade_maxima_meses: 6, descricao: "Mantém a cabeça firme por alguns instantes quando no colo ou de bruços." },
  { titulo: "Sentar sem apoio (T21)", categoria: "motor", idade_minima_meses: 8, idade_maxima_meses: 18, descricao: "Consegue manter-se sentado e equilibrado sem precisar das mãos para apoio." },
  { titulo: "Engatinhar (T21)", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 24, descricao: "Desloca-se pelo chão usando mãos e joelhos ou arrastando-se." },
  { titulo: "Ficar em pé (T21)", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 24, descricao: "Consegue se sustentar em pé segurando-se em móveis ou mãos." },
  { titulo: "Andar sozinho (T21)", categoria: "motor", idade_minima_meses: 18, idade_maxima_meses: 36, descricao: "Dá passos independentes com equilíbrio e segurança." },
  { titulo: "Permanência do objeto (T21)", categoria: "cognitivo", idade_minima_meses: 10, idade_maxima_meses: 18, descricao: "Procura por um brinquedo que foi escondido completamente sob um pano." },
  { titulo: "Imitação (T21)", categoria: "cognitivo", idade_minima_meses: 12, idade_maxima_meses: 24, descricao: "Imita gestos simples e intencionais, como fingir que fala ao telefone." },
  { titulo: "Pensamento simbólico (T21)", categoria: "cognitivo", idade_minima_meses: 18, idade_maxima_meses: 36, descricao: "Início do faz-de-conta (ex: dar comida para uma boneca ou carrinho)." },
  { titulo: "Balbucio (T21)", categoria: "linguagem", idade_minima_meses: 6, idade_maxima_meses: 12, descricao: "Produz sequências de sons como 'ba-ba', 'da-da' ou 'ma-ma'." },
  { titulo: "Primeiras palavras (T21)", categoria: "linguagem", idade_minima_meses: 12, idade_maxima_meses: 24, descricao: "Diz palavras simples com significado claro para os familiares." },
  { titulo: "Combinar duas palavras (T21)", categoria: "linguagem", idade_minima_meses: 24, idade_maxima_meses: 48, descricao: "Forma frases curtas como 'quer água' ou 'mamãe vem'." },
  { titulo: "Sorriso social (T21)", categoria: "social", idade_minima_meses: 2, idade_maxima_meses: 4, descricao: "Sorri em resposta ao rosto ou à voz de um cuidador." },
  { titulo: "Apego e Reconhecimento (T21)", categoria: "social", idade_minima_meses: 6, idade_maxima_meses: 12, descricao: "Demonstra clara preferência pelos cuidadores principais e estranhamento leve." }
]

down_milestones.each do |m|
  Milestone.create!(m.merge(tipo_desenvolvimento: :sindrome_down))
end

puts "--- Seeds finalizados com sucesso! ---"
puts "Total de Marcos Típicos: #{Milestone.where(tipo_desenvolvimento: :tipico).count}"
puts "Total de Marcos Down: #{Milestone.where(tipo_desenvolvimento: :sindrome_down).count}"
