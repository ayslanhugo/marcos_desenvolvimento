puts "🌱 Iniciando o plantio de dados (Seeds)..."

# Limpando o banco para não duplicar dados caso você rode o comando mais de uma vez
puts "🧹 Limpando marcos antigos..."
Milestone.destroy_all

# ==============================================================================
# 1. MARCOS DO DESENVOLVIMENTO TÍPICO
# ==============================================================================
puts "👶 Criando Marcos de Desenvolvimento Típico..."

marcos_tipicos = [
  # 2 Meses
  { titulo: "Sorriso Social", descricao: "A criança sorri em resposta ao sorriso ou voz dos pais, mostrando conexão.", categoria: "social", idade_minima_meses: 1, idade_maxima_meses: 2 },
  { titulo: "Sustentar a cabeça", descricao: "Quando deitada de bruços, consegue levantar e manter a cabeça firme por alguns instantes.", categoria: "motor", idade_minima_meses: 1, idade_maxima_meses: 3 },
  { titulo: "Acompanhar com os olhos", descricao: "Acompanha o movimento de objetos ou pessoas passando à sua frente.", categoria: "cognitivo", idade_minima_meses: 1, idade_maxima_meses: 3 },

  # 4 Meses
  { titulo: "Rolar", descricao: "Consegue rolar de barriga para baixo para a posição de barriga para cima (ou vice-versa).", categoria: "motor", idade_minima_meses: 3, idade_maxima_meses: 5 },
  { titulo: "Gargalhadas", descricao: "Dá risadas altas e demonstra empolgação com brincadeiras.", categoria: "social", idade_minima_meses: 3, idade_maxima_meses: 5 },
  { titulo: "Alcançar objetos", descricao: "Estica os braços para pegar brinquedos pendurados ou oferecidos.", categoria: "motor", idade_minima_meses: 3, idade_maxima_meses: 5 },

  # 6 Meses
  { titulo: "Sentar sem apoio", descricao: "Senta-se sozinha e consegue se manter equilibrada sem cair para os lados.", categoria: "motor", idade_minima_meses: 5, idade_maxima_meses: 7 },
  { titulo: "Balbuciar", descricao: "Começa a juntar consoantes e vogais, fazendo sons como 'ba-ba', 'ma-ma'.", categoria: "linguagem", idade_minima_meses: 5, idade_maxima_meses: 8 },
  { titulo: "Estranhar desconhecidos", descricao: "Chora ou se esconde ao ver pessoas que não fazem parte do seu convívio diário.", categoria: "social", idade_minima_meses: 6, idade_maxima_meses: 9 },

  # 9 Meses
  { titulo: "Engatinhar", descricao: "Desloca-se pelo ambiente engatinhando ou arrastando-se de forma eficiente.", categoria: "motor", idade_minima_meses: 7, idade_maxima_meses: 10 },
  { titulo: "Movimento de Pinça", descricao: "Pega objetos pequenos usando apenas o dedo polegar e o indicador.", categoria: "motor", idade_minima_meses: 8, idade_maxima_meses: 11 },
  { titulo: "Apontar", descricao: "Usa o dedo indicador para mostrar algo que quer ou que achou interessante.", categoria: "cognitivo", idade_minima_meses: 8, idade_maxima_meses: 11 },

  # 12 Meses (1 Ano)
  { titulo: "Andar com apoio", descricao: "Fica em pé e dá passos segurando nos móveis ou nas mãos dos pais.", categoria: "motor", idade_minima_meses: 10, idade_maxima_meses: 14 },
  { titulo: "Primeiras palavras", descricao: "Fala as primeiras palavras com significado (ex: 'mamã', 'papá', 'água').", categoria: "linguagem", idade_minima_meses: 10, idade_maxima_meses: 15 },
  { titulo: "Dar tchau", descricao: "Acena com a mão para se despedir das pessoas, imitando os adultos.", categoria: "social", idade_minima_meses: 9, idade_maxima_meses: 12 },

  # 18 Meses (1 Ano e Meio)
  { titulo: "Andar sozinho", descricao: "Anda com firmeza, sem precisar de apoio, e já tenta correr.", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 16 },
  { titulo: "Uso de colher", descricao: "Tenta comer sozinho usando uma colher, mesmo que derrube um pouco.", categoria: "motor", idade_minima_meses: 15, idade_maxima_meses: 20 },
  { titulo: "Compreensão de comandos", descricao: "Entende e obedece a comandos simples, como 'pegue a bola' ou 'dê para a mamãe'.", categoria: "cognitivo", idade_minima_meses: 14, idade_maxima_meses: 18 },

  # 24 Meses (2 Anos)
  { titulo: "Correr e pular", descricao: "Corre com confiança e consegue pular com os dois pés saindo do chão.", categoria: "motor", idade_minima_meses: 20, idade_maxima_meses: 24 },
  { titulo: "Frases curtas", descricao: "Junta duas ou mais palavras para formar pequenas frases (ex: 'quer água', 'vamos passear').", categoria: "linguagem", idade_minima_meses: 18, idade_maxima_meses: 24 },
  { titulo: "Faz de conta", descricao: "Brinca de dar comidinha para a boneca, falar ao telefone ou imitar rotinas da casa.", categoria: "cognitivo", idade_minima_meses: 20, idade_maxima_meses: 26 }
]

