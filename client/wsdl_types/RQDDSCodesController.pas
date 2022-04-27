unit RQDDSCodesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   //,RQDDSCodesController 
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

  RQDDSCodes            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQDDSCodesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQDDSCodes = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FtxtCode : WideString;
    FisInvest : Integer; 
    FisActual : Integer; 
//???
    FparentDDSCodesRef : RQDDSCodesRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property txtCode : WideString read FtxtCode write FtxtCode;
    property  isInvest : Integer read FisInvest write FisInvest; 
    property  isActual : Integer read FisActual write FisActual; 
    property parentDDSCodesRef : RQDDSCodesRef read FparentDDSCodesRef write FparentDDSCodesRef; 
  end;

  RQDDSCodesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FtxtCode : WideString;
    FisInvest : Integer; 
    FisActual : Integer; 
//???
    FparentDDSCodesRef : RQDDSCodesRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property txtCode : WideString read FtxtCode write FtxtCode;
    property  isInvest : Integer read FisInvest write FisInvest; 
    property  isActual : Integer read FisActual write FisActual; 
    property parentDDSCodesRef : RQDDSCodesRef read FparentDDSCodesRef write FparentDDSCodesRef; 
  end;


  RQDDSCodesShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtxtCode : WideString;
    FisInvest : Integer; 
    FisActual : Integer; 
    FparentDDSCodesRefCode : Integer; 
    FparentDDSCodesRefName : WideString;
    FparentDDSCodesRefTxtCode : WideString;
    FparentDDSCodesRefIsInvest : Integer; 
    FparentDDSCodesRefIsActual : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property txtCode : WideString read FtxtCode write FtxtCode;
    property  isInvest : Integer read FisInvest write FisInvest; 
    property  isActual : Integer read FisActual write FisActual; 

    property parentDDSCodesRefCode : Integer read FparentDDSCodesRefCode write FparentDDSCodesRefCode; 
    property parentDDSCodesRefName : WideString read FparentDDSCodesRefName write FparentDDSCodesRefName; 
    property parentDDSCodesRefTxtCode : WideString read FparentDDSCodesRefTxtCode write FparentDDSCodesRefTxtCode; 
    property parentDDSCodesRefIsInvest : Integer read FparentDDSCodesRefIsInvest write FparentDDSCodesRefIsInvest; 
    property parentDDSCodesRefIsActual : Integer read FparentDDSCodesRefIsActual write FparentDDSCodesRefIsActual; 
  end;

  ArrayOfRQDDSCodesShort = array of RQDDSCodesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQDDSCodesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQDDSCodesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQDDSCodesShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQDDSCodesController/message/
  // soapAction: http://ksoe.org/RQDDSCodesController/action/RQDDSCodesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQDDSCodesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQDDSCodesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQDDSCodesControllerSoapPort = interface(IInvokable)
  ['{7db77db7-7db7-7db7-7db7-7db77db77db7}']
    function  add(const aRQDDSCodes: RQDDSCodes): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQDDSCodes: RQDDSCodes); stdcall;
    function  getObject(const anObjectCode: Integer): RQDDSCodes; stdcall;
    function  getList: RQDDSCodesShortList; stdcall;
    function  getFilteredList(const aRQDDSCodesFilter: RQDDSCodesFilter): RQDDSCodesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQDDSCodesShortList; stdcall;
    function  getScrollableFilteredList(const aRQDDSCodesFilter: RQDDSCodesFilter; const aFromPosition: Integer; const aQuantity: Integer): RQDDSCodesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQDDSCodesShortList; stdcall;
  end; 


implementation

  destructor RQDDSCodes.Destroy;
  begin
    if Assigned(FparentDDSCodesRef) then
      parentDDSCodesRef.Free;
    inherited Destroy;
  end;
  
  destructor RQDDSCodesFilter.Destroy;
  begin
    if Assigned(FparentDDSCodesRef) then
      parentDDSCodesRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor RQDDSCodesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQDDSCodes, 'http://ksoe.org/EnergyproControllerService/type/', 'RQDDSCodes');
  RemClassRegistry.RegisterXSClass(RQDDSCodesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQDDSCodesRef');
  RemClassRegistry.RegisterXSClass(RQDDSCodesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQDDSCodesFilter');
  RemClassRegistry.RegisterXSClass(RQDDSCodesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQDDSCodesShort');
  RemClassRegistry.RegisterXSClass(RQDDSCodesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQDDSCodesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQDDSCodesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQDDSCodesShort');

  InvRegistry.RegisterInterface(TypeInfo(RQDDSCodesControllerSoapPort), 'http://ksoe.org/RQDDSCodesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQDDSCodesControllerSoapPort), 'http://ksoe.org/RQDDSCodesController/action/RQDDSCodesController.%operationName%');


end.
