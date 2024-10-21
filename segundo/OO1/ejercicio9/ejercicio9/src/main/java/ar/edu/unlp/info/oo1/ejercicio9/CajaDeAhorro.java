package ar.edu.unlp.info.oo1.ejercicio9;

public class CajaDeAhorro extends Cuenta{
	
	public double costoAdicional(double monto) {
		return monto * 0.02;
	}
	
	public boolean puedeExtraer(double monto) {
		if(this.getSaldo() >= (monto + this.costoAdicional(monto))) {
			return true;
		}
		return false;
	};
	
	@Override
	public void depositar(double monto) {
		monto -= this.costoAdicional(monto);
		this.setSaldo(this.getSaldo() + monto);
	}
	
	@Override
	protected void extraerSinControlar(double monto) {
		monto += this.costoAdicional(monto);
		this.setSaldo(this.getSaldo() - monto);
	}
}
