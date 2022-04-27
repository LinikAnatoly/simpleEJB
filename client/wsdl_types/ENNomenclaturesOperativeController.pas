unit ENNomenclaturesOperativeController;

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

  ENNomenclaturesOperative            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNomenclaturesOperativeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNomenclaturesOperative = class(TRemotable)
  private
    Fcode : Integer; 
    Fid : Integer; 
    Fnn : WideString;
    Fbal_sch : WideString;
    Fname : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  id : Integer read Fid write Fid; 
    property nn : WideString read Fnn write Fnn;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property name : WideString read Fname write Fname;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
  
{
  ENNomenclaturesOperativeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fid : Integer; 
    Fnn : WideString;
    Fbal_sch : WideString;
    Fname : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  id : Integer read Fid write Fid; 
    property nn : WideString read Fnn write Fnn;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property name : WideString read Fname write Fname;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
}

  ENNomenclaturesOperativeFilter = class(ENNomenclaturesOperative)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENNomenclaturesOperativeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fid : Integer; 
    Fnn : WideString;
    Fbal_sch : WideString;
    Fname : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  id : Integer read Fid write Fid; 
    property nn : WideString read Fnn write Fnn;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property name : WideString read Fname write Fname;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

  end;

  ArrayOfENNomenclaturesOperativeShort = array of ENNomenclaturesOperativeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENNomenclaturesOperativeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENNomenclaturesOperativeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENNomenclaturesOperativeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENNomenclaturesOperativeController/message/
  // soapAction: http://ksoe.org/ENNomenclaturesOperativeController/action/ENNomenclaturesOperativeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENNomenclaturesOperativeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENNomenclaturesOperativeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENNomenclaturesOperativeControllerSoapPort = interface(IInvokable)
  ['{1f981f98-1f98-1f98-1f98-1f981f981f98}']
    function  add(const aENNomenclaturesOperative: ENNomenclaturesOperative): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENNomenclaturesOperative: ENNomenclaturesOperative); stdcall;
    function  getObject(const anObjectCode: Integer): ENNomenclaturesOperative; stdcall;
    function  getList: ENNomenclaturesOperativeShortList; stdcall;
    function  getFilteredList(const aENNomenclaturesOperativeFilter: ENNomenclaturesOperativeFilter): ENNomenclaturesOperativeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENNomenclaturesOperativeShortList; stdcall;
    function  getScrollableFilteredList(const aENNomenclaturesOperativeFilter: ENNomenclaturesOperativeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENNomenclaturesOperativeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENNomenclaturesOperativeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENNomenclaturesOperativeFilter: ENNomenclaturesOperativeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENNomenclaturesOperative.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

{  
  destructor ENNomenclaturesOperativeFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
}

  destructor ENNomenclaturesOperativeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENNomenclaturesOperativeShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENNomenclaturesOperativeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENNomenclaturesOperative, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNomenclaturesOperative');
  RemClassRegistry.RegisterXSClass(ENNomenclaturesOperativeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNomenclaturesOperativeRef');
  RemClassRegistry.RegisterXSClass(ENNomenclaturesOperativeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNomenclaturesOperativeFilter');
  RemClassRegistry.RegisterXSClass(ENNomenclaturesOperativeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNomenclaturesOperativeShort');
  RemClassRegistry.RegisterXSClass(ENNomenclaturesOperativeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNomenclaturesOperativeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENNomenclaturesOperativeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENNomenclaturesOperativeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENNomenclaturesOperativeControllerSoapPort), 'http://ksoe.org/ENNomenclaturesOperativeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENNomenclaturesOperativeControllerSoapPort), 'http://ksoe.org/ENNomenclaturesOperativeController/action/ENNomenclaturesOperativeController.%operationName%');


end.
