unit ENServicesBillStatusController;

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

  ENServicesBillStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesBillStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesBillStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENServicesBillStatusFilter = class(TRemotable)
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

  ENServicesBillStatusFilter = class(ENServicesBillStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesBillStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesBillStatusShort = array of ENServicesBillStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesBillStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesBillStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesBillStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesBillStatusController/message/
  // soapAction: http://ksoe.org/ENServicesBillStatusController/action/ENServicesBillStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesBillStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesBillStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesBillStatusControllerSoapPort = interface(IInvokable)
  ['{39053905-3905-3905-3905-390539053905}']
    function  add(const aENServicesBillStatus: ENServicesBillStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesBillStatus: ENServicesBillStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesBillStatus; stdcall;
    function  getList: ENServicesBillStatusShortList; stdcall;
    function  getFilteredList(const aENServicesBillStatusFilter: ENServicesBillStatusFilter): ENServicesBillStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesBillStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesBillStatusFilter: ENServicesBillStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesBillStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesBillStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesBillStatusFilter: ENServicesBillStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENServicesBillStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesBillStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesBillStatus');
  RemClassRegistry.RegisterXSClass(ENServicesBillStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesBillStatusRef');
  RemClassRegistry.RegisterXSClass(ENServicesBillStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesBillStatusFilter');
  RemClassRegistry.RegisterXSClass(ENServicesBillStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesBillStatusShort');
  RemClassRegistry.RegisterXSClass(ENServicesBillStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesBillStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesBillStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesBillStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesBillStatusControllerSoapPort), 'http://ksoe.org/ENServicesBillStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesBillStatusControllerSoapPort), 'http://ksoe.org/ENServicesBillStatusController/action/ENServicesBillStatusController.%operationName%');


end.
