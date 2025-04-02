package formula;

public class sumaFormula {

    public static long CalularSumaFormula(int numero) {
        if (numero<1){
            return 0;
        }

        long numeroLong = numero;
        return numeroLong * (numeroLong + 1) / 2;
    }
    
}
