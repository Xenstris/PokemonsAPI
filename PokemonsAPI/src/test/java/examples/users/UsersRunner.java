package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate Array() {
        return Karate.run("ArrayNotEmpty").relativeTo(getClass());
    }

    @Karate.Test
    Karate SchemaValidation() {
        return Karate.run("SchemaValidation").relativeTo(getClass());
    }
    @Karate.Test
    Karate Contains() {
        return Karate.run("ContainsPokemon").relativeTo(getClass());
    }

    @Karate.Test
    Karate NotContains() {
        return Karate.run("NotContainsPokemon").relativeTo(getClass());
    }

}
