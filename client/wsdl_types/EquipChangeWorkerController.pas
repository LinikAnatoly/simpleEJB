unit EquipChangeWorkerController;

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

  EquipChangeWorker            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  EquipChangeWorkerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  EquipChangeWorker = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  EquipChangeWorkerFilter = class(TRemotable)
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

  EquipChangeWorkerFilter = class(EquipChangeWorker)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  EquipChangeWorkerShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfEquipChangeWorkerShort = array of EquipChangeWorkerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  EquipChangeWorkerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfEquipChangeWorkerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfEquipChangeWorkerShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EquipChangeWorkerController/message/
  // soapAction: http://ksoe.org/EquipChangeWorkerController/action/EquipChangeWorkerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : EquipChangeWorkerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : EquipChangeWorkerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  EquipChangeWorkerControllerSoapPort = interface(IInvokable)
  ['{10c310c3-10c3-10c3-10c3-10c310c310c3}']
    function  add(const aEquipChangeWorker: EquipChangeWorker): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aEquipChangeWorker: EquipChangeWorker); stdcall;
    function  getObject(const anObjectCode: Integer): EquipChangeWorker; stdcall;
    function  getList: EquipChangeWorkerShortList; stdcall;
    function  getFilteredList(const aEquipChangeWorkerFilter: EquipChangeWorkerFilter): EquipChangeWorkerShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): EquipChangeWorkerShortList; stdcall;
    function  getScrollableFilteredList(const aEquipChangeWorkerFilter: EquipChangeWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): EquipChangeWorkerShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): EquipChangeWorkerShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aEquipChangeWorkerFilter: EquipChangeWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor EquipChangeWorkerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(EquipChangeWorker, 'http://ksoe.org/EnergyproControllerService/type/', 'EquipChangeWorker');
  RemClassRegistry.RegisterXSClass(EquipChangeWorkerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'EquipChangeWorkerRef');
  RemClassRegistry.RegisterXSClass(EquipChangeWorkerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'EquipChangeWorkerFilter');
  RemClassRegistry.RegisterXSClass(EquipChangeWorkerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'EquipChangeWorkerShort');
  RemClassRegistry.RegisterXSClass(EquipChangeWorkerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'EquipChangeWorkerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfEquipChangeWorkerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfEquipChangeWorkerShort');

  InvRegistry.RegisterInterface(TypeInfo(EquipChangeWorkerControllerSoapPort), 'http://ksoe.org/EquipChangeWorkerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(EquipChangeWorkerControllerSoapPort), 'http://ksoe.org/EquipChangeWorkerController/action/EquipChangeWorkerController.%operationName%');


end.
