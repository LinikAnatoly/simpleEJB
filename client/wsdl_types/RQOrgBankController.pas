unit RQOrgBankController;

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

  RQOrgBank            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgBankRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgBank = class(TRemotable)
  private
    Fcode : Integer; 
    Fid : Integer; 
    Fmfo : WideString;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property  id : Integer read Fid write Fid; 
    property mfo : WideString read Fmfo write Fmfo;
    property name : WideString read Fname write Fname;
  end;

  RQOrgBankFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fid : Integer; 
    Fmfo : WideString;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  id : Integer read Fid write Fid; 
    property mfo : WideString read Fmfo write Fmfo;
    property name : WideString read Fname write Fname;
  end;


  RQOrgBankShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fid : Integer; 
    Fmfo : WideString;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property  id : Integer read Fid write Fid; 
    property mfo : WideString read Fmfo write Fmfo;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrgBankShort = array of RQOrgBankShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrgBankShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrgBankShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrgBankShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrgBankController/message/
  // soapAction: http://ksoe.org/RQOrgBankController/action/RQOrgBankController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrgBankControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrgBankController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrgBankControllerSoapPort = interface(IInvokable)
  ['{AFA3F81C-8DB2-4D39-9233-6F077C86CC76}']
    function  add(const aRQOrgBank: RQOrgBank): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrgBank: RQOrgBank); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrgBank; stdcall;
    function  getList: RQOrgBankShortList; stdcall;
    function  getFilteredList(const aRQOrgBankFilter: RQOrgBankFilter): RQOrgBankShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrgBankShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrgBankFilter: RQOrgBankFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrgBankShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrgBankShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrgBankShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrgBank, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgBank');
  RemClassRegistry.RegisterXSClass(RQOrgBankRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgBankRef');
  RemClassRegistry.RegisterXSClass(RQOrgBankFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgBankFilter');
  RemClassRegistry.RegisterXSClass(RQOrgBankShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgBankShort');
  RemClassRegistry.RegisterXSClass(RQOrgBankShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgBankShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrgBankShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrgBankShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrgBankControllerSoapPort), 'http://ksoe.org/RQOrgBankController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrgBankControllerSoapPort), 'http://ksoe.org/RQOrgBankController/action/RQOrgBankController.%operationName%');


end.
