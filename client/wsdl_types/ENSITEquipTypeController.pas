unit ENSITEquipTypeController;

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

  ENSITEquipType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITEquipTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITEquipType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
  end;

  ENSITEquipTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fdescription : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
  end;


  ENSITEquipTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;

  end;

  ArrayOfENSITEquipTypeShort = array of ENSITEquipTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSITEquipTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSITEquipTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSITEquipTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSITEquipTypeController/message/
  // soapAction: http://ksoe.org/ENSITEquipTypeController/action/ENSITEquipTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSITEquipTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSITEquipTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSITEquipTypeControllerSoapPort = interface(IInvokable)
  ['{162e162e-162e-162e-162e-162e162e162e}']
    function  add(const aENSITEquipType: ENSITEquipType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSITEquipType: ENSITEquipType); stdcall;
    function  getObject(const anObjectCode: Integer): ENSITEquipType; stdcall;
    function  getList: ENSITEquipTypeShortList; stdcall;
    function  getFilteredList(const aENSITEquipTypeFilter: ENSITEquipTypeFilter): ENSITEquipTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENSITEquipTypeFilter: ENSITEquipTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENSITEquipTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSITEquipType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipType');
  RemClassRegistry.RegisterXSClass(ENSITEquipTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipTypeRef');
  RemClassRegistry.RegisterXSClass(ENSITEquipTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSITEquipTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipTypeShort');
  RemClassRegistry.RegisterXSClass(ENSITEquipTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSITEquipTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSITEquipTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSITEquipTypeControllerSoapPort), 'http://ksoe.org/ENSITEquipTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSITEquipTypeControllerSoapPort), 'http://ksoe.org/ENSITEquipTypeController/action/ENSITEquipTypeController.%operationName%');


end.
