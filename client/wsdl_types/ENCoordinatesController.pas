unit ENCoordinatesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
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

  ENCoordinates            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCoordinatesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCoordinates = class(TRemotable)
  private
    Fcode : Integer; 
    Flatitude : TXSDecimal;
    Flongitude : TXSDecimal;
    Flatitude2 : TXSDecimal;
    Flongitude2 : TXSDecimal;
    FgeographicCode : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property latitude : TXSDecimal read Flatitude write Flatitude; 
    property longitude : TXSDecimal read Flongitude write Flongitude; 
    property latitude2 : TXSDecimal read Flatitude2 write Flatitude2; 
    property longitude2 : TXSDecimal read Flongitude2 write Flongitude2; 
    property geographicCode : WideString read FgeographicCode write FgeographicCode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property element : ENElement read Felement write Felement; 
  end;
  
{
  ENCoordinatesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Flatitude : TXSDecimal;
    Flongitude : TXSDecimal;
    Flatitude2 : TXSDecimal;
    Flongitude2 : TXSDecimal;
    FgeographicCode : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property latitude : TXSDecimal read Flatitude write Flatitude; 
    property longitude : TXSDecimal read Flongitude write Flongitude; 
    property latitude2 : TXSDecimal read Flatitude2 write Flatitude2; 
    property longitude2 : TXSDecimal read Flongitude2 write Flongitude2; 
    property geographicCode : WideString read FgeographicCode write FgeographicCode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property element : ENElement read Felement write Felement; 
  end;
}

  ENCoordinatesFilter = class(ENCoordinates)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCoordinatesShort = class(TRemotable)
  private
    Fcode : Integer; 
    Flatitude : TXSDecimal;
    Flongitude : TXSDecimal;
    Flatitude2 : TXSDecimal;
    Flongitude2 : TXSDecimal;
    FgeographicCode : WideString;
    FuserGen : WideString;
    FelementCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property latitude : TXSDecimal read Flatitude write Flatitude; 
    property longitude : TXSDecimal read Flongitude write Flongitude; 
    property latitude2 : TXSDecimal read Flatitude2 write Flatitude2; 
    property longitude2 : TXSDecimal read Flongitude2 write Flongitude2; 
    property geographicCode : WideString read FgeographicCode write FgeographicCode;
    property userGen : WideString read FuserGen write FuserGen;

    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENCoordinatesShort = array of ENCoordinatesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCoordinatesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCoordinatesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCoordinatesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCoordinatesController/message/
  // soapAction: http://ksoe.org/ENCoordinatesController/action/ENCoordinatesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCoordinatesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCoordinatesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCoordinatesControllerSoapPort = interface(IInvokable)
  ['{428c428c-428c-428c-428c-428c428c428c}']
    function  add(const aENCoordinates: ENCoordinates): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCoordinates: ENCoordinates); stdcall;
    function  getObject(const anObjectCode: Integer): ENCoordinates; stdcall;
    function  getList: ENCoordinatesShortList; stdcall;
    function  getFilteredList(const aENCoordinatesFilter: ENCoordinatesFilter): ENCoordinatesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCoordinatesShortList; stdcall;
    function  getScrollableFilteredList(const aENCoordinatesFilter: ENCoordinatesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCoordinatesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCoordinatesShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCoordinatesFilter: ENCoordinatesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENCoordinates.Destroy;
  begin
    if Assigned(Flatitude) then
      latitude.Free;
    if Assigned(Flongitude) then
      longitude.Free;
    if Assigned(Flatitude2) then
      latitude2.Free;
    if Assigned(Flongitude2) then
      longitude2.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{  
  destructor ENCoordinatesFilter.Destroy;
  begin
    if Assigned(Flatitude) then
      latitude.Free;
    if Assigned(Flongitude) then
      longitude.Free;
    if Assigned(Flatitude2) then
      latitude2.Free;
    if Assigned(Flongitude2) then
      longitude2.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
}

  destructor ENCoordinatesFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENCoordinatesShort.Destroy;
  begin
    if Assigned(Flatitude) then
      latitude.Free;
    if Assigned(Flongitude) then
      longitude.Free;
    if Assigned(Flatitude2) then
      latitude2.Free;
    if Assigned(Flongitude2) then
      longitude2.Free;
    inherited Destroy;
  end; 
  
  destructor ENCoordinatesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCoordinates, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoordinates');
  RemClassRegistry.RegisterXSClass(ENCoordinatesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoordinatesRef');
  RemClassRegistry.RegisterXSClass(ENCoordinatesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoordinatesFilter');
  RemClassRegistry.RegisterXSClass(ENCoordinatesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoordinatesShort');
  RemClassRegistry.RegisterXSClass(ENCoordinatesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoordinatesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCoordinatesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCoordinatesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCoordinatesControllerSoapPort), 'http://ksoe.org/ENCoordinatesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCoordinatesControllerSoapPort), 'http://ksoe.org/ENCoordinatesController/action/ENCoordinatesController.%operationName%');


end.
