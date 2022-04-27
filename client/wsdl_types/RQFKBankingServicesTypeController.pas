unit RQFKBankingServicesTypeController;

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

  RQFKBankingServicesType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKBankingServicesTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKBankingServicesType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQFKBankingServicesTypeFilter = class(TRemotable)
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

  RQFKBankingServicesTypeFilter = class(RQFKBankingServicesType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKBankingServicesTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQFKBankingServicesTypeShort = array of RQFKBankingServicesTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKBankingServicesTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKBankingServicesTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKBankingServicesTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKBankingServicesTypeController/message/
  // soapAction: http://ksoe.org/RQFKBankingServicesTypeController/action/RQFKBankingServicesTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKBankingServicesTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKBankingServicesTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKBankingServicesTypeControllerSoapPort = interface(IInvokable)
  ['{1af01af0-1af0-1af0-1af0-1af01af01af0}']
    function  add(const aRQFKBankingServicesType: RQFKBankingServicesType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKBankingServicesType: RQFKBankingServicesType); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKBankingServicesType; stdcall;
    function  getList: RQFKBankingServicesTypeShortList; stdcall;
    function  getFilteredList(const aRQFKBankingServicesTypeFilter: RQFKBankingServicesTypeFilter): RQFKBankingServicesTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKBankingServicesTypeShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKBankingServicesTypeFilter: RQFKBankingServicesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKBankingServicesTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKBankingServicesTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKBankingServicesTypeFilter: RQFKBankingServicesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor RQFKBankingServicesTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKBankingServicesType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBankingServicesType');
  RemClassRegistry.RegisterXSClass(RQFKBankingServicesTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBankingServicesTypeRef');
  RemClassRegistry.RegisterXSClass(RQFKBankingServicesTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBankingServicesTypeFilter');
  RemClassRegistry.RegisterXSClass(RQFKBankingServicesTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBankingServicesTypeShort');
  RemClassRegistry.RegisterXSClass(RQFKBankingServicesTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBankingServicesTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKBankingServicesTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKBankingServicesTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKBankingServicesTypeControllerSoapPort), 'http://ksoe.org/RQFKBankingServicesTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKBankingServicesTypeControllerSoapPort), 'http://ksoe.org/RQFKBankingServicesTypeController/action/RQFKBankingServicesTypeController.%operationName%');


end.
