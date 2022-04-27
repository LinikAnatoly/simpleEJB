unit ENRecoModTypeWorkController;

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

  ENRecoModTypeWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRecoModTypeWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRecoModTypeWork = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENRecoModTypeWorkFilter = class(TRemotable)
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

  ENRecoModTypeWorkFilter = class(ENRecoModTypeWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENRecoModTypeWorkShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENRecoModTypeWorkShort = array of ENRecoModTypeWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRecoModTypeWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRecoModTypeWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRecoModTypeWorkShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRecoModTypeWorkController/message/
  // soapAction: http://ksoe.org/ENRecoModTypeWorkController/action/ENRecoModTypeWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRecoModTypeWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRecoModTypeWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRecoModTypeWorkControllerSoapPort = interface(IInvokable)
  ['{19d919d9-19d9-19d9-19d9-19d919d919d9}']
    function  add(const aENRecoModTypeWork: ENRecoModTypeWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRecoModTypeWork: ENRecoModTypeWork); stdcall;
    function  getObject(const anObjectCode: Integer): ENRecoModTypeWork; stdcall;
    function  getList: ENRecoModTypeWorkShortList; stdcall;
    function  getFilteredList(const aENRecoModTypeWorkFilter: ENRecoModTypeWorkFilter): ENRecoModTypeWorkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRecoModTypeWorkShortList; stdcall;
    function  getScrollableFilteredList(const aENRecoModTypeWorkFilter: ENRecoModTypeWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRecoModTypeWorkShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRecoModTypeWorkShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENRecoModTypeWorkFilter: ENRecoModTypeWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENRecoModTypeWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRecoModTypeWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecoModTypeWork');
  RemClassRegistry.RegisterXSClass(ENRecoModTypeWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecoModTypeWorkRef');
  RemClassRegistry.RegisterXSClass(ENRecoModTypeWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecoModTypeWorkFilter');
  RemClassRegistry.RegisterXSClass(ENRecoModTypeWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecoModTypeWorkShort');
  RemClassRegistry.RegisterXSClass(ENRecoModTypeWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecoModTypeWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRecoModTypeWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRecoModTypeWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRecoModTypeWorkControllerSoapPort), 'http://ksoe.org/ENRecoModTypeWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRecoModTypeWorkControllerSoapPort), 'http://ksoe.org/ENRecoModTypeWorkController/action/ENRecoModTypeWorkController.%operationName%');


end.
