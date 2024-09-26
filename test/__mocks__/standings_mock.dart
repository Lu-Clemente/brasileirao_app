const standingsMock = '''
[
    {
        "posicao": 1,
        "pontos": 56,
        "time": {
            "time_id": 22,
            "nome_popular": "Botafogo",
            "sigla": "BOT",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d349052558.svg"
        },
        "jogos": 27,
        "vitorias": 17,
        "empates": 5,
        "derrotas": 5,
        "gols_pro": 46,
        "gols_contra": 25,
        "saldo_gols": 21,
        "aproveitamento": 69,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "v",
            "e",
            "v",
            "v",
            "v"
        ]
    },
    {
        "posicao": 2,
        "pontos": 53,
        "time": {
            "time_id": 56,
            "nome_popular": "Palmeiras",
            "sigla": "PAL",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34a1cf247.svg"
        },
        "jogos": 27,
        "vitorias": 16,
        "empates": 5,
        "derrotas": 6,
        "gols_pro": 44,
        "gols_contra": 19,
        "saldo_gols": 25,
        "aproveitamento": 65,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "v",
            "v",
            "v",
            "v",
            "v"
        ]
    },
    {
        "posicao": 3,
        "pontos": 52,
        "time": {
            "time_id": 131,
            "nome_popular": "Fortaleza",
            "sigla": "FOR",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34c76d067.svg"
        },
        "jogos": 27,
        "vitorias": 15,
        "empates": 7,
        "derrotas": 5,
        "gols_pro": 36,
        "gols_contra": 26,
        "saldo_gols": 10,
        "aproveitamento": 64,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "v",
            "v",
            "d",
            "e",
            "v"
        ]
    },
    {
        "posicao": 4,
        "pontos": 45,
        "time": {
            "time_id": 18,
            "nome_popular": "Flamengo",
            "sigla": "FLA",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d348e3f815.svg"
        },
        "jogos": 26,
        "vitorias": 13,
        "empates": 6,
        "derrotas": 7,
        "gols_pro": 42,
        "gols_contra": 32,
        "saldo_gols": 10,
        "aproveitamento": 57,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "d",
            "v",
            "d",
            "e",
            "d"
        ]
    },
    {
        "posicao": 5,
        "pontos": 44,
        "time": {
            "time_id": 57,
            "nome_popular": "São Paulo",
            "sigla": "SAO",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34a23c311.svg"
        },
        "jogos": 27,
        "vitorias": 13,
        "empates": 5,
        "derrotas": 9,
        "gols_pro": 35,
        "gols_contra": 29,
        "saldo_gols": 6,
        "aproveitamento": 54,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "d",
            "v",
            "d",
            "v",
            "d"
        ]
    },
    {
        "posicao": 6,
        "pontos": 42,
        "time": {
            "time_id": 68,
            "nome_popular": "Bahia",
            "sigla": "BAH",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34a8b6bd8.svg"
        },
        "jogos": 27,
        "vitorias": 12,
        "empates": 6,
        "derrotas": 9,
        "gols_pro": 38,
        "gols_contra": 31,
        "saldo_gols": 7,
        "aproveitamento": 51,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "v",
            "e",
            "d",
            "v",
            "d"
        ]
    },
    {
        "posicao": 7,
        "pontos": 42,
        "time": {
            "time_id": 37,
            "nome_popular": "Cruzeiro",
            "sigla": "CRU",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34984830b.svg"
        },
        "jogos": 27,
        "vitorias": 12,
        "empates": 6,
        "derrotas": 9,
        "gols_pro": 34,
        "gols_contra": 27,
        "saldo_gols": 7,
        "aproveitamento": 51,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "e",
            "d",
            "v",
            "d",
            "e"
        ]
    },
    {
        "posicao": 8,
        "pontos": 42,
        "time": {
            "time_id": 44,
            "nome_popular": "Internacional",
            "sigla": "INT",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d349b92103.svg"
        },
        "jogos": 26,
        "vitorias": 11,
        "empates": 9,
        "derrotas": 6,
        "gols_pro": 32,
        "gols_contra": 23,
        "saldo_gols": 9,
        "aproveitamento": 53,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "d",
            "v",
            "v",
            "v",
            "v"
        ]
    },
    {
        "posicao": 9,
        "pontos": 36,
        "time": {
            "time_id": 30,
            "nome_popular": "Atlético-MG",
            "sigla": "CAM",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d3494f3380.svg"
        },
        "jogos": 25,
        "vitorias": 9,
        "empates": 9,
        "derrotas": 7,
        "gols_pro": 35,
        "gols_contra": 36,
        "saldo_gols": -1,
        "aproveitamento": 48,
        "variacao_posicao": 1,
        "ultimos_jogos": [
            "e",
            "d",
            "v",
            "d",
            "v"
        ]
    },
    {
        "posicao": 10,
        "pontos": 35,
        "time": {
            "time_id": 23,
            "nome_popular": "Vasco",
            "sigla": "VAS",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d3490f1e73.svg"
        },
        "jogos": 26,
        "vitorias": 10,
        "empates": 5,
        "derrotas": 11,
        "gols_pro": 30,
        "gols_contra": 36,
        "saldo_gols": -6,
        "aproveitamento": 44,
        "variacao_posicao": -1,
        "ultimos_jogos": [
            "e",
            "v",
            "v",
            "e",
            "d"
        ]
    },
    {
        "posicao": 11,
        "pontos": 32,
        "time": {
            "time_id": 64,
            "nome_popular": "Bragantino",
            "sigla": "BGT",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34a5db2ec.svg"
        },
        "jogos": 27,
        "vitorias": 8,
        "empates": 8,
        "derrotas": 11,
        "gols_pro": 33,
        "gols_contra": 37,
        "saldo_gols": -4,
        "aproveitamento": 39,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "d",
            "d",
            "v",
            "e",
            "d"
        ]
    },
    {
        "posicao": 12,
        "pontos": 32,
        "time": {
            "time_id": 43,
            "nome_popular": "Juventude",
            "sigla": "JUV",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d349b308c6.svg"
        },
        "jogos": 27,
        "vitorias": 8,
        "empates": 8,
        "derrotas": 11,
        "gols_pro": 31,
        "gols_contra": 37,
        "saldo_gols": -6,
        "aproveitamento": 39,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "v",
            "d",
            "d",
            "v",
            "d"
        ]
    },
    {
        "posicao": 13,
        "pontos": 32,
        "time": {
            "time_id": 1,
            "nome_popular": "Criciúma",
            "sigla": "CRI",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d3482a8351.svg"
        },
        "jogos": 27,
        "vitorias": 8,
        "empates": 8,
        "derrotas": 11,
        "gols_pro": 34,
        "gols_contra": 41,
        "saldo_gols": -7,
        "aproveitamento": 39,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "e",
            "d",
            "d",
            "d",
            "e"
        ]
    },
    {
        "posicao": 14,
        "pontos": 31,
        "time": {
            "time_id": 45,
            "nome_popular": "Grêmio",
            "sigla": "GRE",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d349c32bf1.svg"
        },
        "jogos": 26,
        "vitorias": 9,
        "empates": 4,
        "derrotas": 13,
        "gols_pro": 29,
        "gols_contra": 34,
        "saldo_gols": -5,
        "aproveitamento": 39,
        "variacao_posicao": 1,
        "ultimos_jogos": [
            "d",
            "v",
            "d",
            "e",
            "v"
        ]
    },
    {
        "posicao": 15,
        "pontos": 31,
        "time": {
            "time_id": 185,
            "nome_popular": "Athletico-PR",
            "sigla": "CAP",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34e1b8948.svg"
        },
        "jogos": 25,
        "vitorias": 8,
        "empates": 7,
        "derrotas": 10,
        "gols_pro": 27,
        "gols_contra": 29,
        "saldo_gols": -2,
        "aproveitamento": 41,
        "variacao_posicao": -1,
        "ultimos_jogos": [
            "d",
            "d",
            "d",
            "e",
            "e"
        ]
    },
    {
        "posicao": 16,
        "pontos": 28,
        "time": {
            "time_id": 102,
            "nome_popular": "Vitória",
            "sigla": "VIT",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34bb4bf99.svg"
        },
        "jogos": 27,
        "vitorias": 8,
        "empates": 4,
        "derrotas": 15,
        "gols_pro": 29,
        "gols_contra": 39,
        "saldo_gols": -10,
        "aproveitamento": 34,
        "variacao_posicao": 1,
        "ultimos_jogos": [
            "e",
            "d",
            "d",
            "v",
            "v"
        ]
    },
    {
        "posicao": 17,
        "pontos": 28,
        "time": {
            "time_id": 65,
            "nome_popular": "Corinthians",
            "sigla": "COR",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34a68419f.svg"
        },
        "jogos": 27,
        "vitorias": 6,
        "empates": 10,
        "derrotas": 11,
        "gols_pro": 26,
        "gols_contra": 33,
        "saldo_gols": -7,
        "aproveitamento": 34,
        "variacao_posicao": 1,
        "ultimos_jogos": [
            "e",
            "d",
            "v",
            "d",
            "v"
        ]
    },
    {
        "posicao": 18,
        "pontos": 27,
        "time": {
            "time_id": 26,
            "nome_popular": "Fluminense",
            "sigla": "FLU",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d3492a6e0b.svg"
        },
        "jogos": 26,
        "vitorias": 7,
        "empates": 6,
        "derrotas": 13,
        "gols_pro": 21,
        "gols_contra": 29,
        "saldo_gols": -8,
        "aproveitamento": 34,
        "variacao_posicao": -2,
        "ultimos_jogos": [
            "e",
            "v",
            "v",
            "d",
            "d"
        ]
    },
    {
        "posicao": 19,
        "pontos": 23,
        "time": {
            "time_id": 204,
            "nome_popular": "Cuiabá",
            "sigla": "CUI",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34ebcdafa.svg"
        },
        "jogos": 26,
        "vitorias": 5,
        "empates": 8,
        "derrotas": 13,
        "gols_pro": 23,
        "gols_contra": 38,
        "saldo_gols": -15,
        "aproveitamento": 29,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "e",
            "d",
            "v",
            "d",
            "e"
        ]
    },
    {
        "posicao": 20,
        "pontos": 18,
        "time": {
            "time_id": 98,
            "nome_popular": "Atlético-GO",
            "sigla": "ACG",
            "escudo": "https://cdn.api-futebol.com.br/escudos/638d34b9174a3.svg"
        },
        "jogos": 27,
        "vitorias": 4,
        "empates": 6,
        "derrotas": 17,
        "gols_pro": 21,
        "gols_contra": 45,
        "saldo_gols": -24,
        "aproveitamento": 22,
        "variacao_posicao": 0,
        "ultimos_jogos": [
            "v",
            "v",
            "d",
            "d",
            "d"
        ]
    }
]
''';
