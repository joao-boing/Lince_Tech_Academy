# Sistema de Relatórios Climáticos

**Gerador de relatórios estatísticos** a partir de dados de sensores meteorológicos armazenados em arquivos CSV.

---

## Descrição

Este programa em **Dart** lê múltiplos arquivos CSV contendo dados climáticos (temperatura, umidade e direção do vento), processa as informações e gera relatórios detalhados por estado, ano e mês.

O sistema oferece três tipos de relatórios:
- Temperatura (com conversão para °F e K)
- Umidade do ar
- Direção predominante do vento (moda)

---

## Funcionalidades

- **Leitura automática** de todos os arquivos CSV no diretório `C:/clima/sensores`
- **Relatório de Temperatura** completo com médias, máximas e mínimas (anual, mensal e por horário)
- **Relatório de Umidade** com estatísticas anuais e mensais
- **Relatório de Direção do Vento** (direção mais frequente por ano e mês)
- **Conversões** de temperatura (°C → °F → K) e direção (graus → radianos)
- **Exportação** opcional dos relatórios em arquivos `.txt`
- **Interface colorida** no terminal
- **Tratamento básico de erros**

---

## Tecnologias Utilizadas

- **Dart** (linguagem principal)
- `dart:io` (entrada/saída e manipulação de arquivos)
- `package:yaansi` (cores no terminal)
- Arquitetura modular (Model + Services)

---

## Estrutura do Projeto

```bash
.
├── main.dart                 # Programa principal e menu interativo
├── lib/
│   ├── models/
│   │   └── registroClima.dart    # Modelo de dados
│   └── services/
│       ├── leitor_csv.dart       # Leitura dos arquivos CSV
│       ├── conversor.dart        # Conversões de unidades
│       └── exportador.dart       # Exportação para .txt
└── README.md
```

## 📂 Formato dos Arquivos CSV

Os arquivos devem estar na pasta: `C:/clima/sensores`

**Nome do arquivo:** `ESTADO_ANO_MES.csv`

**Exemplo:** `SP_2023_05.csv`

**Formato interno (a partir da segunda linha):**
```csv
hora,temperatura,umidade,velocidadeVento,direcaoVento
0,23.5,65,2.3,180
1,22.8,68,1.8,190