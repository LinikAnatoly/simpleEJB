unit ENHighVoltageSellTypeController;

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

  ENHighVoltageSellType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltageSellTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltageSellType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENHighVoltageSellTypeFilter = class(TRemotable)
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

  ENHighVoltageSellTypeFilter = class(ENHighVoltageSellType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENHighVoltageSellTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENHighVoltageSellTypeShort = array of ENHighVoltageSellTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHighVoltageSellTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHighVoltageSellTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHighVoltageSellTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHighVoltageSellTypeController/message/
  // soapAction: http://ksoe.org/ENHighVoltageSellTypeController/action/ENHighVoltageSellTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHighVoltageSellTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHighVoltageSellTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHighVoltageSellTypeControllerSoapPort = interface(IInvokable)
  ['{1cfa1cfa-1cfa-1cfa-1cfa-1cfa1cfa1cfa}']
  //['{4a774a77-4a77-4a77-4a77-4a774a774a77}']
    function  add(const aENHighVoltageSellType: ENHighVoltageSellType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHighVoltageSellType: ENHighVoltageSellType); stdcall;
    function  getObject(const anObjectCode: Integer): ENHighVoltageSellType; stdcall;
    function  getList: ENHighVoltageSellTypeShortList; stdcall;
    function  getFilteredList(const aENHighVoltageSellTypeFilter: ENHighVoltageSellTypeFilter): ENHighVoltageSellTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltageSellTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENHighVoltageSellTypeFilter: ENHighVoltageSellTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltageSellTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltageSellTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENHighVoltageSellTypeFilter: ENHighVoltageSellTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENHighVoltageSellTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHighVoltageSellType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellType');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellTypeRef');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellTypeFilter');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellTypeShort');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHighVoltageSellTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHighVoltageSellTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHighVoltageSellTypeControllerSoapPort), 'http://ksoe.org/ENHighVoltageSellTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHighVoltageSellTypeControllerSoapPort), 'http://ksoe.org/ENHighVoltageSellTypeController/action/ENHighVoltageSellTypeController.%operationName%');


end.
