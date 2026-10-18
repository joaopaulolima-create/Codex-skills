# Domínio, DNS, Git, deploy e entrega

## Antes de alterar infraestrutura

Confirme domínio exato, registrador, provedor DNS autoritativo, hospedagem, framework, comando de build, diretório publicado, repositório, branch e responsáveis. Liste os registros DNS atuais e guarde evidência antes de editar.

Defina o resultado desejado e um plano de reversão. Não mude nameservers ou apague registros amplos quando apenas um registro específico é necessário.

## Domínio e DNS

- Use o registro mínimo exigido pelo serviço: A, AAAA, CNAME, TXT ou outro documentado.
- Preserve e-mail, verificações e registros não relacionados.
- Evite registros conflitantes no mesmo nome.
- Confirme o valor salvo na interface e consulte DNS público autoritativo quando possível.
- Considere TTL e propagação; não declare concluído apenas porque a tela aceitou a alteração.
- Para troca de nameserver, valide previamente todos os registros que precisarão existir no novo provedor.

Nunca publique tokens confidenciais em relatórios. Registros TXT destinados à verificação DNS podem ser públicos por natureza, mas ainda devem ser registrados somente no local necessário.

## Git e repositório

- Preserve histórico e mudanças do cliente.
- Respeite a visibilidade solicitada; não torne um repositório público sem autorização explícita.
- Não versione `.env`, credenciais, chaves privadas nem exportações com dados pessoais.
- Use commits compreensíveis e mantenha configuração reproduzível.
- Conecte a hospedagem ao repositório e branch corretos somente quando isso fizer parte do escopo.

## Deploy

1. valide o build local e a configuração de produção;
2. confirme variáveis de ambiente por nome, sem expor valores;
3. gere preview quando a plataforma permitir;
4. obtenha aprovação quando necessária;
5. publique de forma atômica ou com reversão simples;
6. conecte o domínio personalizado e aguarde HTTPS válido;
7. teste o domínio canônico, redirecionamentos, páginas, assets e formulários;
8. confirme eventos, sitemap, robots e canonical em produção.

Não confunda o subdomínio padrão da hospedagem com marca-d'água. Quando o objetivo for removê-lo da experiência pública, configure o domínio personalizado, redirects e metadados; não esconda avisos contratuais ou de plataforma por meios indevidos.

## Entrega e propriedade

Entregue:

- domínio, hospedagem e repositório identificados;
- lista dos acessos que o cliente deve manter, sem senhas;
- instruções de atualização e rollback;
- configurações externas relevantes;
- data do último deploy e commit ou versão;
- pendências, custos de terceiros e responsáveis;
- relatório de testes em produção.

Garanta que o cliente tenha propriedade ou acesso administrativo adequado aos ativos contratados. Remova acessos temporários quando solicitado e seguro.
