package ar.edu.unlp.oo1.ejercicio1.impl;

import ar.edu.unlp.oo1.ejercicio1.WallPost;

/**
 * Completar esta clase de acuerdo a lo especificado en el cuadernillo
 *
 */
public class WallPostImpl implements WallPost{

	private String text;
	private int likes;
	private boolean featured;
	
	
	/*
	* Permite construir una instancia del WallpostImpl.
	* Luego de la invocación, debe tener como texto: “Undefined post”,
	* no debe estar marcado como destacado y la cantidad de “Me gusta” deben ser 0.
	*/
	public WallPostImpl() {
		this.setText("undefined post");
		this.setFeatured(false);
		this.setLikes(0);
	}

	/**
	 * Retorna el texto descriptivo de la publicación
	 * 
	 * @return
	 */
	public String getText() {
		return this.text;
	}
	
	/**
	 * Setea el texto descriptivo de la publicación
	 * @param text
	 */
	public void setText(String text) {
		this.text = text;
	}
	
	/**
	 * Setea el texto descriptivo de la publicación y retorna la instancia de Wallpost
	 * 
	 * @param text
	 * @return
	 */
	public WallPost text(String text) {
		this.setText(text);
		return this;
	}

	/**
	 * Retorna la cantidad de “me gusta”
	 * 
	 * @return
	 */
	public int getLikes() {
		return this.likes;
	}
	
	/**
	 * Setea el número de “me gusta” de la publicación
	 * @param text
	 */
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	/**
	 * Incrementa la cantidad de likes en uno
	 */
	public WallPost like() {
		this.setLikes(this.getLikes() + 1);
		return this;
	}
	
	/**
	 * Decrementa la cantidad de likes en uno. Si ya es 0, no hace nada
	 */
	public WallPost dislike() {
		if(this.getLikes() > 0) {
			this.setLikes(this.getLikes() - 1);
		}
		return this;
	}
	
	/**
	 * Retorna true si el post está marcado como destacado, false en caso contrario
	 * 
	 * @return
	 */
	public boolean isFeatured() {
		return featured;
	}
	
	/**
	 * Setea el post destacado con el dato recibido por parámetro
	 * @param text
	 */
	public void setFeatured(boolean featured) {
		this.featured = featured;
	}
	
	/**
	 * Cambia el post del estado destacado a no destacado y viceversa
	 */
	public WallPost toggleFeatured() {
		this.setFeatured(!this.isFeatured());
		return this;
	}

	
	/*
	 * Este mensaje se utiliza para que una instancia de Wallpost se muestre de forma adecuada
	 */
    @Override
    public String toString() {
        return "WallPost {" +
            "text: " + getText() +
            ", likes: '" + getLikes() + "'" +
            ", featured: '" + isFeatured() + "'" +
            "}";
    }    

}
