unit ENSchemeController;

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

  ENScheme            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSchemeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENScheme = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property elementRef : ENElementRef read FelementRef write FelementRef; 
  end;
  
{
  ENSchemeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property elementRef : ENElementRef read FelementRef write FelementRef; 
  end;
}

  ENSchemeFilter = class(ENScheme)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENSchemeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FelementRefCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode; 
  end;

  ArrayOfENSchemeShort = array of ENSchemeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSchemeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSchemeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSchemeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSchemeController/message/
  // soapAction: http://ksoe.org/ENSchemeController/action/ENSchemeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSchemeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSchemeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSchemeControllerSoapPort = interface(IInvokable)
  ['{1b5a1b5a-1b5a-1b5a-1b5a-1b5a1b5a1b5a}']
    function  add(const aENScheme: ENScheme): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENScheme: ENScheme); stdcall;
    function  getObject(const anObjectCode: Integer): ENScheme; stdcall;
    function  getList: ENSchemeShortList; stdcall;
    function  getFilteredList(const aENSchemeFilter: ENSchemeFilter): ENSchemeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSchemeShortList; stdcall;
    function  getScrollableFilteredList(const aENSchemeFilter: ENSchemeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSchemeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSchemeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENSchemeFilter: ENSchemeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENScheme.Destroy;
  begin
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENSchemeFilter.Destroy;
  begin
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENSchemeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor ENSchemeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENScheme, 'http://ksoe.org/EnergyproControllerService/type/', 'ENScheme');
  RemClassRegistry.RegisterXSClass(ENSchemeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeRef');
  RemClassRegistry.RegisterXSClass(ENSchemeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeFilter');
  RemClassRegistry.RegisterXSClass(ENSchemeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeShort');
  RemClassRegistry.RegisterXSClass(ENSchemeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSchemeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSchemeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSchemeControllerSoapPort), 'http://ksoe.org/ENSchemeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSchemeControllerSoapPort), 'http://ksoe.org/ENSchemeController/action/ENSchemeController.%operationName%');


end.
