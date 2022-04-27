unit ENEstimateItemKindController;

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

  ENEstimateItemKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENEstimateItemKindFilter = class(TRemotable)
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


  ENEstimateItemKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENEstimateItemKindShort = array of ENEstimateItemKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItemKindController/message/
  // soapAction: http://ksoe.org/ENEstimateItemKindController/action/ENEstimateItemKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItemKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItemKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItemKindControllerSoapPort = interface(IInvokable)
  ['{299e299e-299e-299e-299e-299e299e299e}']
    function  add(const aENEstimateItemKind: ENEstimateItemKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItemKind: ENEstimateItemKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENEstimateItemKind; stdcall;
    function  getList: ENEstimateItemKindShortList; stdcall;
    function  getFilteredList(const aENEstimateItemKindFilter: ENEstimateItemKindFilter): ENEstimateItemKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemKindShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItemKindFilter: ENEstimateItemKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemKindShortList; stdcall;
  end; 


implementation

  
  
  destructor ENEstimateItemKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItemKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemKind');
  RemClassRegistry.RegisterXSClass(ENEstimateItemKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemKindRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItemKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemKindFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItemKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemKindShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItemKindControllerSoapPort), 'http://ksoe.org/ENEstimateItemKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItemKindControllerSoapPort), 'http://ksoe.org/ENEstimateItemKindController/action/ENEstimateItemKindController.%operationName%');


end.
