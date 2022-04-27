unit ENSheets4SOItemsTemplateController;

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

  ENSheets4SOItemsTemplate            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SOItemsTemplateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SOItemsTemplate = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtemplateValue : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property templateValue : WideString read FtemplateValue write FtemplateValue;
  end;

{
  ENSheets4SOItemsTemplateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FtemplateValue : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property templateValue : WideString read FtemplateValue write FtemplateValue;
  end;
}

  ENSheets4SOItemsTemplateFilter = class(ENSheets4SOItemsTemplate)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSheets4SOItemsTemplateShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtemplateValue : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property templateValue : WideString read FtemplateValue write FtemplateValue;

  end;

  ArrayOfENSheets4SOItemsTemplateShort = array of ENSheets4SOItemsTemplateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSheets4SOItemsTemplateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSheets4SOItemsTemplateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSheets4SOItemsTemplateShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSheets4SOItemsTemplateController/message/
  // soapAction: http://ksoe.org/ENSheets4SOItemsTemplateController/action/ENSheets4SOItemsTemplateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSheets4SOItemsTemplateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSheets4SOItemsTemplateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSheets4SOItemsTemplateControllerSoapPort = interface(IInvokable)
  ['{5D5E6F18-D5B5-45FE-A10D-248FF9750F1D}']
    function add(const aENSheets4SOItemsTemplate: ENSheets4SOItemsTemplate): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSheets4SOItemsTemplate: ENSheets4SOItemsTemplate); stdcall;
    function getObject(const anObjectCode: Integer): ENSheets4SOItemsTemplate; stdcall;
    function getList: ENSheets4SOItemsTemplateShortList; stdcall;
    function getFilteredList(const aENSheets4SOItemsTemplateFilter: ENSheets4SOItemsTemplateFilter): ENSheets4SOItemsTemplateShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOItemsTemplateShortList; stdcall;
    function getScrollableFilteredList(const aENSheets4SOItemsTemplateFilter: ENSheets4SOItemsTemplateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOItemsTemplateShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOItemsTemplateShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSheets4SOItemsTemplateFilter: ENSheets4SOItemsTemplateFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSheets4SOItemsTemplateShort; stdcall;
  end;


implementation



  destructor ENSheets4SOItemsTemplateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsTemplate, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsTemplate');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsTemplateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsTemplateRef');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsTemplateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsTemplateFilter');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsTemplateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsTemplateShort');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsTemplateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsTemplateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSheets4SOItemsTemplateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSheets4SOItemsTemplateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSheets4SOItemsTemplateControllerSoapPort), 'http://ksoe.org/ENSheets4SOItemsTemplateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSheets4SOItemsTemplateControllerSoapPort), 'http://ksoe.org/ENSheets4SOItemsTemplateController/action/ENSheets4SOItemsTemplateController.%operationName%');


end.
