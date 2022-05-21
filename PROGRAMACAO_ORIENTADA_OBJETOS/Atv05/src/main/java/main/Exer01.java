package main;


public class Exer01{ 
    String nome = "Aluno";
    int idade = 18;
    char genero = 'M';
    long ra = 123456789;
    
    public Exer01() {

    }
    
     public Exer01(String n, int i, char c, long r) {
         this.nome = n;
         this.idade = i;
         this.genero = c;
         this.ra = r;
    }
    
      public Exer01(String n, int i) {
         this.nome = n;
         this.idade = i;
    }
     
     public Exer01(String n, char c, long r) {
         this.nome = n;
         this.genero = c;
         this.ra = r;
    }
   

    void print() {
        System.out.print(this.nome+ " - ");
        System.out.print(this.idade + " - ");
        System.out.print(this.genero + " - ");
        System.out.print(this.ra);
    }
}




