unit ENTechContragentFormController;

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

  ENTechContragentForm            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechContragentFormRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechContragentForm = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTechContragentFormFilter = class(TRemotable)
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

  ENTechContragentFormFilter = class(ENTechContragentForm)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechContragentFormShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTechContragentFormShort = array of ENTechContragentFormShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechContragentFormShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechContragentFormShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechContragentFormShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechContragentFormController/message/
  // soapAction: http://ksoe.org/ENTechContragentFormController/action/ENTechContragentFormController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechContragentFormControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechContragentFormController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechContragentFormControllerSoapPort = interface(IInvokable)
  ['{99509950-9950-9950-9950-995099509950}']
    function  add(const aENTechContragentForm: ENTechContragentForm): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechContragentForm: ENTechContragentForm); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechContragentForm; stdcall;
    function  getList: ENTechContragentFormShortList; stdcall;
    function  getFilteredList(const aENTechContragentFormFilter: ENTechContragentFormFilter): ENTechContragentFormShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechContragentFormShortList; stdcall;
    function  getScrollableFilteredList(const aENTechContragentFormFilter: ENTechContragentFormFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechContragentFormShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechContragentFormShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechContragentFormFilter: ENTechContragentFormFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTechContragentFormShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechContragentForm, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentForm');
  RemClassRegistry.RegisterXSClass(ENTechContragentFormRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentFormRef');
  RemClassRegistry.RegisterXSClass(ENTechContragentFormFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentFormFilter');
  RemClassRegistry.RegisterXSClass(ENTechContragentFormShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentFormShort');
  RemClassRegistry.RegisterXSClass(ENTechContragentFormShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentFormShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechContragentFormShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechContragentFormShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechContragentFormControllerSoapPort), 'http://ksoe.org/ENTechContragentFormController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechContragentFormControllerSoapPort), 'http://ksoe.org/ENTechContragentFormController/action/ENTechContragentFormController.%operationName%');


end.
