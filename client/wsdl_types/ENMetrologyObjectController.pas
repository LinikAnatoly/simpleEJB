unit ENMetrologyObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
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

  ENMetrologyObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    Fis3phase : Integer; 
    FisElectron : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  is3phase : Integer read Fis3phase write Fis3phase; 
    property  isElectron : Integer read FisElectron write FisElectron; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
  end;
  
{
  ENMetrologyObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    Fis3phase : Integer; 
    FisElectron : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  is3phase : Integer read Fis3phase write Fis3phase; 
    property  isElectron : Integer read FisElectron write FisElectron; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
  end;
}

  ENMetrologyObjectFilter = class(ENMetrologyObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMetrologyObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fis3phase : Integer; 
    FisElectron : Integer; 
    FelementCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  is3phase : Integer read Fis3phase write Fis3phase; 
    property  isElectron : Integer read FisElectron write FisElectron; 

    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENMetrologyObjectShort = array of ENMetrologyObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMetrologyObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMetrologyObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMetrologyObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMetrologyObjectController/message/
  // soapAction: http://ksoe.org/ENMetrologyObjectController/action/ENMetrologyObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMetrologyObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMetrologyObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMetrologyObjectControllerSoapPort = interface(IInvokable)
  ['{d63ed63e-d63e-d63e-d63e-d63ed63ed63e}']
    function  add(const aENMetrologyObject: ENMetrologyObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMetrologyObject: ENMetrologyObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENMetrologyObject; stdcall;
    function  getList: ENMetrologyObjectShortList; stdcall;
    function  getFilteredList(const aENMetrologyObjectFilter: ENMetrologyObjectFilter): ENMetrologyObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENMetrologyObjectFilter: ENMetrologyObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyObjectShortList; stdcall;
  end; 


implementation

  destructor ENMetrologyObject.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{  
  destructor ENMetrologyObjectFilter.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
}

  destructor ENMetrologyObjectFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor ENMetrologyObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMetrologyObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyObject');
  RemClassRegistry.RegisterXSClass(ENMetrologyObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyObjectRef');
  RemClassRegistry.RegisterXSClass(ENMetrologyObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyObjectFilter');
  RemClassRegistry.RegisterXSClass(ENMetrologyObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyObjectShort');
  RemClassRegistry.RegisterXSClass(ENMetrologyObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMetrologyObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMetrologyObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMetrologyObjectControllerSoapPort), 'http://ksoe.org/ENMetrologyObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMetrologyObjectControllerSoapPort), 'http://ksoe.org/ENMetrologyObjectController/action/ENMetrologyObjectController.%operationName%');


end.
