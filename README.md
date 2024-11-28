

# Greengrocer

O **Greengrocer** é um aplicativo de e-commerce desenvolvido em **Flutter** que oferece uma experiência prática e eficiente para compra de produtos de hortifrúti. Utilizando o **GetX** como gerenciador de estado, o aplicativo possui uma interface fluida e funcionalidades otimizadas para atender às necessidades dos usuários.


## Índice
- [Descrição](#descrição)
- [Funcionalidades](#funcionalidades)
- [Como Funciona](#como-funciona)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Instalação](#instalação)
- [Contribuições](#contribuições)


## Descrição

O **Greengrocer** é uma plataforma projetada para facilitar a compra de frutas, legumes e verduras. Com uma interface simples e intuitiva, o aplicativo permite que os usuários naveguem por categorias de produtos, adicionem itens ao carrinho e finalizem suas compras de maneira rápida e eficiente. O projeto faz uso do **GetX** para gerenciamento de estado, navegação e injeção de dependências, proporcionando uma experiência otimizada.


## Funcionalidades

- **Autenticação de Usuário**  
  - Implementação de login e cadastro de usuários, garantindo acesso seguro.
  - Validações de entrada para garantir integridade dos dados.

- **Listagem de Produtos por Categoria**  
  - Exibe produtos organizados de forma categorizada, facilitando a navegação.

- **Busca de Produtos**  
  - Permite que os usuários pesquisem produtos diretamente pelo nome.

- **Carrinho de Compras**  
  - Adicione, remova ou atualize itens no carrinho de compras.
  - Exibição do total a pagar com base nos produtos selecionados.

- **Pagamento via Pix**  
  - Geração de QR Code e chave Pix para facilitar o pagamento das compras.


## Como Funciona

1. O usuário realiza login ou cadastro.  
2. Navega pelas categorias e seleciona os produtos desejados.  
3. Adiciona os itens ao carrinho de compras.  
4. Visualiza os detalhes do carrinho e procede para pagamento.  
5. Finaliza a compra com o pagamento via Pix.


## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento do aplicativo.  
- **GetX**: Gerenciador de estado, navegação e injeção de dependências.  
- **Requisições REST**: Conexão com APIs reais para autenticação, listagem de produtos e gerenciamento de pedidos.  


## Instalação

Siga as instruções abaixo para rodar o projeto localmente:

1. Clone o repositório:
   ```bash
   git clone https://github.com/luisabritod/Greengrocer.git
   ```

2. Acesse o diretório do projeto:
   ```bash
   cd Greengrocer
   ```

3. Instale as dependências:
   ```bash
   flutter pub get
   ```

4. Execute o aplicativo:
   ```bash
   flutter run
   ```


## Contribuições

Contribuições são bem-vindas! Para colaborar:

1. Realize um fork do projeto.
2. Crie uma branch para sua feature ou correção de bug:
   ```bash
   git checkout -b feature/nome-da-feature
   ```
3. Faça commit de suas alterações:
   ```bash
   git commit -m "Descrição das alterações"
   ```
4. Envie as alterações para sua branch:
   ```bash
   git push origin feature/nome-da-feature
   ```
5. Abra um Pull Request para revisão.


## Observações

- Certifique-se de que o ambiente Flutter esteja configurado corretamente.  
- Caso tenha dúvidas ou encontre problemas, abra uma issue no repositório.

---
