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


    #2. czy typy dla "name" oraz "id" są zgodne z oczekiwanymi (walidacja schemy)
    * def schema =
    """
    {
      "id": #number,
      "name": #string
    }
    """
    * match response.data.pokemon_v2_pokemonspecies[0] == schema