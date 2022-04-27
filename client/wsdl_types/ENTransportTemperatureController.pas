unit ENTransportTemperatureController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportDepartmentController 
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

  ENTransportTemperature            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportTemperatureRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportTemperature = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FtransportDepartmentRef : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportDepartmentRef : ENTransportDepartmentRef read FtransportDepartmentRef write FtransportDepartmentRef; 
  end;
  
{
  ENTransportTemperatureFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FtransportDepartmentRef : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportDepartmentRef : ENTransportDepartmentRef read FtransportDepartmentRef write FtransportDepartmentRef; 
  end;
}

  ENTransportTemperatureFilter = class(ENTransportTemperature)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportTemperatureShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FdateGen : TXSDate;	
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FtransportDepartmentRefCode : Integer; 
    FtransportDepartmentRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property transportDepartmentRefCode : Integer read FtransportDepartmentRefCode write FtransportDepartmentRefCode; 
    property transportDepartmentRefName : WideString read FtransportDepartmentRefName write FtransportDepartmentRefName; 
  end;

  ArrayOfENTransportTemperatureShort = array of ENTransportTemperatureShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportTemperatureShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportTemperatureShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportTemperatureShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportTemperatureController/message/
  // soapAction: http://ksoe.org/ENTransportTemperatureController/action/ENTransportTemperatureController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportTemperatureControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportTemperatureController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportTemperatureControllerSoapPort = interface(IInvokable)
  ['{b113b113-b113-b113-b113-b113b113b113}']
    function  add(const aENTransportTemperature: ENTransportTemperature): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportTemperature: ENTransportTemperature); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportTemperature; stdcall;
    function  getList: ENTransportTemperatureShortList; stdcall;
    function  getFilteredList(const aENTransportTemperatureFilter: ENTransportTemperatureFilter): ENTransportTemperatureShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportTemperatureShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportTemperatureFilter: ENTransportTemperatureFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportTemperatureShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportTemperatureShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportTemperatureFilter: ENTransportTemperatureFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportTemperature.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtransportDepartmentRef) then
      transportDepartmentRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportTemperatureFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtransportDepartmentRef) then
      transportDepartmentRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportTemperatureFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportTemperatureShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportTemperatureShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportTemperature, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportTemperature');
  RemClassRegistry.RegisterXSClass(ENTransportTemperatureRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportTemperatureRef');
  RemClassRegistry.RegisterXSClass(ENTransportTemperatureFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportTemperatureFilter');
  RemClassRegistry.RegisterXSClass(ENTransportTemperatureShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportTemperatureShort');
  RemClassRegistry.RegisterXSClass(ENTransportTemperatureShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportTemperatureShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportTemperatureShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportTemperatureShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportTemperatureControllerSoapPort), 'http://ksoe.org/ENTransportTemperatureController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportTemperatureControllerSoapPort), 'http://ksoe.org/ENTransportTemperatureController/action/ENTransportTemperatureController.%operationName%');


end.
