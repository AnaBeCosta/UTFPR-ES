package main;


public class Exer02 {
    
    private String nome;
    private double altura;
    private double peso;
        
   public Exer02(String nome, double altura, double peso){
       this.nome = nome;
       this.altura = altura;
       this.peso = peso;

    }
   
   public String getNome(){
       return nome;
    }
         
   public void setNome(String nome){
       this.nome = nome;
    }
         
   public double getAltura(){
       return altura;
   }
   
   public void setAltura(Double altura){
       this.altura = altura;
   }
        
   public double getPeso(){
      return peso;
   }
   
    public void setPeso(Double peso){
     this.peso = peso;
    }   
}

