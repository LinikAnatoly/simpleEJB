unit Spr_matherialController;

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

  Spr_matherial            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  Spr_matherialRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  Spr_matherial = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  Spr_matherialFilter = class(TRemotable)
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


  Spr_matherialShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
  end;

  ArrayOfSpr_matherialShort = array of Spr_matherialShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  Spr_matherialShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSpr_matherialShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSpr_matherialShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/Spr_matherialController/message/
  // soapAction: http://ksoe.org/Spr_matherialController/action/Spr_matherialController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : Spr_matherialControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : Spr_matherialController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  Spr_matherialControllerSoapPort = interface(IInvokable)
  ['{dd77dd77-dd77-dd77-dd77-dd77dd77dd77}']
    function  add(const aSpr_matherial: Spr_matherial): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSpr_matherial: Spr_matherial); stdcall;
    function  getObject(const anObjectCode: Integer): Spr_matherial; stdcall;
    function  getList: Spr_matherialShortList; stdcall;
    function  getFilteredList(const aSpr_matherialFilter: Spr_matherialFilter): Spr_matherialShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): Spr_matherialShortList; stdcall;
    function  getScrollableFilteredList(const aSpr_matherialFilter: Spr_matherialFilter; const aFromPosition: Integer; const aQuantity: Integer): Spr_matherialShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): Spr_matherialShortList; stdcall;
  end; 


implementation

  
  
  destructor Spr_matherialShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(Spr_matherial, 'http://ksoe.org/EnergyproControllerService/type/', 'Spr_matherial');
  RemClassRegistry.RegisterXSClass(Spr_matherialRef, 'http://ksoe.org/EnergyproControllerService/type/', 'Spr_matherialRef');
  RemClassRegistry.RegisterXSClass(Spr_matherialFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'Spr_matherialFilter');
  RemClassRegistry.RegisterXSClass(Spr_matherialShort, 'http://ksoe.org/EnergyproControllerService/type/', 'Spr_matherialShort');
  RemClassRegistry.RegisterXSClass(Spr_matherialShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'Spr_matherialShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSpr_matherialShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSpr_matherialShort');

  InvRegistry.RegisterInterface(TypeInfo(Spr_matherialControllerSoapPort), 'http://ksoe.org/Spr_matherialController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Spr_matherialControllerSoapPort), 'http://ksoe.org/Spr_matherialController/action/Spr_matherialController.%operationName%');


end.
