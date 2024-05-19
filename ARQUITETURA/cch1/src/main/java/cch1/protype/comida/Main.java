package cch1.src.main.java.cch1.protype.comida;

public class Main {
    public static void main(String[] args) {
        // Criando um pedido de Taco
        ComidaMexicana tacoOriginal = new ComidaMexicana("Taco", "Grande");

        // Clonando o pedido de Taco
        ComidaMexicana tacoClone = tacoOriginal.clone();

        System.out.println(tacoOriginal); // Saída: ComidaMexicana{nome='Taco', tamanho='Grande'}
        System.out.println(tacoClone);    // Saída: ComidaMexicana{nome='Taco', tamanho='Grande'}
    }
}