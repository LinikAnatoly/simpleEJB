unit ENSOValuesTypeCategoryController;

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

  ENSOValuesTypeCategory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOValuesTypeCategoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOValuesTypeCategory = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENSOValuesTypeCategoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENSOValuesTypeCategoryFilter = class(ENSOValuesTypeCategory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSOValuesTypeCategoryShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENSOValuesTypeCategoryShort = array of ENSOValuesTypeCategoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSOValuesTypeCategoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSOValuesTypeCategoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSOValuesTypeCategoryShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSOValuesTypeCategoryController/message/
  // soapAction: http://ksoe.org/ENSOValuesTypeCategoryController/action/ENSOValuesTypeCategoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSOValuesTypeCategoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSOValuesTypeCategoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSOValuesTypeCategoryControllerSoapPort = interface(IInvokable)
  ['{EAF14250-BF77-41B6-A5F5-7E90694437FA}']
    function add(const aENSOValuesTypeCategory: ENSOValuesTypeCategory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSOValuesTypeCategory: ENSOValuesTypeCategory); stdcall;
    function getObject(const anObjectCode: Integer): ENSOValuesTypeCategory; stdcall;
    function getList: ENSOValuesTypeCategoryShortList; stdcall;
    function getFilteredList(const aENSOValuesTypeCategoryFilter: ENSOValuesTypeCategoryFilter): ENSOValuesTypeCategoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSOValuesTypeCategoryShortList; stdcall;
    function getScrollableFilteredList(const aENSOValuesTypeCategoryFilter: ENSOValuesTypeCategoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSOValuesTypeCategoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSOValuesTypeCategoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSOValuesTypeCategoryFilter: ENSOValuesTypeCategoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSOValuesTypeCategoryShort; stdcall;
  end;


implementation



  destructor ENSOValuesTypeCategoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSOValuesTypeCategory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeCategory');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeCategoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeCategoryRef');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeCategoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeCategoryFilter');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeCategoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeCategoryShort');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeCategoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeCategoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSOValuesTypeCategoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSOValuesTypeCategoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSOValuesTypeCategoryControllerSoapPort), 'http://ksoe.org/ENSOValuesTypeCategoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSOValuesTypeCategoryControllerSoapPort), 'http://ksoe.org/ENSOValuesTypeCategoryController/action/ENSOValuesTypeCategoryController.%operationName%');


end.
