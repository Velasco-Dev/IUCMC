package Venta;

public class CalculoConIVA implements CalculoTotalStrategy {
    /**
     * Esta clase implementa la estrategia de cálculo de total con IVA.
     * El IVA es del 19% sobre el subtotal.
     */

    @Override
    public double calcularTotal(double subtotal) {
        return subtotal * 1.19;
    }

}
