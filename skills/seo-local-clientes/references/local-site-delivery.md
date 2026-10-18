# Site local: arquitetura, conteúdo e SEO técnico

## Planejamento

Defina público, conversão prioritária, serviço principal, localidades reais e provas disponíveis. Mapeie uma intenção principal por página e evite páginas que competem entre si.

Arquitetura comum, adaptada ao negócio:

- página inicial;
- uma página útil para cada serviço relevante;
- área atendida e páginas geográficas apenas quando houver operação e conteúdo específico;
- empresa, obras ou casos reais;
- guias e orientações;
- perguntas frequentes;
- contato e orçamento;
- política de privacidade;
- página 404 útil.

Não crie dezenas de páginas trocando apenas o nome da cidade. Agrupe localidades quando não houver informação única suficiente.

## Conteúdo e conversão

- Use um H1 claro e único por página.
- Explique problema, solução, processo, público, área atendida, diferenciais comprovados e próxima ação.
- Posicione CTA de WhatsApp, ligação ou formulário em momentos naturais.
- Use mensagens pré-preenchidas que identifiquem a página de origem sem incluir dados pessoais.
- Mantenha telefone, nome, horários e área de atendimento coerentes com o Perfil do Google.
- Responda perguntas reais; não replique o mesmo FAQ em todas as páginas sem necessidade.

## Metadados, rastreamento e indexação

Prepare para cada página:

- título único e descritivo;
- meta description útil, sem promessa enganosa;
- URL curta e estável;
- canonical autorreferente, salvo caso intencional;
- Open Graph e ícone/favicon;
- breadcrumbs quando ajudam a navegação;
- links internos contextuais;
- robots meta adequado.

Inclua `robots.txt` e sitemap XML válidos, apontando apenas URLs canônicas e indexáveis. Um `llms.txt` pode documentar o site para alguns consumidores, mas não é requisito de indexação nem fator comprovado de ranking; trate-o como opcional.

## Dados estruturados

Use JSON-LD compatível com o conteúdo visível e as diretrizes atuais. Considere `Organization` ou subtipo local adequado, `WebSite`, `BreadcrumbList` e tipos específicos quando legítimos. Marque FAQ somente quando o conteúdo estiver visível e o uso fizer sentido. Não invente avaliações, preço, endereço, licença ou área de serviço.

Valide sintaxe e resultados possíveis. Dados estruturados não garantem rich result.

## Mobile, acessibilidade e desempenho

- Adote layout responsivo sem rolagem horizontal.
- Use alvos de toque de cerca de 44 × 44 CSS pixels quando possível e espaçamento suficiente.
- Garanta foco visível, navegação por teclado, rótulos de formulário, contraste e hierarquia de títulos.
- Não esconda conteúdo essencial no mobile.
- Otimize imagem principal, fontes, CSS e scripts; evite bibliotecas sem benefício claro.
- Reduza mudanças de layout e tarefas longas. Avalie Core Web Vitals com dados de laboratório e, quando disponíveis, dados reais.

## Formulários, privacidade e segurança

Colete apenas dados necessários, exiba destino e finalidade e proteja contra spam. Não envie dados pessoais para Analytics. Use HTTPS, dependências mantidas e cabeçalhos apropriados ao projeto. Política de privacidade e consentimento devem refletir a implementação real e orientação jurídica aplicável.

## Implementação

Preserve o framework e as convenções do projeto quando existentes. Antes de publicar, rode build, testes e verificação de links aplicáveis. Depois do deploy, confirme páginas críticas, assets, canonical, sitemap, robots, formulários e eventos no domínio de produção.
