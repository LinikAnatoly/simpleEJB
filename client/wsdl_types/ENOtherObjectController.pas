unit ENOtherObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,ENOtherObjectTypeController 
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENOtherObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENOtherObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENOtherObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FbuildNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FtypeRef : ENOtherObjectTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property typeRef : ENOtherObjectTypeRef read FtypeRef write FtypeRef; 
  end;
  
{
  ENOtherObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FbuildNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FtypeRef : ENOtherObjectTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property typeRef : ENOtherObjectTypeRef read FtypeRef write FtypeRef; 
  end;
}

  ENOtherObjectFilter = class(ENOtherObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENOtherObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FbuildNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;	
    FelementCode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property elementCode : Integer read FelementCode write FelementCode; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfENOtherObjectShort = array of ENOtherObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENOtherObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENOtherObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENOtherObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENOtherObjectController/message/
  // soapAction: http://ksoe.org/ENOtherObjectController/action/ENOtherObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENOtherObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENOtherObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENOtherObjectControllerSoapPort = interface(IInvokable)
  ['{96e596e5-96e5-96e5-96e5-96e596e596e5}']
    function  add(const aENOtherObject: ENOtherObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENOtherObject: ENOtherObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENOtherObject; stdcall;
    function  getList: ENOtherObjectShortList; stdcall;
    function  getFilteredList(const aENOtherObjectFilter: ENOtherObjectFilter): ENOtherObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENOtherObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENOtherObjectFilter: ENOtherObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENOtherObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENOtherObjectShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENOtherObjectFilter: ENOtherObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENOtherObject.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENOtherObjectFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENOtherObjectFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENOtherObjectShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENOtherObjectShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENOtherObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOtherObject');
  RemClassRegistry.RegisterXSClass(ENOtherObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOtherObjectRef');
  RemClassRegistry.RegisterXSClass(ENOtherObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOtherObjectFilter');
  RemClassRegistry.RegisterXSClass(ENOtherObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOtherObjectShort');
  RemClassRegistry.RegisterXSClass(ENOtherObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOtherObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENOtherObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENOtherObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENOtherObjectControllerSoapPort), 'http://ksoe.org/ENOtherObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENOtherObjectControllerSoapPort), 'http://ksoe.org/ENOtherObjectController/action/ENOtherObjectController.%operationName%');


end.
