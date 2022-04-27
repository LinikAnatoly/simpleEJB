unit RQFKOrderKindController;

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

  RQFKOrderKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtxtGen : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;
  end;

  RQFKOrderKindFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FtxtGen : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;
  end;


  RQFKOrderKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtxtGen : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;

  end;

  ArrayOfRQFKOrderKindShort = array of RQFKOrderKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderKindController/message/
  // soapAction: http://ksoe.org/RQFKOrderKindController/action/RQFKOrderKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderKindControllerSoapPort = interface(IInvokable)
  ['{1daf1daf-1daf-1daf-1daf-1daf1daf1daf}']
    function  add(const aRQFKOrderKind: RQFKOrderKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderKind: RQFKOrderKind); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderKind; stdcall;
    function  getList: RQFKOrderKindShortList; stdcall;
    function  getFilteredList(const aRQFKOrderKindFilter: RQFKOrderKindFilter): RQFKOrderKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderKindShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderKindFilter: RQFKOrderKindFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderKindShortList; stdcall;
  end; 


implementation

  
  
  destructor RQFKOrderKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderKind, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderKind');
  RemClassRegistry.RegisterXSClass(RQFKOrderKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderKindRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderKindFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderKindShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderKindShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderKindControllerSoapPort), 'http://ksoe.org/RQFKOrderKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderKindControllerSoapPort), 'http://ksoe.org/RQFKOrderKindController/action/RQFKOrderKindController.%operationName%');


end.
