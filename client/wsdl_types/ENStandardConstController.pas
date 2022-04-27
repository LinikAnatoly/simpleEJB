unit ENStandardConstController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENStandardConst            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandardConstRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandardConst = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENStandardConstFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
}

  ENStandardConstFilter = class(ENStandardConst)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENStandardConstShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FentryCode : Integer;
    FentryValue : TXSDecimal;
    FentryStartDate : TXSDate;
    FentryEndDate : TXSDate;
    
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property entryCode : Integer read FentryCode write FentryCode;
    property entryValue : TXSDecimal read FentryValue write FentryValue; 
    property entryStartDate : TXSDate read FentryStartDate write FentryStartDate;
    property entryEndDate : TXSDate read FentryEndDate write FentryEndDate;

  end;

  ArrayOfENStandardConstShort = array of ENStandardConstShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENStandardConstShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENStandardConstShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENStandardConstShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENStandardConstController/message/
  // soapAction: http://ksoe.org/ENStandardConstController/action/ENStandardConstController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENStandardConstControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENStandardConstController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENStandardConstControllerSoapPort = interface(IInvokable)
  ['{1fb31fb3-1fb3-1fb3-1fb3-1fb31fb31fb3}']
    function  add(const aENStandardConst: ENStandardConst): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENStandardConst: ENStandardConst); stdcall;
    function  getObject(const anObjectCode: Integer): ENStandardConst; stdcall;
    function  getList: ENStandardConstShortList; stdcall;
    function  getFilteredList(const aENStandardConstFilter: ENStandardConstFilter): ENStandardConstShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENStandardConstShortList; stdcall;
    function  getScrollableFilteredList(const aENStandardConstFilter: ENStandardConstFilter; const aFromPosition: Integer; const aQuantity: Integer): ENStandardConstShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENStandardConstShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENStandardConstFilter: ENStandardConstFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENStandardConstShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENStandardConst, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConst');
  RemClassRegistry.RegisterXSClass(ENStandardConstRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstRef');
  RemClassRegistry.RegisterXSClass(ENStandardConstFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstFilter');
  RemClassRegistry.RegisterXSClass(ENStandardConstShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstShort');
  RemClassRegistry.RegisterXSClass(ENStandardConstShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENStandardConstShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENStandardConstShort');

  InvRegistry.RegisterInterface(TypeInfo(ENStandardConstControllerSoapPort), 'http://ksoe.org/ENStandardConstController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENStandardConstControllerSoapPort), 'http://ksoe.org/ENStandardConstController/action/ENStandardConstController.%operationName%');


end.
