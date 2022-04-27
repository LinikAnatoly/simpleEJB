unit KartiController;

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

  Karti            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  KartiRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  Karti = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FnumGen : WideString;
    FnormaRefCode : Integer;
    FobjectTypeRefCode : Integer;
    FdepartmentRefCode : Integer;
    FclassificationRefCode : Integer;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property numGen : WideString read FnumGen write FnumGen;
    property  normaRefCode : Integer read FnormaRefCode write FnormaRefCode;
    property  objectTypeRefCode : Integer read FobjectTypeRefCode write FobjectTypeRefCode;
    property  departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property  classificationRefCode : Integer read FclassificationRefCode write FclassificationRefCode;
  end;


  KartiFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FnumGen : WideString;
    FnormaRefCode : Integer;
    FobjectTypeRefCode : Integer;
    FdepartmentRefCode : Integer;
    FclassificationRefCode : Integer;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numGen : WideString read FnumGen write FnumGen;
    property  normaRefCode : Integer read FnormaRefCode write FnormaRefCode;
    property  objectTypeRefCode : Integer read FobjectTypeRefCode write FobjectTypeRefCode;
    property  departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property  classificationRefCode : Integer read FclassificationRefCode write FclassificationRefCode;
  end;


  KartiShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FnumGen : WideString;
    FnormaRefCode : Integer;
    FobjectTypeRefCode : Integer;
    FdepartmentRefCode : Integer;
    FclassificationRefCode : Integer;
    FnormaRefName : WideString;
    FobjectTypeRefName : WideString;
    FdepartmentRefName : WideString;
    FmeasurementUnit : WideString;
    Fmeter : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numGen : WideString read FnumGen write FnumGen;    
    property  normaRefCode : Integer read FnormaRefCode write FnormaRefCode;
    property  objectTypeRefCode : Integer read FobjectTypeRefCode write FobjectTypeRefCode;
    property  departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property  classificationRefCode : Integer read FclassificationRefCode write FclassificationRefCode;
    property normaRefName : WideString read FnormaRefName write FnormaRefName;
    property departmentRefName : WideString read FdepartmentRefName write FdepartmentRefName;
    property objectTypeRefName : WideString read FobjectTypeRefName write FobjectTypeRefName;
    property measurementUnit : WideString read FmeasurementUnit write FmeasurementUnit;
    property meter : WideString read Fmeter write Fmeter;
  end;

  ArrayOfKartiShort = array of KartiShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  KartiShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfKartiShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfKartiShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/KartiController/message/
  // soapAction: http://ksoe.org/KartiController/action/KartiController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : KartiControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : KartiController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  KartiControllerSoapPort = interface(IInvokable)
  ['{14441444-1444-1444-1444-144414441444}']
    function  add(const aKarti: Karti): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aKarti: Karti); stdcall;
    function  getObject(const anObjectCode: Integer): Karti; stdcall;
    function  getList: KartiShortList; stdcall;
    function  getFilteredList(const aKartiFilter: KartiFilter): KartiShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): KartiShortList; stdcall;
    function  getScrollableFilteredList(const aKartiFilter: KartiFilter; const aFromPosition: Integer; const aQuantity: Integer): KartiShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): KartiShortList; stdcall;
  end; 


implementation

  
  
  destructor KartiShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(Karti, 'http://ksoe.org/EnergyproControllerService/type/', 'Karti');
  RemClassRegistry.RegisterXSClass(KartiRef, 'http://ksoe.org/EnergyproControllerService/type/', 'KartiRef');
  RemClassRegistry.RegisterXSClass(KartiFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'KartiFilter');
  RemClassRegistry.RegisterXSClass(KartiShort, 'http://ksoe.org/EnergyproControllerService/type/', 'KartiShort');
  RemClassRegistry.RegisterXSClass(KartiShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'KartiShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfKartiShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfKartiShort');

  InvRegistry.RegisterInterface(TypeInfo(KartiControllerSoapPort), 'http://ksoe.org/KartiController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(KartiControllerSoapPort), 'http://ksoe.org/KartiController/action/KartiController.%operationName%');


end.
