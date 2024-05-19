import ComidaMexicana.ComidaMexicanaBuilder;

public class App {
    public static void main(String[] args) {
        var comidaMexicana = new ComidaMexicanaBuilder()
            .nome("Taco")
            .sabor("Frango")
            .promocao(true)
            .build();

        ComidaMexicanaBuilder.retirarPromocao(comidaMexicana);

        System.out.println(comidaMexicana);
    }
}
