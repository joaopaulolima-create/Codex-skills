# Controle de qualidade e liberação

Use o checklist conforme o escopo. Marque `N/A` com justificativa; não considere um item aprovado sem teste ou evidência.

## Conteúdo e operação local

- nome, telefone, horários, endereço ou área de serviço estão consistentes;
- serviços e localidades correspondem à operação real;
- diferenciais, garantias, licenças e tempo de mercado têm comprovação;
- textos não contêm placeholders, cidade errada, repetição artificial ou conteúdo de outro cliente;
- links, mensagens de WhatsApp e formulários usam canais corretos.

## Navegação e páginas

- navegação principal, rodapé, breadcrumbs e CTAs funcionam;
- páginas previstas existem e retornam o status correto;
- não há links internos quebrados nem rolagem horizontal;
- página 404 é útil e realmente retorna 404;
- redirects intencionais não criam cadeia ou loop.

## SEO técnico

- título, meta description, H1, canonical e robots meta estão adequados;
- `robots.txt` e sitemap XML abrem e refletem o domínio canônico;
- sitemap contém somente páginas indexáveis;
- favicon e metadados sociais estão acessíveis;
- dados estruturados são verdadeiros, válidos e compatíveis com o conteúdo visível;
- ambiente de produção não mantém bloqueio de indexação usado em preview.

## Mobile e acessibilidade

Teste ao menos um viewport estreito semelhante a iPhone e outro semelhante a Android, além de desktop. Confira:

- menu, cabeçalho, texto, tabelas, galeria, formulário e botões fixos;
- alvos de toque, foco por teclado, contraste, rótulos e mensagens de erro;
- zoom e orientação sem perda de conteúdo;
- `alt` contextual e imagens decorativas com `alt` vazio;
- preferência de movimento reduzido quando houver animações relevantes.

Dispositivo emulado ajuda, mas não substitui teste físico quando ele estiver disponível.

## Desempenho

Execute teste de laboratório em páginas representativas e registre data, ferramenta, modo e URL. Verifique imagem principal, fontes, JavaScript, estabilidade visual e cache. Não trate uma única nota como garantia; priorize gargalos reais e dados de campo quando disponíveis.

## Medição

- Analytics carrega uma única vez conforme a política de consentimento;
- cliques em WhatsApp, telefone e formulários disparam uma vez;
- parâmetros não contêm dados pessoais;
- UTMs externas permanecem na sessão conforme esperado;
- propriedade do Search Console, sitemap e domínio correspondem ao site final.

## Produção e aceite

Depois do deploy, repita os testes críticos no domínio público. Registre URL, data, versão, resultado e evidência. Corrija falhas críticas antes de declarar conclusão. Se algo depender de propagação, revisão da plataforma ou dado do cliente, entregue como pendência com responsável e condição de fechamento.
