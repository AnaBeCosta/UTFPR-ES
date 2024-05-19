package cch1.src.main.java.cch1.protype.comida;


public class ComidaMexicana implements Cloneable {
    private String nome;
    private String tamanho;

    public ComidaMexicana(String nome, String tamanho) {
        this.nome = nome;
        this.tamanho = tamanho;
    }

    // Método clone
    @Override
    public ComidaMexicana clone() {
        return new ComidaMexicana(this.nome, this.tamanho);
    }

    @Override
    public String toString() {
        return "ComidaMexicana{" +
                "nome='" + nome + '\'' +
                ", tamanho='" + tamanho + '\'' +
                '}';
    }
}