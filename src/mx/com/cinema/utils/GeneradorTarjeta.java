package mx.com.cinema.utils;

public class GeneradorTarjeta {
	
	public long getNumTarjeta() {
		int count = 0;
        long array[] = new long [15];
        long aux;
        long number =0;
        String numempresa = "1";
       
        count = 0;
       	array = new long [15];
       
        number =  Long.parseLong(numeroTarjeta());
        aux = number;
        for (int i = 0; number != 0; i++) {
	        array[i] = number % 10;
	        number = number / 10;
	        count++;
        }
        if ((array[count - 1] == 4) || (array[count - 1] == 5) || (array[count - 1] == 3 && array[count - 2] == 7)){
            if(isValid(array) == true) {
                aux = Long.parseLong( numempresa +Long.toString(aux));
                System.out.println(aux);	
            } 
        } 
        
        return aux;
	}
	
	public static boolean isValid(long[] array) {
        int total = sumOfDoubleEvenPlace(array) + sumOfOddPlace(array);        
        if ((total % 10 == 0)) {
         for (int i=0; i< array.length; i++){
           }
            return true;
        } else {
          for (int i=0; i< array.length; i++){
            }
            return false;
        }
    }

    public static int getDigit(int number) {
        if (number <= 9) {
            return number;
        } else {
            int firstDigit = number % 10;
            int secondDigit = (int) (number / 10);
            return firstDigit + secondDigit;
        }
    }

    public static int sumOfOddPlace(long[] array) {
        int result = 0;
        for (int i=0; i< array.length; i++)
        {
        while (array[i] > 0) {
            result += (int) (array[i] % 10);
            array[i] = array[i] / 100;
         }}
      
        return result;
    }

    public static int sumOfDoubleEvenPlace(long[] array) {
        int result = 0;
        long temp = 0;
        for (int i=0; i< array.length; i++){
        while (array[i] > 0) {
             temp = array[i] % 100;
             result += getDigit((int) (temp / 10) * 2);
            array[i] = array[i] / 100;
           }
        }
        
        return result;
    }

    public static String numeroTarjeta(){
    	String numtarjeta="";
    	int numero = 0;
    	for(int i =0; i <= 14;i++ ) {
    	numero= (int)(Math.random()*9+1);
    	numtarjeta = numtarjeta + numero;
    	}
    	
    	return  numtarjeta;
    }
}
