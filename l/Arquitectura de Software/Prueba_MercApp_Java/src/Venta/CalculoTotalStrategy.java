package Venta;

public interface CalculoTotalStrategy {

    //metodo para calcular el total de la venta
    /**
     * Este método calcula el total de la venta.
     * @param subtotal El subtotal de la venta.
     * @return El total de la venta.
     */
    double calcularTotal(double subtotal);

}
