# Medição, Analytics e Search Console

## Plano de medição

Comece pelo objetivo comercial. Defina evento, disparo, parâmetros permitidos, plataforma, evidência de teste e forma de leitura.

Eventos comuns:

- `generate_lead` para envio confirmado de formulário;
- `click_whatsapp` para clique em link de WhatsApp;
- `click_call` para clique em telefone;
- `click_email` para clique em e-mail;
- `view_service` quando houver necessidade analítica real.

Mantenha nomes consistentes. Parâmetros podem indicar página, posição do CTA, serviço e campanha, mas nunca nome, telefone, e-mail, mensagem ou outro dado pessoal do visitante.

## GA4 e gerenciador de tags

- Deixe o ID de medição configurável até o cliente fornecê-lo.
- Evite instalar o mesmo código por mais de um caminho.
- Respeite consentimento e política de privacidade aplicáveis.
- Teste em modo de depuração ou tempo real sem gerar dados pessoais.
- Marque como conversão somente eventos realmente valiosos.
- Registre propriedade, fluxo, fuso horário e responsáveis, sem guardar credenciais.

Para WhatsApp, diferencie o clique do atendimento e da venda. Analytics comprova interação com o link, não lead qualificado por si só.

## UTM

Use UTMs consistentes em links controlados, especialmente o site do Perfil da Empresa e campanhas orgânicas mensuráveis. Exemplo de convenção:

```text
utm_source=google
utm_medium=organic
utm_campaign=google_business_profile
```

Acrescente conteúdo somente quando ele ajuda a diferenciar pontos de entrada. Não use UTMs em links internos do site.

## Search Console

Quando fizer parte do escopo:

1. escolha propriedade de domínio para cobertura de protocolos e subdomínios; use prefixo de URL quando houver motivo específico;
2. obtenha o token pela conta correta e peça ao usuário para inserir segredos diretamente quando necessário;
3. adicione o registro DNS sem alterar registros não relacionados;
4. confirme a propagação pública e conclua a verificação;
5. mantenha o registro de verificação enquanto a propriedade for usada;
6. envie o sitemap canônico;
7. inspecione a página inicial e páginas prioritárias;
8. solicite indexação apenas quando apropriado.

Verificação e envio do sitemap não garantem indexação. Uma solicitação de nova leitura é um pedido, não uma promessa de prazo.

## Linha de base e relatório

Registre a data de lançamento e, quando houver dados:

- usuários e sessões orgânicas;
- cliques e impressões da Pesquisa;
- consultas e páginas principais;
- conversões por canal e página;
- interações do Perfil do Google disponíveis;
- cobertura de indexação e problemas relevantes;
- período comparado e alterações executadas.

Compare períodos equivalentes e sinalize sazonalidade, baixo volume e mudanças de rastreamento. Separe resultado observado de causalidade presumida.
