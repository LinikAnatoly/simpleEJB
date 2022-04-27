unit ENSITEquipStateController;

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

  ENSITEquipState            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITEquipStateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITEquipState = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENSITEquipStateFilter = class(TRemotable)
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


  ENSITEquipStateShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENSITEquipStateShort = array of ENSITEquipStateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSITEquipStateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSITEquipStateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSITEquipStateShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSITEquipStateController/message/
  // soapAction: http://ksoe.org/ENSITEquipStateController/action/ENSITEquipStateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSITEquipStateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSITEquipStateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSITEquipStateControllerSoapPort = interface(IInvokable)
  ['{174e174e-174e-174e-174e-174e174e174e}']
    function  add(const aENSITEquipState: ENSITEquipState): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSITEquipState: ENSITEquipState); stdcall;
    function  getObject(const anObjectCode: Integer): ENSITEquipState; stdcall;
    function  getList: ENSITEquipStateShortList; stdcall;
    function  getFilteredList(const aENSITEquipStateFilter: ENSITEquipStateFilter): ENSITEquipStateShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipStateShortList; stdcall;
    function  getScrollableFilteredList(const aENSITEquipStateFilter: ENSITEquipStateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipStateShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipStateShortList; stdcall;
  end; 


implementation

  
  
  destructor ENSITEquipStateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSITEquipState, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipState');
  RemClassRegistry.RegisterXSClass(ENSITEquipStateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipStateRef');
  RemClassRegistry.RegisterXSClass(ENSITEquipStateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipStateFilter');
  RemClassRegistry.RegisterXSClass(ENSITEquipStateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipStateShort');
  RemClassRegistry.RegisterXSClass(ENSITEquipStateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipStateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSITEquipStateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSITEquipStateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSITEquipStateControllerSoapPort), 'http://ksoe.org/ENSITEquipStateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSITEquipStateControllerSoapPort), 'http://ksoe.org/ENSITEquipStateController/action/ENSITEquipStateController.%operationName%');


end.
