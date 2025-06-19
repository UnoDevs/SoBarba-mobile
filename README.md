# SoBarba Mobile

Este é o repositório do aplicativo móvel **SoBarba**, um projeto desenvolvido para facilitar a gestão de agendamentos em barbearias, tanto para proprietários quanto para funcionários.

---

## 📚 Sobre o Projeto

O SoBarba Mobile é um **projeto acadêmico**, criado com o objetivo de aplicar conceitos de desenvolvimento de aplicativos para dispositivos móveis utilizando **Flutter**. Ele oferece uma interface intuitiva para que donos de barbearias e seus funcionários possam gerenciar horários, clientes e serviços de forma eficiente.

---

## ✨ Funcionalidades Principais

* **Gestão de Agendamentos**: Crie, visualize e gerencie agendamentos de forma simples.
* **Controle de Clientes e Barbeiros**: Mantenha um registro organizado de seus clientes e funcionários.
* **Interface Intuitiva**: Design pensado para facilitar o uso diário na barbearia.

---

## 🚀 Como Executar o Projeto

Para rodar o projeto em seu ambiente de desenvolvimento, siga os passos abaixo:

1.  **Clone o Repositório:**
    ```bash
    git clone [https://github.com/UnoDevs/SoBarba-mobile.git](https://github.com/UnoDevs/SoBarba-mobile.git)
    ```

2.  **Acesse o Diretório do Projeto:**
    ```bash
    cd SoBarba-mobile
    ```

3.  **Instale as Dependências:**
    ```bash
    flutter pub get
    ```

4.  **Execute o Aplicativo:**
    Conecte um dispositivo Android ou inicie um emulador e execute:
    ```bash
    flutter run
    ```

---

## 🔑 Credenciais de Acesso (Teste)

Para testar o aplicativo, utilize as seguintes credenciais:

* **Email**: `projetosunodevs@gmail.com`
* **Senha**: `admin123`

---

## ⚠️ Aviso Importante sobre o Back-end

Este aplicativo depende de um **back-end serverless**. Ao iniciar o aplicativo ou realizar a primeira requisição, pode haver um pequeno atraso (_cold start_) enquanto a função serverless é inicializada. **Por favor, aguarde alguns segundos** para que as requisições sejam processadas corretamente.

---

## 📦 Geração do APK

Para gerar um arquivo APK (para Android), siga estes passos:

1.  **Navegue até a raiz do projeto** no terminal.

2.  **Execute o comando de build do Flutter:**
    ```bash
    flutter build apk --release
    ```
    Este comando compilará o aplicativo no modo de lançamento, otimizado para desempenho e tamanho reduzido.

3.  **Localize o APK:**
    Após a conclusão do build, o arquivo APK será gerado em:
    `build/app/outputs/flutter-apk/app-release.apk`

---

## 🛠️ Tecnologias Utilizadas

* **Flutter:** Framework para desenvolvimento mobile.
* **Dart:** Linguagem de programação.
* **GetX:** Gerenciamento de estado e rotas.

---

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

---