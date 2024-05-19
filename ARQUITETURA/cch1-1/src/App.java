import ComidaMexicana.ComidaMexicanaBuilder;

public class App {
    public static void main(String[] args) {
        var comidaMexicana = new ComidaMexicanaBuilder()
            .nome("Taco")
            .sabor("Frango")
            .tamanho(2)
            .valor(5)
            .promocao(true)
            .build();

        System.out.println(comidaMexicana);
    }
}
