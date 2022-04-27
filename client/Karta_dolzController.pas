unit Karta_dolzController;

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
  // !:EPCalculatorShortList - "http://metasoft.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://metasoft.org/EnergyproControllerService/type/"

  Karta_dolz            = class;                 { "http://metasoft.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://metasoft.org/EnergyproControllerService/type/
  // ************************************************************************ //
  Karta_dolzRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://metasoft.org/EnergyproControllerService/type/
  // ************************************************************************ //
  Karta_dolz = class(TRemotable)
  private
    Fid : Integer; 
    Fname_dolz : WideString;
    Frazryad : WideString;
  published
    property  id : Integer read Fid write Fid; 
    property name_dolz : WideString read Fname_dolz write Fname_dolz;
    property razryad : WideString read Frazryad write Frazryad;
  end;

  Karta_dolzFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fid : Integer; 
    Fname_dolz : WideString;
    Frazryad : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  id : Integer read Fid write Fid; 
    property name_dolz : WideString read Fname_dolz write Fname_dolz;
    property razryad : WideString read Frazryad write Frazryad;
  end;


  Karta_dolzShort = class(TRemotable)
  private
    Fid : Integer; 
    Fname_dolz : WideString;
    Frazryad : WideString;
  published
    property  id : Integer read Fid write Fid; 
    property name_dolz : WideString read Fname_dolz write Fname_dolz;
    property razryad : WideString read Frazryad write Frazryad;

  end;

  ArrayOfKarta_dolzShort = array of Karta_dolzShort;  // { "http://metasoft.org/EnergyproControllerService/type/" }

  Karta_dolzShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfKarta_dolzShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfKarta_dolzShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://metasoft.org/Karta_dolzController/message/
  // soapAction: http://metasoft.org/Karta_dolzController/action/Karta_dolzController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : Karta_dolzControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : Karta_dolzController
  // URL       : http://soap.metasoft.com.ua/energypro
  // ************************************************************************ //


  Karta_dolzControllerSoapPort = interface(IInvokable)
  ['{27ca27ca-27ca-27ca-27ca-27ca27ca27ca}']
    function  add(const aKarta_dolz: Karta_dolz): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aKarta_dolz: Karta_dolz); stdcall;
    function  getObject(const anObjectCode: Integer): Karta_dolz; stdcall;
    function  getList: Karta_dolzShortList; stdcall;
    function  getFilteredList(const aKarta_dolzFilter: Karta_dolzFilter): Karta_dolzShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): Karta_dolzShortList; stdcall;
    function  getScrollableFilteredList(const aKarta_dolzFilter: Karta_dolzFilter; const aFromPosition: Integer; const aQuantity: Integer): Karta_dolzShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): Karta_dolzShortList; stdcall;
  end; 


implementation

  
  
  destructor Karta_dolzShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(Karta_dolz, 'http://metasoft.org/EnergyproControllerService/type/', 'Karta_dolz');
  RemClassRegistry.RegisterXSClass(Karta_dolzRef, 'http://metasoft.org/EnergyproControllerService/type/', 'Karta_dolzRef');
  RemClassRegistry.RegisterXSClass(Karta_dolzFilter, 'http://metasoft.org/EnergyproControllerService/type/', 'Karta_dolzFilter');
  RemClassRegistry.RegisterXSClass(Karta_dolzShort, 'http://metasoft.org/EnergyproControllerService/type/', 'Karta_dolzShort');
  RemClassRegistry.RegisterXSClass(Karta_dolzShortList, 'http://metasoft.org/EnergyproControllerService/type/', 'Karta_dolzShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfKarta_dolzShort), 'http://metasoft.org/EnergyproControllerService/type/', 'ArrayOfKarta_dolzShort');

  InvRegistry.RegisterInterface(TypeInfo(Karta_dolzControllerSoapPort), 'http://metasoft.org/Karta_dolzController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Karta_dolzControllerSoapPort), 'http://metasoft.org/Karta_dolzController/action/Karta_dolzController.%operationName%');


end.
