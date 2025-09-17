# Folder Structure

```
.
└── lib/
    ├── data/
    │   ├── repositories/
    │   │   └── <NAME>_repository.dart
    │   ├── services/
    │   │    └── <NAME>_service.dart
    │   ├── api/
    ├── ui/      
    │   └── <FEATURE_NAME>/
    │       ├── widgets/
    │       ├── stores/
    │       │   └── <FEATURE_NAME>_store.dart
    │       └── <FEATURE_NAME>_page.dart
    └── core/
        ├── ui/
        │   ├── widgets/
        │   ├── themes/
        │   └── routing/
        ├── extensions/
        └── validations/
        └── config/

```

> This represents the folder structure, and no files should be created outside this structure.

## Folder Descriptions

- **data/**: Contém toda a lógica relacionada a dados, incluindo repositórios e serviços.
    - **repositories/**: Contém as classes de repositório, cada uma nomeada como `<NAME>_repository.dart`. Serve para consumir uma fonte de dados como uma `api` externa.
    - **services/**: Server para abstrair regras bem como `packages` e também como agregador de `repositories`.
    - **api/**: Fonte de dados da aplicação.

- **ui/**: Contém os componentes e a lógica da interface do usuário para funcionalidades específicas. Pode ter uma pasta para cada funcionalidade, contendo widgets, gerenciamento de estado (stores) e a página principal da funcionalidade.
        - **widgets/**: Componentes de UI reutilizáveis específicos da funcionalidade.
        - **stores/**: Lógica de gerenciamento de estado, com um arquivo de store nomeado como `<FEATURE_NAME>_store.dart`. Cada `store` contem um conjunto de `Command`s que auxiliam no gerenciamento do estado.
        - **<FEATURE_NAME>_page.dart**: A página principal da funcionalidade.

- **core/**: Contém recursos e utilitários compartilhados usados em toda a aplicação.
    - **ui/**: Componentes de UI compartilhados, temas e lógica de roteamento.
        - **widgets/**: Widgets reutilizáveis usados em várias funcionalidades.
        - **themes/**: Definições de temas e configurações de estilo.
        - **routing/**: Lógica de navegação e gerenciamento de rotas.
    - **extensions/**: Extensões personalizadas para classes Dart.
    - **validations/**: Lógica e utilitários de validação.

