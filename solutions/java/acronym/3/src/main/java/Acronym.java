import java.util.stream.Stream;
import java.util.stream.Collectors;

class Acronym {

    String acronym;

    Acronym(String phrase) {
        acronym =  Stream.of(phrase.split("[\s_-]+"))
            .map(w -> w.charAt(0))
            .map(Object::toString)
            .collect(Collectors.joining())
            .toUpperCase();
    }

    String get() {
        return acronym;
    }

}
