unit ENSOValuesTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSOValuesTypeCategoryController
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

  ENSOValuesType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOValuesTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOValuesType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FsortField : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FcategoryRef : ENSOValuesTypeCategoryRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property sortField : Integer read FsortField write FsortField;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property categoryRef : ENSOValuesTypeCategoryRef read FcategoryRef write FcategoryRef;
  end;

{
  ENSOValuesTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FsortField : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FcategoryRef : ENSOValuesTypeCategoryRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property sortField : Integer read FsortField write FsortField;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property categoryRef : ENSOValuesTypeCategoryRef read FcategoryRef write FcategoryRef;
  end;
}

  ENSOValuesTypeFilter = class(ENSOValuesType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSOValuesTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FsortField : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcategoryRefCode : Integer;
    FcategoryRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  sortField : Integer read FsortField write FsortField;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property categoryRefCode : Integer read FcategoryRefCode write FcategoryRefCode;
    property categoryRefName : WideString read FcategoryRefName write FcategoryRefName;
  end;

  ArrayOfENSOValuesTypeShort = array of ENSOValuesTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSOValuesTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSOValuesTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSOValuesTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSOValuesTypeController/message/
  // soapAction: http://ksoe.org/ENSOValuesTypeController/action/ENSOValuesTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSOValuesTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSOValuesTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSOValuesTypeControllerSoapPort = interface(IInvokable)
  ['{1846111E-04A0-44D0-99C1-3BCDCD098569}']
    function add(const aENSOValuesType: ENSOValuesType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSOValuesType: ENSOValuesType); stdcall;
    function getObject(const anObjectCode: Integer): ENSOValuesType; stdcall;
    function getList: ENSOValuesTypeShortList; stdcall;
    function getFilteredList(const aENSOValuesTypeFilter: ENSOValuesTypeFilter): ENSOValuesTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSOValuesTypeShortList; stdcall;
    function getScrollableFilteredList(const aENSOValuesTypeFilter: ENSOValuesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSOValuesTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSOValuesTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSOValuesTypeFilter: ENSOValuesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSOValuesTypeShort; stdcall;
  end;


implementation

  destructor ENSOValuesType.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSOValuesTypeFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSOValuesTypeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSOValuesTypeShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENSOValuesTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSOValuesType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesType');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeRef');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeShort');
  RemClassRegistry.RegisterXSClass(ENSOValuesTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOValuesTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSOValuesTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSOValuesTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSOValuesTypeControllerSoapPort), 'http://ksoe.org/ENSOValuesTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSOValuesTypeControllerSoapPort), 'http://ksoe.org/ENSOValuesTypeController/action/ENSOValuesTypeController.%operationName%');


end.
