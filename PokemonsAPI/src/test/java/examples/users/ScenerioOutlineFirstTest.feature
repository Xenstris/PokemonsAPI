Feature:2. (opcjonalnie) skrypt testowy sprawdzający "count" osobno dla "generation-i", "generation-ii", oraz "generation-iii" z wykorzystaniem Scenario Outline

  Background:
    * url 'https://beta.pokeapi.co/graphql/v1beta'
  Scenario Outline: given generation id query, validate count

    Given def query = read('<FileName>')
    And request { query: '#(query)' }
    And header Accept = 'application/json'
    When method post
    Then status 200

    * match response.data.pokemon_v2_pokemonspecies_aggregate.aggregate.count == <Count>


    Examples:
      | FileName          | Count |
      | QueryGen1.graphql | 151   |
      | QueryGen2.graphql | 100   |
      | QueryGen3.graphql | 135   |

