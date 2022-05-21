package main;


public class Exer03 {
    
        String descricaoEntrada;
        double valorEntrada;
        int tipoEntrada;
        double saldo = 0;
        
    void processarLancamento(Lancamento lanc1) {
        //le
        descricaoEntrada = lanc1.getDescricao();
        valorEntrada = lanc1.getValor();
        tipoEntrada = lanc1.getTipo();     
        
        if(tipoEntrada == 1){
           
            this.saldo = this.saldo + valorEntrada;
            System.out.printf("Lançamento: Receber - %s - %.2f\n", descricaoEntrada, valorEntrada);
            
        } else {
            
            this.saldo = this.saldo - valorEntrada;
            System.out.printf("Lançamento: Pagar - %s - %.2f\n", descricaoEntrada, valorEntrada);
        }
    
    }

    void printSaldo(){
         System.out.printf("Saldo = %.2f", this.saldo);
    }
  
}