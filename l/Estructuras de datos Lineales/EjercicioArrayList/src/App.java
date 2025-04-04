import java.util.ArrayList;
import java.util.Iterator;

public class App {
    public static void main(String[] args) throws Exception {

        ArrayList<Integer> elementos = new ArrayList<>();

        for (int i = 1; i < 7; i++) {
            elementos.add(i*10);
        }

        System.out.print("a) Adicionar 6 datos e imprimir la lista: ");

        for (int i = 0; i < elementos.size(); i++) {
            if(elementos.get(i) < 60){
                System.out.print(elementos.get(i) + ", ");
            }else{
                System.out.print("60.\n");
            }
        }

        System.out.print("b) Adicione 2 valores: en la posición 1 (1000) y en la posición 3 (2000) e imprima de nuevo: ");
        elementos.set(1, 1000);
        elementos.set(3, 3000);

        for (int i = 0; i < elementos.size(); i++) {
            if(elementos.get(i) != 60){
                System.out.print(elementos.get(i) + ", ");
            }else{
                System.out.print(elementos.get(i)+ ".\n");
            }
        }

        System.out.print("c) Reemplace 2 valores usando set en la posición 0 (5000) y en la posición 2(10000) e imprima: ");
        elementos.set(0, 5000);
        elementos.set(2, 10000);

        Iterator it = elementos.iterator();
        
        while (it.hasNext()) {
            
            if (!elementos.contains(60)) {
            
                System.out.print(it.next()+ ".\n");
            }else{
                System.out.print(it.next() + ", ");
            }
        }


    }
}
