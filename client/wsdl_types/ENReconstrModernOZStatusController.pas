unit ENReconstrModernOZStatusController;

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

  ENReconstrModernOZStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModernOZStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModernOZStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENReconstrModernOZStatusFilter = class(TRemotable)
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

  ENReconstrModernOZStatusFilter = class(ENReconstrModernOZStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENReconstrModernOZStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENReconstrModernOZStatusShort = array of ENReconstrModernOZStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENReconstrModernOZStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENReconstrModernOZStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENReconstrModernOZStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENReconstrModernOZStatusController/message/
  // soapAction: http://ksoe.org/ENReconstrModernOZStatusController/action/ENReconstrModernOZStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENReconstrModernOZStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENReconstrModernOZStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENReconstrModernOZStatusControllerSoapPort = interface(IInvokable)
  ['{191e191e-191e-191e-191e-191e191e191e}']
    function  add(const aENReconstrModernOZStatus: ENReconstrModernOZStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENReconstrModernOZStatus: ENReconstrModernOZStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENReconstrModernOZStatus; stdcall;
    function  getList: ENReconstrModernOZStatusShortList; stdcall;
    function  getFilteredList(const aENReconstrModernOZStatusFilter: ENReconstrModernOZStatusFilter): ENReconstrModernOZStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENReconstrModernOZStatusFilter: ENReconstrModernOZStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENReconstrModernOZStatusFilter: ENReconstrModernOZStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENReconstrModernOZStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENReconstrModernOZStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZStatus');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZStatusRef');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZStatusFilter');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZStatusShort');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENReconstrModernOZStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENReconstrModernOZStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENReconstrModernOZStatusControllerSoapPort), 'http://ksoe.org/ENReconstrModernOZStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENReconstrModernOZStatusControllerSoapPort), 'http://ksoe.org/ENReconstrModernOZStatusController/action/ENReconstrModernOZStatusController.%operationName%');


end.
