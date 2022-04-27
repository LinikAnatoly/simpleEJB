unit ENVoltageClassController;

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

  ENVoltageClass            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENVoltageClassRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENVoltageClass = class(TRemotable)
  private
    Fcode : Integer; 
    Fvalue : TXSDecimal;
    Fdescription : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property value : TXSDecimal read Fvalue write Fvalue; 
    property description : WideString read Fdescription write Fdescription;
  end;
  
{
  ENVoltageClassFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fvalue : TXSDecimal;
    Fdescription : WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property value : TXSDecimal read Fvalue write Fvalue; 
    property description : WideString read Fdescription write Fdescription;
  end;
}

  ENVoltageClassFilter = class(ENVoltageClass)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENVoltageClassShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fvalue : TXSDecimal;
    Fdescription : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property value : TXSDecimal read Fvalue write Fvalue; 
    property description : WideString read Fdescription write Fdescription;

  end;

  ArrayOfENVoltageClassShort = array of ENVoltageClassShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENVoltageClassShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENVoltageClassShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENVoltageClassShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENVoltageClassController/message/
  // soapAction: http://ksoe.org/ENVoltageClassController/action/ENVoltageClassController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENVoltageClassControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENVoltageClassController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENVoltageClassControllerSoapPort = interface(IInvokable)
  ['{8FD3D975-79A5-44ED-ABAB-6C330E139314}']
    function  add(const aENVoltageClass: ENVoltageClass): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENVoltageClass: ENVoltageClass); stdcall;
    function  getObject(const anObjectCode: Integer): ENVoltageClass; stdcall;
    function  getList: ENVoltageClassShortList; stdcall;
    function  getFilteredList(const aENVoltageClassFilter: ENVoltageClassFilter): ENVoltageClassShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENVoltageClassShortList; stdcall;
    function  getScrollableFilteredList(const aENVoltageClassFilter: ENVoltageClassFilter; const aFromPosition: Integer; const aQuantity: Integer): ENVoltageClassShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENVoltageClassShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENVoltageClassFilter: ENVoltageClassFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENVoltageClass.Destroy;
  begin
    if Assigned(Fvalue) then
      value.Free;
    inherited Destroy;
  end;

{  
  destructor ENVoltageClassFilter.Destroy;
  begin
    if Assigned(Fvalue) then
      value.Free;
    inherited Destroy;
  end; 
}

  destructor ENVoltageClassFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENVoltageClassShort.Destroy;
  begin
    if Assigned(Fvalue) then
      value.Free;
    inherited Destroy;
  end; 
  
  destructor ENVoltageClassShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENVoltageClass, 'http://ksoe.org/EnergyproControllerService/type/', 'ENVoltageClass');
  RemClassRegistry.RegisterXSClass(ENVoltageClassRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENVoltageClassRef');
  RemClassRegistry.RegisterXSClass(ENVoltageClassFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENVoltageClassFilter');
  RemClassRegistry.RegisterXSClass(ENVoltageClassShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENVoltageClassShort');
  RemClassRegistry.RegisterXSClass(ENVoltageClassShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENVoltageClassShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENVoltageClassShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENVoltageClassShort');

  InvRegistry.RegisterInterface(TypeInfo(ENVoltageClassControllerSoapPort), 'http://ksoe.org/ENVoltageClassController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENVoltageClassControllerSoapPort), 'http://ksoe.org/ENVoltageClassController/action/ENVoltageClassController.%operationName%');


end.
