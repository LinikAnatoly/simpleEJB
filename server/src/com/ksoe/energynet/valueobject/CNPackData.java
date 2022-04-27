package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.util.Date;

public class CNPackData implements Serializable
{
   public String name = null;
   public int renCode = Integer.MIN_VALUE;  
   public int senderCode = Integer.MIN_VALUE;
   public Date datePack = null;
   public int startState = Integer.MIN_VALUE;
   public String commentGen = null;
   public int userCode = 1005;
   public int docType = Integer.MIN_VALUE;
   public String numberDoc = null;
   public String nameAttach = null;
   public String fileName = null;
   public String docName = null;
   
   
   public int enRenCode = Integer.MIN_VALUE;
   public String enRenName = null;
}
