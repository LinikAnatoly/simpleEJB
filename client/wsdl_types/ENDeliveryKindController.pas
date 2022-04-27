unit ENDeliveryKindController;

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

  ENDeliveryKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENDeliveryKindFilter = class(TRemotable)
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


  ENDeliveryKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDeliveryKindShort = array of ENDeliveryKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDeliveryKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDeliveryKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDeliveryKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDeliveryKindController/message/
  // soapAction: http://ksoe.org/ENDeliveryKindController/action/ENDeliveryKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDeliveryKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDeliveryKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDeliveryKindControllerSoapPort = interface(IInvokable)
  ['{13201320-1320-1320-1320-132013201320}']
    function  add(const aENDeliveryKind: ENDeliveryKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDeliveryKind: ENDeliveryKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENDeliveryKind; stdcall;
    function  getList: ENDeliveryKindShortList; stdcall;
    function  getFilteredList(const aENDeliveryKindFilter: ENDeliveryKindFilter): ENDeliveryKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryKindShortList; stdcall;
    function  getScrollableFilteredList(const aENDeliveryKindFilter: ENDeliveryKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryKindShortList; stdcall;
  end; 


implementation

  
  
  destructor ENDeliveryKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDeliveryKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryKind');
  RemClassRegistry.RegisterXSClass(ENDeliveryKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryKindRef');
  RemClassRegistry.RegisterXSClass(ENDeliveryKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryKindFilter');
  RemClassRegistry.RegisterXSClass(ENDeliveryKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryKindShort');
  RemClassRegistry.RegisterXSClass(ENDeliveryKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDeliveryKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDeliveryKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDeliveryKindControllerSoapPort), 'http://ksoe.org/ENDeliveryKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDeliveryKindControllerSoapPort), 'http://ksoe.org/ENDeliveryKindController/action/ENDeliveryKindController.%operationName%');


end.
