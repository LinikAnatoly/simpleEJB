
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDocAttachmentServer;  	
  */

import java.io.Serializable;



public class ENDocAttachmentServer implements Serializable {


    public static final int PRIMARY_SERVER_CODE = 1;
    public static final int ARCHIVE_SERVER_CODE = 2;
    public static final int EXTERNAL_SERVER_CODE = 3;
    public static final int ARCHIVE_2_SERVER_CODE = 4;
	
    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  serverIp; 
    public String  userName; 
    public String  userPass; 
    public static final String tableName = "ENDOCATTACHMENTSERVER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDOCATTACHMENTSERVER.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENDOCATTACHMENTSERVER.NAME";
    public static final String serverIp_Attr = "serverIp";
    public static final String serverIp_Field = "SERVERIP";
    public static final String serverIp_QFielld = "ENDOCATTACHMENTSERVER.SERVERIP";
    public static final String userName_Attr = "userName";
    public static final String userName_Field = "USERNAME";
    public static final String userName_QFielld = "ENDOCATTACHMENTSERVER.USERNAME";
    public static final String userPass_Attr = "userPass";
    public static final String userPass_Field = "USERPASS";
    public static final String userPass_QFielld = "ENDOCATTACHMENTSERVER.USERPASS";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setServerIp(String aValue){
       serverIp = aValue;
    }

    public String getServerIp(){
       return serverIp;
    }


    public void setUserName(String aValue){
       userName = aValue;
    }

    public String getUserName(){
       return userName;
    }


    public void setUserPass(String aValue){
       userPass = aValue;
    }

    public String getUserPass(){
       return userPass;
    }
} // end of ENDocAttachmentServerValueObject

