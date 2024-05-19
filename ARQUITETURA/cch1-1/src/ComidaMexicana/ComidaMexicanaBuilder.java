package ComidaMexicana;

public class ComidaMexicanaBuilder {
    private ComidaMexicana comidaMexicana;

    public ComidaMexicanaBuilder(){
        this.comidaMexicana = new ComidaMexicana();
    }

    public ComidaMexicanaBuilder nome(String nome){
        this.comidaMexicana.setNome(nome);
        return this;
    }

    public ComidaMexicanaBuilder sabor(String sabor){
        this.comidaMexicana.setSabor(sabor);
        return this;
    }

    public ComidaMexicanaBuilder tamanho(int tamanho){
        this.comidaMexicana.setTamanho(tamanho);
        return this;
    }

    public ComidaMexicanaBuilder valor(int valor){
        this.comidaMexicana.setValor(valor);
        return this;
    }
    
    public ComidaMexicanaBuilder promocao(Boolean promocao){
        this.comidaMexicana.setPromocao(promocao);
        return this;
    }

    public ComidaMexicana build(){
        return this.comidaMexicana;
    }
}
