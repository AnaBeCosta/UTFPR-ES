package ComidaMexicana;

public class ComidaMexicana {
    private String nome;
    private String sabor;
    private int tamanho;
    private int valor;
    private Boolean promocao; 

    protected  ComidaMexicana(){
    }

    public static ComidaMexicana builder(){
        return  new ComidaMexicana();
    }

    public void setNome (String nome){
        this.nome = nome;
    }

    public void setSabor (String sabor){
        this.sabor = sabor;
    }

    public void setTamanho (int tamanho){
        this.tamanho = tamanho;
    }

    public void setValor (int valor){
        this.valor = valor;
    }

    public void setPromocao (Boolean promocao){
        this.promocao = promocao;
    }

    public String toString(){
        return "Comida Mexicana{" + "Nome='" + nome + '\'' + ", sabor='" + sabor + '\'' + '}';
    }
}

