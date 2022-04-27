unit RQBillTypeController;

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

  RQBillType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQBillTypeFilter = class(TRemotable)
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

  RQBillTypeFilter = class(RQBillType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQBillTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQBillTypeShort = array of RQBillTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillTypeController/message/
  // soapAction: http://ksoe.org/RQBillTypeController/action/RQBillTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillTypeControllerSoapPort = interface(IInvokable)
  ['{1a661a66-1a66-1a66-1a66-1a661a661a66}']
    function  add(const aRQBillType: RQBillType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillType: RQBillType); stdcall;
    function  getObject(const anObjectCode: Integer): RQBillType; stdcall;
    function  getList: RQBillTypeShortList; stdcall;
    function  getFilteredList(const aRQBillTypeFilter: RQBillTypeFilter): RQBillTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillTypeShortList; stdcall;
    function  getScrollableFilteredList(const aRQBillTypeFilter: RQBillTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQBillTypeFilter: RQBillTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor RQBillTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillType');
  RemClassRegistry.RegisterXSClass(RQBillTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillTypeRef');
  RemClassRegistry.RegisterXSClass(RQBillTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillTypeFilter');
  RemClassRegistry.RegisterXSClass(RQBillTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillTypeShort');
  RemClassRegistry.RegisterXSClass(RQBillTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillTypeControllerSoapPort), 'http://ksoe.org/RQBillTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillTypeControllerSoapPort), 'http://ksoe.org/RQBillTypeController/action/RQBillTypeController.%operationName%');


end.
