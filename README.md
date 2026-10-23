# Automação SauceDemo com Robot Framework 

## Como Executar

 1. Instale as dependências: `pip install -r requirements.txt`

 2. Execute as suítes de teste gerando os relatórios padrão do Robot e os dados do Allure:
    ```bash
    robot --listener allure_robotframework:./allure-results -d ./logs tests/
    ```

 3. Visualize o relatório do Allure Report:
    ```bash
    allure serve ./allure-results
    ```
    *(Ou para gerar a pasta estática: `allure generate ./allure-results -o ./allure-report --clean` seguido de `allure open ./allure-report`)*