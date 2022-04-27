unit ENPlanWorkFormController;

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

  ENPlanWorkForm            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkFormRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkForm = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENPlanWorkFormFilter = class(TRemotable)
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


  ENPlanWorkFormShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkFormShort = array of ENPlanWorkFormShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkFormShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkFormShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkFormShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkFormController/message/
  // soapAction: http://ksoe.org/ENPlanWorkFormController/action/ENPlanWorkFormController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkFormControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkFormController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkFormControllerSoapPort = interface(IInvokable)
  ['{51ef51ef-51ef-51ef-51ef-51ef51ef51ef}']
    function  add(const aENPlanWorkForm: ENPlanWorkForm): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkForm: ENPlanWorkForm); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkForm; stdcall;
    function  getList: ENPlanWorkFormShortList; stdcall;
    function  getFilteredList(const aENPlanWorkFormFilter: ENPlanWorkFormFilter): ENPlanWorkFormShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkFormShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkFormFilter: ENPlanWorkFormFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkFormShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkFormShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanWorkFormShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkForm, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkForm');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFormRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFormRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFormFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFormFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFormShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFormShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFormShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFormShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkFormShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkFormShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkFormControllerSoapPort), 'http://ksoe.org/ENPlanWorkFormController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkFormControllerSoapPort), 'http://ksoe.org/ENPlanWorkFormController/action/ENPlanWorkFormController.%operationName%');


end.
