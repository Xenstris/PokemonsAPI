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

    #3. czy "skiity" jest w odpowiedzi
    * match response.data.pokemon_v2_pokemonspecies[*].name contains "skitty"