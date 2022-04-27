package  com.ksoe.energynet.valueobject.brief;



import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class BufetOrderShort implements Serializable {

    public String  numberDoc;
    public Date dateGen ;
    public BigDecimal  sum;


    public void setNumberDoc(String aValue){
       numberDoc = aValue;
    }

    public String getNumberDoc(){
       return numberDoc;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setSum(BigDecimal aValue){
       sum = aValue;
    }

    public BigDecimal getSum(){
       return sum;
    }


} 

