Feature: Pobierz "id" oraz "name" pokemonów dla "generation-iii" https://beta.pokeapi.co/graphql/console/

  Scenario: Test a simple API
    Given url 'https://beta.pokeapi.co/graphql/v1beta'

    * text query =
    """
        {
          pokemon_v2_pokemonspecies(where: {generation_id: {_eq: 3}}) {
            id
            name
          }
        }
    """
    And request { query: '#(query)' }
    And header Accept = 'application/json'
    When method post

    Then status 200

    #1. czy array zwróconych elementów nie jest pusty
    * match response != null