marcos_tipicos.each do |marco|
  Milestone.create!(marco.merge(tipo_desenvolvimento: "tipico"))
end

# ==============================================================================
# 2. MARCOS DO DESENVOLVIMENTO: SÍNDROME DE DOWN
# ==============================================================================
# Nota: As janelas de tempo são mais amplas devido à hipotonia (tônus muscular
# diminuído) e ritmos cognitivos diferenciados, respeitando a neurodivergência.
puts "🌻 Criando Marcos de Desenvolvimento Atípico (Síndrome de Down)..."

marcos_down = [
  # Primeiros Meses
  { titulo: "Sorriso Social", descricao: "Responde com sorriso a estímulos faciais e vocais de quem cuida.", categoria: "social", idade_minima_meses: 2, idade_maxima_meses: 4 },
  { titulo: "Sustentar a cabeça", descricao: "Passa a conseguir firmar o pescoço quando puxado pelas mãos para sentar.", categoria: "motor", idade_minima_meses: 3, idade_maxima_meses: 6 },

  # Fase de Rolar e Sentar
  { titulo: "Rolar", descricao: "Consegue rolar o corpo na cama ou no tapete, fortalecendo o tronco.", categoria: "motor", idade_minima_meses: 4, idade_maxima_meses: 8 },
  { titulo: "Sentar com apoio", descricao: "Mantém-se sentado quando apoiado em almofadas ou no colo.", categoria: "motor", idade_minima_meses: 6, idade_maxima_meses: 10 },
  { titulo: "Sentar sem apoio", descricao: "Senta sozinho com equilíbrio estruturado.", categoria: "motor", idade_minima_meses: 8, idade_maxima_meses: 14 },

  # Interação e Mobilidade
  { titulo: "Balbuciar e vocalizar", descricao: "Emite sons tentando imitar o adulto e responder a conversas.", categoria: "linguagem", idade_minima_meses: 7, idade_maxima_meses: 12 },
  { titulo: "Engatinhar ou arrastar", descricao: "Explora o ambiente se arrastando com a barriga no chão ou engatinhando.", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 20 },

  # Conquistas Maiores
  { titulo: "Ficar em pé com apoio", descricao: "Puxa-se nos móveis (sofá, rack) para tentar ficar de pé.", categoria: "motor", idade_minima_meses: 14, idade_maxima_meses: 24 },
  { titulo: "Andar sozinho", descricao: "Conquista a marcha independente, dando os primeiros passos soltos.", categoria: "motor", idade_minima_meses: 18, idade_maxima_meses: 36 },
  { titulo: "Primeiras palavras claras", descricao: "Fala palavras com significado, muitas vezes apoiando-se também em gestos e sinais.", categoria: "linguagem", idade_minima_meses: 18, idade_maxima_meses: 36 },
  { titulo: "Comer com as mãos", descricao: "Pega pedaços de alimentos (frutas, pão) e leva à boca com autonomia.", categoria: "motor", idade_minima_meses: 12, idade_maxima_meses: 20 }
]

marcos_down.each do |marco|
  Milestone.create!(marco.merge(tipo_desenvolvimento: "sindrome_down"))
end

puts "✅ Sucesso! #{Milestone.count} marcos foram cadastrados no sistema."
puts "🎉 Seu TCC está pronto para ser apresentado!"
