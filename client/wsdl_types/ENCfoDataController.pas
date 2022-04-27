unit ENCfoDataController;

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

  ENCfoData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCfoDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCfoData = class(TRemotable)
  private
    Fcode : Integer; 
    FtxtCode : WideString;
    FfkID : Integer; 
    Ffrc_list_id : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property txtCode : WideString read FtxtCode write FtxtCode;
    property  fkID : Integer read FfkID write FfkID; 
    property  frc_list_id : Integer read Ffrc_list_id write Ffrc_list_id; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENCfoDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FtxtCode : WideString;
    FfkID : Integer; 
    Ffrc_list_id : Integer; 
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property txtCode : WideString read FtxtCode write FtxtCode;
    property  fkID : Integer read FfkID write FfkID; 
    property  frc_list_id : Integer read Ffrc_list_id write Ffrc_list_id; 
    property name : WideString read Fname write Fname;
  end;
}

  ENCfoDataFilter = class(ENCfoData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCfoDataShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtxtCode : WideString;
    FfkID : Integer; 
    Ffrc_list_id : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property txtCode : WideString read FtxtCode write FtxtCode;
    property  fkID : Integer read FfkID write FfkID; 
    property  frc_list_id : Integer read Ffrc_list_id write Ffrc_list_id; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENCfoDataShort = array of ENCfoDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCfoDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCfoDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCfoDataShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCfoDataController/message/
  // soapAction: http://ksoe.org/ENCfoDataController/action/ENCfoDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCfoDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCfoDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCfoDataControllerSoapPort = interface(IInvokable)
  ['{687e687e-687e-687e-687e-687e687e687e}']
    function  add(const aENCfoData: ENCfoData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCfoData: ENCfoData); stdcall;
    function  getObject(const anObjectCode: Integer): ENCfoData; stdcall;
    function  getList: ENCfoDataShortList; stdcall;
    function  getFilteredList(const aENCfoDataFilter: ENCfoDataFilter): ENCfoDataShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCfoDataShortList; stdcall;
    function  getScrollableFilteredList(const aENCfoDataFilter: ENCfoDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCfoDataShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCfoDataShortList; stdcall;
  end; 


implementation


  
  destructor ENCfoDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCfoData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCfoData');
  RemClassRegistry.RegisterXSClass(ENCfoDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCfoDataRef');
  RemClassRegistry.RegisterXSClass(ENCfoDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCfoDataFilter');
  RemClassRegistry.RegisterXSClass(ENCfoDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCfoDataShort');
  RemClassRegistry.RegisterXSClass(ENCfoDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCfoDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCfoDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCfoDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCfoDataControllerSoapPort), 'http://ksoe.org/ENCfoDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCfoDataControllerSoapPort), 'http://ksoe.org/ENCfoDataController/action/ENCfoDataController.%operationName%');


end.
